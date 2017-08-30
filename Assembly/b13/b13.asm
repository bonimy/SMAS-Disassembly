; Super Mario All-Stars   (U) disassembly                        ;
; Disassembled by Roy and Ersanio and imamelia and wiiqwertyuiop ;

ORG $138000
    fillbyte $FF : fill $8000

ORG $138000
DATA_138000:        dw $F000
                    dw $F800
                    dw $F000
                    dw $8000
                    dw $F000
                    dw $F800
                    dw $8800
 
DATA_13800E:        db $16,$16,$16,$17,$16,$16,$17

DATA_138015:        dw $D800
                    dw $9800
                    dw $D800
                    dw $A000
                    dw $D800
                    dw $9800
                    dw $A800

DATA_138023:        db $16,$17,$16,$17,$16,$17,$17

DATA_13802A:        dw $D000
                    dw $D800
                    dw $D000
                    dw $E000
                    dw $E800
                    dw $D800
                    dw $F000

DATA_138038:        dw $8000
                    dw $9000
                    dw $8000
                    dw $A000
                    dw $8000
                    dw $9000
                    dw $B000

DATA_138046:        db $18,$18,$18,$18,$18,$18,$18

DATA_13804D:        dw $C800
                    dw $C800
                    dw $C800
                    dw $C800
                    dw $C800
                    dw $C800
                    dw $C800

DATA_13805B:        db $18,$18,$18,$18,$18,$18,$18
                   
CODE_138062:        REP   #$20            ; Accumulator = 16-bit.           
                    LDA.w #$E000          ; \ Load sprite GFX tiles 00-7F. (00-1F will get overwritten)
                    STA.b $0D             ;  | ($19E000)
                    LDX.b #$19            ;  |
                    STX.b $0F             ; /
                    LDA.w #$1000          ; \ Amount of bytes to transfer = #$1000. 
                    STA.b $0B             ; /
                    LDA.w #$6000          ; \ First GFX slot. 
                    JSR.w CODE_138AE7     ; / Transfer to VRAM.
                    LDA.w #$C000          ; \ Load sprite GFX tiles 80-13F.
                    STA.b $0D             ;  | ($16C000)
                    LDX.b #$16            ;  |
                    STX.b $0F             ; /
                    LDA.w #$1800          ; \ Amount of bytes to transfer = #$1800. 
                    STA.b $0B             ; /
                    LDA.w #$6800          ; \ Second and first half of third GFX slots. 
                    JSR.w CODE_138AE7     ; / Transfer to VRAM.
                    LDA.w $0635           ; \ Get world number into Y, *2 into X index.
                    AND.w #$00FF          ;  |
                    TAY                   ;  |
                    ASL   A               ;  |
                    TAX                   ; /
                    PHX                   ; Hold X to get later. 
                    LDA.l DATA_138000,x     ; \ Load sprite GFX tiles 140-17F from pointer.
                    STA.b $0D             ;  |
                    TYX                   ;  |
                    LDA.l DATA_13800E,x     ;  |     
                    TAX                   ;  |
                    STX.b $0F             ; /
                    LDA.w #$0800          ; \ Amount of bytes to transfer = #$0800.
                    STA.b $0B             ; /
                    LDA.w #$7400          ; \ Second half of third GFX slot. 
                    JSR.w CODE_138AE7     ; / Transfer to VRAM.
                    PLX                   ; \ Get world number * 2 back.
                    PHX                   ; /
                    LDA.l DATA_138015,x     ; \ Load sprite GFX tiles 180-1BF from pointer.
                    STA.b $0D             ;  |
                    TYX                   ;  |
                    LDA.l DATA_138023,x     ;  |     
                    TAX                   ;  |
                    STX.b $0F             ; /
                    LDA.w #$0800          ; \ Amount of bytes to transfer = #$0800. 
                    STA.b $0B             ; /
                    LDA.w #$7800          ; \ First half of fourth GFX slot. 
                    JSR.w CODE_138AE7     ; / Transfer to VRAM.
                    LDA.w #$9000          ; \ Load sprite GFX tiles 1C0-1FF.
                    STA.b $0D             ;  | ($179000)
                    LDX.b #$17            ;  |
                    STX.b $0F             ; /
                    LDA.w #$0800          ; \ Amount of bytes to transfer = #$0800. 
                    STA.b $0B             ; /
                    LDA.w #$7C00          ; \ Second half of fourth GFX slot. 
                    JSR.w CODE_138AE7     ; / Transfer to VRAM.
                    PLX                   ; \ Get world number * 2 back.
                    PHX                   ; /
                    LDA.l DATA_138038,x     ; \ Load layer GFX tiles 00-7F from pointer.      
                    STA.b $0D             ;  |
                    TYX                   ;  |
                    LDA.l DATA_138046,x     ;  |     
                    TAX                   ;  |
                    STX.b $0F             ; /
                    LDA.w #$1000          ; \ Amount of bytes to transfer = #$1000.
                    STA.b $0B             ; /
                    LDA.w #$2000          ; \ First GFX slot.
                    JSR.w CODE_138AC4     ; / Transfer to VRAM.
                    LDA.w #$C000          ; \ Load layer GFX tiles 80-BF.
                    STA.b $0D             ;  | ($18C000)
                    LDX.b #$18            ;  |
                    STX.b $0F             ; /
                    LDA.w #$0800          ; \ Amount of bytes to transfer = #$0800. 
                    STA.b $0B             ; /
                    LDA.w #$2800          ; \ First half of second GFX slot.
                    JSR.w CODE_138AC4     ; / Transfer to VRAM.
                    PLX                   ; Get world num * 2. 
                    LDA.l DATA_13804D,x     ; \ Load layer GFX tiles C0-FF from pointer.
                    STA.b $0D             ;  |
                    TYX                   ;  |
                    LDA.l DATA_13805B,x     ;  |     
                    TAX                   ;  |
                    STX.b $0F             ; /
                    LDA.w #$0800          ; \ Amount of bytes to transfer = #$0800. 
                    STA.b $0B             ; /
                    LDA.w #$2C00          ; \ Second half of second GFX slot.
                    JSR.w CODE_138AC4     ; / Transfer to VRAM.
                    SEP   #$20            ; Accumulator = 8-bit.
                    RTL                   ; Return.

DATA_13812A:        db $C8,$C8,$C8,$C8,$C8,$C8,$00,$00
                    db $00,$00,$C8,$C8,$C8,$C8,$C8,$00
                    db $00,$00,$00,$00,$C8,$B8,$00,$00
                    db $00,$00,$00,$00,$00,$00,$F0,$80
                    db $80,$00,$F0,$00,$00,$00,$00,$00
                    db $80,$F0,$80,$80,$F0,$80,$00,$00
                    db $00,$00,$80,$F0,$80,$80,$80,$80
                    db $80,$B8,$00,$00,$C8,$C8,$C8,$C8
                    db $C8,$00,$00,$00,$00,$00,$C8,$C8
                    db $C8,$00,$00,$00,$00,$00,$00,$00
                    db $C8,$C8,$00,$00,$00,$00,$B8,$C8
                    db $00,$00,$A0,$A0,$00,$00,$00,$00
                    db $00,$00,$00,$00,$B0,$A0,$A0,$00
                    db $B0,$00,$00,$00,$00,$00,$B0,$A0
                    db $00,$00,$00,$B8,$B0,$B0,$00,$00
                    db $C8,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$B8,$B8,$B8,$B8,$B8
                    db $00,$00,$00,$00,$00,$C8,$00,$00
                    db $00,$00,$00,$00,$00,$00,$F0,$80
                    db $80,$80,$80,$80,$F0,$00,$00,$00
                    db $80,$B8,$80,$00,$00,$00,$00,$00
                    db $00,$00,$80,$F0,$80,$00,$00,$80
                    db $80,$00,$00,$00,$00,$C0,$C0,$00
                    db $D0,$D0,$00,$00,$00,$00,$00,$D0
                    db $D0,$D0,$D0,$D0,$D0,$D0,$D0,$00
         
DATA_1381F2:        db $D0,$D0,$D0,$D0,$D0,$D0,$00,$00
                    db $00,$00,$D0,$D0,$D0,$D0,$D0,$00
                    db $00,$00,$00,$00,$D0,$C0,$E0,$E0
                    db $E0,$00,$00,$00,$00,$00,$F8,$88
                    db $88,$00,$F8,$00,$00,$00,$00,$00
                    db $88,$F8,$88,$88,$F8,$88,$00,$00
                    db $00,$00,$88,$F8,$88,$88,$88,$88
                    db $88,$C0,$00,$00,$D0,$D0,$D0,$D0
                    db $D0,$00,$00,$00,$00,$00,$D0,$D0
                    db $D0,$00,$00,$00,$00,$00,$00,$00
                    db $D0,$D0,$E0,$E0,$E0,$E0,$C0,$D0
                    db $E0,$00,$A8,$A8,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$A8,$A8,$00
                    db $00,$00,$00,$00,$00,$00,$00,$A8
                    db $E0,$E0,$00,$C0,$00,$00,$00,$00
                    db $D0,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$98,$98,$98,$98,$98
                    db $00,$00,$00,$00,$00,$D0,$00,$D0
                    db $00,$00,$00,$00,$00,$00,$F8,$88
                    db $88,$88,$88,$88,$F8,$00,$00,$00
                    db $88,$98,$88,$00,$00,$00,$00,$00
                    db $00,$00,$88,$F8,$88,$00,$00,$88
                    db $88,$00,$00,$00,$00,$C8,$C8,$00
                    db $D8,$D8,$00,$00,$00,$00,$00,$D8
                    db $D8,$D8,$D8,$D8,$D8,$D8,$D8,$00

DATA_1382BA:        db $D8,$D8,$D8,$D8,$D8,$D8,$00,$00
                    db $00,$00,$D8,$D8,$D8,$D8,$D8,$00
                    db $00,$00,$00,$00,$D8,$C8,$E8,$E8
                    db $E8,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$90,$00,$00,$90,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$C8,$00,$00,$D8,$D8,$D8,$D8
                    db $D8,$00,$00,$00,$00,$00,$D8,$D8
                    db $D8,$00,$00,$00,$00,$00,$00,$00
                    db $D8,$D8,$E8,$E8,$E8,$E8,$C8,$E8
                    db $E8,$00,$98,$98,$00,$00,$00,$00
                    db $00,$00,$00,$00,$B0,$98,$98,$00
                    db $B0,$00,$00,$00,$00,$00,$B0,$98
                    db $E8,$E8,$00,$C8,$B0,$B0,$00,$00
                    db $D8,$D8,$D8,$00,$00,$00,$00,$00
                    db $00,$00,$D8,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$D8,$00,$D8,$D8
                    db $00,$D8,$00,$00,$00,$00,$90,$00
                    db $00,$00,$00,$00,$90,$00,$00,$00
                    db $00,$E8,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$F8,$F8,$00
                    db $E0,$E0,$00,$00,$00,$00,$00,$E0
                    db $E0,$E0,$E0,$E0,$E0,$E0,$E0,$00

DATA_138382:        db $1B,$1B,$1B,$1B,$1B,$1B,$00,$00
                    db $00,$00,$1B,$1B,$1B,$1B,$1B,$00
                    db $00,$00,$00,$00,$1B,$1D,$1B,$1B
                    db $1B,$1B,$00,$00,$00,$00,$1B,$1C
                    db $1C,$00,$1B,$00,$00,$00,$00,$00
                    db $1C,$1B,$1C,$1C,$1B,$1C,$00,$00
                    db $00,$00,$1C,$1B,$1C,$1C,$1C,$1C
                    db $1C,$1D,$00,$00,$1B,$1B,$1B,$1B
                    db $1B,$00,$00,$00,$00,$00,$1B,$1B
                    db $1B,$00,$00,$00,$00,$00,$00,$00
                    db $1B,$1B,$1B,$1B,$1B,$1B,$1D,$1B
                    db $1B,$00,$1C,$1C,$00,$00,$00,$00
                    db $00,$00,$00,$00,$1C,$1C,$1C,$00
                    db $1C,$00,$00,$00,$00,$00,$1C,$1C
                    db $00,$1C,$00,$1D,$1C,$1C,$00,$00
                    db $1B,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$1C,$1C,$1C,$1C,$1C
                    db $00,$00,$00,$00,$00,$1B,$00,$00
                    db $00,$00,$00,$00,$00,$00,$1B,$1C
                    db $1C,$1C,$1C,$1C,$1B,$00,$00,$00
                    db $1C,$1C,$1C,$00,$00,$00,$00,$00
                    db $00,$00,$1C,$1B,$1C,$00,$00,$1C
                    db $1C,$00,$00,$00,$00,$1C,$1C,$00
                    db $1C,$1C,$00,$00,$00,$00,$00,$1C
                    db $1C,$1C,$1C,$1C,$1C,$1C,$1C,$00

DATA_13844A:        db $1B,$1B,$1B,$1B,$1B,$1B,$00,$00
                    db $00,$00,$1B,$1B,$1B,$1B,$1B,$00
                    db $00,$00,$00,$00,$1B,$1D,$1B,$1B
                    db $1B,$00,$00,$00,$00,$00,$1B,$1C
                    db $1C,$00,$1B,$00,$00,$00,$00,$00
                    db $1C,$1B,$1C,$1C,$1B,$1C,$00,$00
                    db $00,$00,$1C,$1B,$1C,$1C,$1C,$1C
                    db $1C,$1D,$00,$00,$1B,$1B,$1B,$1B
                    db $1B,$00,$00,$00,$00,$00,$1B,$1B
                    db $1B,$00,$00,$00,$00,$00,$00,$00
                    db $1B,$1B,$1B,$1B,$1B,$1B,$1D,$1B
                    db $1B,$00,$1C,$1C,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$1C,$1C,$00
                    db $00,$00,$00,$00,$00,$00,$00,$1C
                    db $1B,$1B,$00,$1D,$00,$00,$00,$00
                    db $1B,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$1C,$1C,$1C,$1C,$1C
                    db $00,$00,$00,$00,$00,$1B,$00,$1B
                    db $00,$00,$00,$00,$00,$00,$1B,$1C
                    db $1C,$1C,$1C,$1C,$1B,$00,$00,$00
                    db $1C,$1C,$1C,$00,$00,$00,$00,$00
                    db $00,$00,$1C,$1B,$1C,$00,$00,$1C
                    db $1C,$00,$00,$00,$00,$1C,$1C,$00
                    db $1C,$1C,$00,$00,$00,$00,$00,$1C
                    db $1C,$1C,$1C,$1C,$1C,$1C,$1C,$00

DATA_138512:        db $1B,$1B,$1B,$1B,$1B,$1B,$00,$00
                    db $00,$00,$1B,$1B,$1B,$1B,$1B,$00
                    db $00,$00,$00,$00,$1B,$1D,$1B,$1B
                    db $1B,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$1C,$00,$00,$1C,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$1D,$00,$00,$1B,$1B,$1B,$1B
                    db $1B,$00,$00,$00,$00,$00,$1B,$1B
                    db $1B,$00,$00,$00,$00,$00,$00,$00
                    db $1B,$1B,$1B,$1B,$1B,$1B,$1D,$1C
                    db $1B,$00,$1C,$1C,$00,$00,$00,$00
                    db $00,$00,$00,$00,$1C,$1C,$1C,$00
                    db $1C,$00,$00,$00,$00,$00,$1C,$1C
                    db $1B,$1B,$00,$1D,$1C,$1C,$00,$00
                    db $1B,$1B,$1B,$00,$00,$00,$00,$00
                    db $00,$00,$1B,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$1B,$00,$1B,$1B
                    db $00,$1B,$00,$00,$00,$00,$1C,$00
                    db $00,$00,$00,$00,$1C,$00,$00,$00
                    db $00,$1C,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$1C,$1C,$00
                    db $1C,$1C,$00,$00,$00,$00,$00,$1C
                    db $1C,$1C,$1C,$1C,$1C,$1C,$1C,$00

CODE_1385DA:        LDA.w $0770
                    BEQ   CODE_1385E3           
                    LDA.b #$06                  
                    BRA   CODE_1385E6           

CODE_1385E3:        LDA.w $0534               ; \ Get level + room number into index.
CODE_1385E6:        STA.b $00                 ;  |
                    STZ.b $01                 ;  |
                    REP   #$30                ;  | Accumulator & Index = 16-bit.
                    LDA.w $0533               ;  |
                    AND.w #$00FF              ;  |
                    TAX                       ;  |
                    LDA.l DATA_11D098,x         ;  | 
                    AND.w #$00FF              ;  |
                    CLC                       ;  |
                    ADC.b $00                 ;  |
                    TAX                       ; /
                    LDA.l DATA_13812A,x         ; \ Tiles of the FG/BG slots 140-17F, high byte.
                    AND.w #$00FF              ;  |
                    XBA                       ;  |
                    STA.w $02CB               ; /
                    LDA.l DATA_1381F2,x         ; \ Tiles of the FG/BG slots 180-1BF, high byte.
                    AND.w #$00FF              ;  |
                    XBA                       ;  |
                    STA.w $02CD               ; /
                    LDA.l DATA_1382BA,x         ; \ Tiles of the FG/BG slots 1C0-1FF, high byte.  
                    AND.w #$00FF              ;  |
                    XBA                       ;  |
                    STA.w $02CF               ; /
                    LDA.l DATA_138382,x         ; \ Tiles of the FG/BG slots 140-17F, bank byte.     
                    STA.w $02D1               ; /
                    LDA.l DATA_13844A,x         ; \ Tiles of the FG/BG slots 180-1BF, bank byte.  
                    STA.w $02D3               ; /
                    LDA.l DATA_138512,x         ; \ Tiles of the FG/BG slots 1C0-1FF, bank byte.  
                    STA.w $02D5               ; /
                    SEP   #$10                ; Index = 8-bit.
                    LDX.w $0635               ; \ If not in World 7, branch.
                    CPX.b #$06                ;  |
                    BNE   CODE_138646         ; /
                    LDA.w #$B000              ; \ $1DB000 = Tiles of the FG/BG slots 100-13F
                    STA.b $0D                 ;  | Metal ground graphics.
                    LDX.b #$1D                ;  |
                    BRA   CODE_13864D         ; /

CODE_138646:        LDA.w #$C000              ; \ $1BC000 = Tiles of the FG/BG slots 100-13F.
                    STA.b $0D                 ;  |
                    LDX.b #$1B                ;  |
CODE_13864D:        STX.b $0F                 ; /
                    LDA.w #$0800              ; \ Amount of bytes to transfer = #$0800.
                    STA.b $0B                 ; /
                    LDA.w #$3000              ; \ First half of third GFX slot.
                    JSR.w CODE_138AC4         ; / Transfer to VRAM.
                    LDA.w $02CB               ; \ Load tiles 140-17F of the FG/BG slots from pointer.
                    STA.b $0D                 ;  |
                    LDX.w $02D1               ;  |
                    STX.b $0F                 ; /
                    LDA.w #$0800              ; \ Amount of bytes to transfer = #$0800.
                    STA.b $0B                 ; /
                    LDA.w #$3400              ; \ Second half of third GFX slot.
                    JSR.w CODE_138AC4         ; / Transfer to VRAM.
                    LDA.w $02CD               ; \ Load tiles 180-1BF of the FG/BG slots from pointer.
                    STA.b $0D                 ;  |
                    LDX.w $02D3               ;  |
                    STX.b $0F                 ; /
                    LDA.w #$0800              ; \ Amount of bytes to transfer = #$0800.
                    STA.b $0B                 ; /
                    LDA.w #$3800              ; \ First half of fourth GFX slot
                    JSR.w CODE_138AC4         ; / Transfer to VRAM
                    LDA.w $02CF               ; \ Load tiles 1C0-1FF of the FG/BG slots from pointer.
                    STA.b $0D                 ;  |
                    LDX.w $02D5               ;  |
                    STX.b $0F                 ; /
                    LDA.w #$0800              ; \ Amount of bytes to transfer = #$0800.
                    STA.b $0B                 ; /
                    LDA.w #$3C00              ; \ Second half of fourth GFX slot.
                    JSR.w CODE_138AC4         ; / Transfer to VRAM.
                    LDX.w $0533               ; \ Load different graphics for tiles C0-FF of the FG/BG slots if the following levels:
                    CPX.b #$02                ;  | Level 1-3...
                    BEQ   CODE_1386BC         ;  |
                    CPX.b #$08                ;  | Level 3-3...
                    BEQ   CODE_1386BC         ;  |
                    CPX.b #$0B                ;  | or level 4-3.
                    BEQ   CODE_1386BC         ;  |
                    CPX.b #$11                ;  | If NOT level 5-3, even different tiles are used for tiles C0-FF of the FG/BG slots.
                    BNE   CODE_1386D2         ;  |
                    LDX.w $0534               ;  | If it's level 5-3 and the sixth room is entered...
                    CPX.b #$05                ;  | ...use the tiles from 1-3, 3-3 and 4-3.
                    BEQ   CODE_1386BC         ;  |
                    LDA.w #$C800              ;  | Graphics from $18C800 are used.
                    STA.b $0D                 ;  | $0800 bytes.
                    LDX.b #$18                ;  |
                    BRA   CODE_1386C3         ; /

CODE_1386BC:        LDA.w #$9000              ; \ 1-3, 3-3, 4-3 or 5-3 room 6.
                    STA.b $0D                 ;  | They use graphics from $1D9000.
                    LDX.b #$1D                ;  |
CODE_1386C3:        STX.b $0F                 ;  |
                    LDA.w #$0800              ;  | $0800 bytes also.
                    STA.b $0B                 ;  |
                    LDA.w #$2C00              ;  | VRAM destination is where tiles C0-FF go.
                    JSR.w CODE_138AC4         ;  | Transfer to VRAM.
                    BRA   CODE_1386ED         ; / Branch.

CODE_1386D2:        LDX.w $0533               ; \ If NOT 7-2...
                    CPX.b #$13                ;  | ...then don't load any new tiles at all.
                    BNE   CODE_1386ED         ;  |
                    LDA.w #$A000              ;  | 7-2 uses graphics from $1DA000.
                    STA.b $0D                 ;  |
                    LDX.b #$1D                ;  |
                    STX.b $0F                 ;  |
                    LDA.w #$0800              ;  | $0800 bytes as usual.
                    STA.b $0B                 ;  |
                    LDA.w #$2C00              ;  | VRAM destination is where tiles C0-FF go.
                    JSR.w CODE_138AC4         ; / Transfer to VRAM.
CODE_1386ED:        LDX.b #$00                  
                    STX.w $0773                 
                    LDX.w $0533               ; \ Level 2-1...
                    CPX.b #$03                ;  | (If not, branch.)
                    BNE   CODE_138704         ;  |
                    LDX.w $0534               ;  | The second room.
                    CPX.b #$01                ;  |
                    BEQ   CODE_13871D         ;  |
                    CPX.b #$02                ;  | Or the third room.
                    BEQ   CODE_13871D         ; / If either, branch.
CODE_138704:        LDX.w $0533               ; \ Level 2-3...
                    CPX.b #$05                ;  | (If not, branch and return.)
                    BNE   CODE_138736         ;  |
                    LDX.w $0534               ;  |
                    CPX.b #$03                ;  | The fourth room...
                    BEQ   CODE_13871D         ;  |
                    LDX.w $0534               ;  | Or the sixth room...
                    CPX.b #$05                ;  | (Extra LDX $0534 is redundant, by the way.)
                    BEQ   CODE_13871D         ;  |
                    CPX.b #$07                ;  | Or the eighth room.
                    BNE   CODE_138736         ;  | If none of these, return.
CODE_13871D:        LDA.w #$A800              ;  | Upload stone graphics to 100-13F.
                    STA.b $0D                 ;  | Source: $1DA800.
                    LDX.b #$1D                ;  |
                    STX.b $0F                 ;  |
                    LDA.w #$0800              ;  | Size: $0800 (x40 tiles)
                    STA.b $0B                 ;  |
                    LDA.w #$3000              ;  | Destination: FG/BG tile slots 100-13F.
                    JSR.w CODE_138AC4         ; / Transfer to VRAM.
                    LDX.b #$01                  
                    STX.w $0773                 
CODE_138736:        SEP   #$20                ; A = 8-bit.
                    RTL                       ; Return.

DATA_138739:        dw $8000      ; Icy ground graphics.
                    dw $9800      ; Wood graphics.
              
CODE_13873D:        REP   #$20                ; Accumulator = 16-bit.
                    LDX.w $0533               ; \ Check if in level 5-3.
                    CPX.b #$0E                ;  |
                    BNE   CODE_13874A         ; / If not, branch.
                    LDX.b #$02                ; Layer tiles 200-23F = $1D9800.
                    BRA   CODE_13874D           

CODE_13874A:        LDX.w $04EF                 
CODE_13874D:        LDA.l DATA_138739,x         ; \ Load GFX pointer for layer tiles 200-23F.
                    STA.b $0D                 ;  | Into [$0D]
                    LDX.b #$1D                ;  |
                    STX.b $0F                 ; /
                    LDA.w #$0800              ; \ Amount of bytes to transfer = #$0800.
                    STA.b $0B                 ; /
                    LDA.w #$4000              ; \ First half of fifth GFX slot.
                    JSR.w CODE_138AC4         ; / Transfer to VRAM.
                    LDA.w #$9000              ; \ Layer tiles 240-27F pointer into [$0D]
                    STA.b $0D                 ;  | ($1D9000)
                    LDX.b #$1D                ;  |
                    STX.b $0F                 ; /
                    LDA.w #$0800              ; \ Amount of bytes to transfer = #$0800.
                    STA.b $0B                 ; /
                    LDA.w #$4400              ; \ Second half of fifth GFX slot.
                    JSR.w CODE_138AC4         ; / Transfer to VRAM.
                    SEP   #$20                ; Accumulator = 8-bit.
                    RTL                       ; Return.

DATA_138779:        db $18,$38,$58,$75,$91,$B0,$C3
            
CODE_138780:        LDA.b #$06                  
                    STA.b $00                   
                    LDX.w $0533                 
                    LDA.l DATA_11D098,x             
                    CLC                         
                    ADC.w $0534                 
                    LDX.b $00                   
CODE_138791:        CMP.l DATA_138779,x             
                    BEQ   CODE_13879D           
                    DEX                         
                    BPL   CODE_138791           
                    BRL   CODE_1387D7           

CODE_13879D:        CPX.b #$06                  
                    BNE   CODE_1387BB           
                    PHX                         
                    REP   #$20                  
                    LDA.w #$F800                
                    STA.b $0D                   
                    LDX.b #$17                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$7800                
                    JSR.w CODE_138AE7           
                    SEP   #$20                  
                    PLX                         
CODE_1387BB:        TXA                         
                    ASL   A                     
                    TAX                         
                    REP   #$20                  
                    LDA.l DATA_13802A,x             
                    STA.b $0D                   
                    LDX.b #$17                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$7C00                
                    JSR.w CODE_138AE7           
                    SEP   #$20                  
CODE_1387D7:        RTL                         

CODE_1387D8:        REP   #$20                  
                    LDA.w #$8000                
                    STA.b $0D                   
                    LDX.b #$19                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$2000                
                    JSR.w CODE_138AC4           
                    LDA.w #$A000                
                    STA.b $0D                   
                    LDX.b #$19                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$2400                
                    JSR.w CODE_138AC4           
                    LDA.w #$9000                
                    STA.b $0D                   
                    LDX.b #$19                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$2800                
                    JSR.w CODE_138AC4           
                    LDA.w #$F000                
                    STA.b $0D                   
                    LDX.b #$19                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$2C00                
                    JSR.w CODE_138AC4           
                    SEP   #$20                  
                    RTL                         

CODE_13882D:        REP   #$20                  
                    LDA.w #$8800                
                    STA.b $0D                   
                    LDX.b #$19                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$2400                
                    JSR.w CODE_138AC4           
                    SEP   #$20                  
                    RTL                         

CODE_138846:        REP   #$20                  
                    LDA.w #$B000                
                    STA.b $0D                   
                    LDX.b #$19                  
                    STX.b $0F                   
                    LDA.w #$1000                
                    STA.b $0B                   
                    LDA.w #$3000                
                    JSR.w CODE_138AC4           
                    LDA.w #$A800                
                    STA.b $0D                   
                    LDX.b #$19                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$3800                
                    JSR.w CODE_138AC4           
                    LDA.w #$9800                
                    STA.b $0D                   
                    LDX.b #$19                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$3C00                
                    JSR.w CODE_138AC4           
                    SEP   #$20                  
                    RTL                         

CODE_138887:        REP   #$20                  
                    LDA.w #$B000                
                    STA.b $0D                   
                    LDX.b #$17                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$3400                
                    JSR.w CODE_138AC4           
                    SEP   #$20                  
                    RTL                         

CODE_1388A0:        REP   #$20                  
                    LDA.w #$C000                
                    STA.b $0D                   
                    LDX.b #$19                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$2C00                
                    JSR.w CODE_138AC4           
                    LDA.w #$9800                
                    STA.b $0D                   
                    LDX.b #$19                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$3C00                
                    JSR.w CODE_138AC4           
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$B800                
                    STA.b $0D                   
                    LDX.b #$17                  
                    STX.b $0F                   
                    LDA.w #$7C00                
                    JSR.w CODE_138AE7           
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$C000                
                    STA.b $0D                   
                    LDX.b #$17                  
                    STX.b $0F                   
                    LDA.w #$7800                
                    JSR.w CODE_138AE7           
                    SEP   #$20                  
                    RTL                         

CODE_1388F5:        REP   #$20                ; Accumulator = 16-bit.
                    LDA.w #$8000              ; \ Layer tiles 00-3F.
                    STA.b $0D                 ;  | ($1A8000)
                    LDX.b #$1A                ;  |
                    STX.b $0F                 ; /
                    LDA.w #$0800              ; \ Amount of bytes to transfer = #$0800.
                    STA.b $0B                 ; /
                    LDA.w #$2000              ; \ First half of first GFX slot.
                    JSR.w CODE_138AC4         ; / Transfer to VRAM.
                    LDA.w #$C800              ; \ Layer tiles 40-FF.
                    STA.b $0D                 ;  | ($19C800)
                    LDX.b #$19                ;  |
                    STX.b $0F                 ; /
                    LDA.w #$1800              ; \ Amount of bytes to transfer = #$1800.
                    STA.b $0B                 ; /
                    LDA.w #$2400              ; \ Second half of first and full second GFX slot.
                    JSR.w CODE_138AC4         ; / Transfer to VRAM.
                    LDA.w #$4000              ; \ Amount of bytes to transfer = #$4000.
                    STA.b $0B                 ; /
                    LDA.w #$8000              ; \ Sprite tiles 00-1FF.
                    STA.b $0D                 ;  | ($1B8000)
                    LDX.b #$1B                ;  |
                    STX.b $0F                 ; /
                    LDA.w #$6000              ; \ All four GFX slots.
                    JSR.w CODE_138AE7         ; / Transfer to VRAM.
                    SEP   #$20                ; Accumulator = 8-bit.
                    RTL                       ; Return.

CODE_138936:        PHB                         
                    PHK                         
                    PLB                         
                    REP   #$20                  
                    LDA.w #$D000                
                    STA.b $0D                   
                    LDX.b #$18                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$2000                
                    JSR.w CODE_138AC4           
                    LDA.w #$F000                
                    STA.b $0D                   
                    LDX.b #$1C                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$2400                
                    JSR.w CODE_138AC4           
                    LDA.w #$F800                
                    STA.b $0D                   
                    LDX.b #$19                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$2800                
                    JSR.w CODE_138AC4           
                    LDA.w #$B000                
                    STA.b $0D                   
                    LDX.b #$1B                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$2C00                
                    JSR.w CODE_138AC4           
                    LDA.w #$9800                
                    STA.b $0D                   
                    LDX.b #$19                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$3C00                
                    JSR.w CODE_138AC4           
                    SEP   #$20                  
                    PLB                         
                    RTL                         

CODE_1389A3:        PHB                         
                    PHK                         
                    PLB                         
                    REP   #$20                  
                    LDA.w #$8000                
                    STA.b $0D                   
                    LDX.b #$1E                  
                    STX.b $0F                   
                    LDA.w #$1000                
                    STA.b $0B                   
                    LDA.w #$5800                
                    JSR.w CODE_138AC4           
                    SEP   #$20                  
                    PLB                         
                    RTL                         

DATA_1389C0:        dw $D000
                    dw $D200
                    dw $D400
                    dw $D600
                    dw $F000
                    dw $F200
                    dw $F400
                    dw $F600
                    dw $F800
                    dw $FA00
                    dw $FC00
                    dw $FE00
                    dw $B000
                    dw $B200
                    dw $B400
                    dw $B600

DATA_1389E0:        db $18,$18,$18,$18,$1C,$1C,$1C,$1C
                    db $19,$19,$19,$19,$1B,$1B,$1B,$1B
                   
DATA_1389F0:        dw $2000
                    dw $2100
                    dw $2200
                    dw $2300
                    dw $2400
                    dw $2500
                    dw $2600
                    dw $2700
                    dw $2800
                    dw $2900
                    dw $2A00
                    dw $2B00
                    dw $2C00
                    dw $2D00
                    dw $2E00
                    dw $2F00
                
CODE_138A10:        REP   #$20                  
                    LDA.w $0759                 
                    AND.w #$00FF                
                    BEQ   CODE_138A3A           
                    DEC.w $0759                 
                    DEC   A                     
                    TAX                         
                    LDA.l DATA_1389E0,x             
                    STA.b $0F                   
                    TXA                         
                    ASL   A                     
                    TAX                         
                    LDA.l DATA_1389C0,x             
                    STA.b $0D                   
                    LDA.w #$0200                
                    STA.b $0B                   
                    LDA.l DATA_1389F0,x             
                    JSR.w CODE_138AC4           
CODE_138A3A:        LDA.w $0722                 
                    AND.w #$00FF                
                    BEQ   CODE_138A62           
                    CMP.w #$0002                
                    BEQ   CODE_138A4E           
                    LDA.w #$E000                
                    LDX.b #$1A                  
                    BRA   CODE_138A53           

CODE_138A4E:        LDA.w #$D000                
                    LDX.b #$16                  
CODE_138A53:        STA.b $0D                   
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$7000                
                    JSR.w CODE_138AE7           
CODE_138A62:        SEP   #$20                  
                    STZ.w $0722                 
                    RTL                         

CODE_138A68:        REP   #$20                  
                    LDA.w #$8000                
                    STA.b $0D                   
                    LDX.b #$19                  
                    STX.b $0F                   
                    LDA.w #$2000                
                    STA.b $0B                   
                    JSR.w CODE_138AC4           
                    LDA.w #$B800                
                    STA.b $0D                   
                    LDX.b #$1B                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$7800                
                    JSR.w CODE_138AE7           
                    SEP   #$20                  
                    RTL                         

CODE_138A92:        REP   #$20                  
                    LDA.w #$8800                
                    STA.b $0D                   
                    LDX.b #$1D                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$2C00                
                    JSR.w CODE_138AC4           
                    SEP   #$20                  
                    RTL                         

CODE_138AAB:        REP   #$20                  
                    LDA.w #$9800                
                    STA.b $0D                   
                    LDX.b #$1D                  
                    STX.b $0F                   
                    LDA.w #$0800                
                    STA.b $0B                   
                    LDA.w #$4000                
                    JSR.w CODE_138AC4           
                    SEP   #$20                  
                    RTL                         

CODE_138AC4:        LDX.b #$80                ; \ Increment after write to $2119.
                    STX.w $2115               ;  | Increment source&destination addresses by 1.
                    STA.w $2116               ;  | 16-bit value in A determines destination in VRAM.
                    LDA.b #$01                ;  | 1 byte per reg (2 regs, low byte in $reg, high byte in $reg+1).
                    CLC                       ;  | Clear carry.
                    STA.w $4300               ;  | -------------^
                    LDA.b $0D                 ;  | [$0D] holds the source address.
                    STA.w $4302               ;  |
                    LDX.b $0F                 ;  |
                    STX.w $4304               ;  |
                    LDA.b $0B                 ;  | $0B (16-bit) holds the size.
                    STA.w $4305               ;  |
                    LDX.b #$01                ;  | Data transfer here.
                    STX.w $420B               ;  |
                    RTS                       ; / Return.

CODE_138AE7:        LDX.b #$80                  
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

DATA_138B0A:        dw $E000
                    dw $E0C0
                    dw $E180
                    dw $E240
                    dw $E300
                    dw $E3C0
                    dw $E480
                    dw $E540

DATA_138B1A:        dw $E600
                    dw $E6C0
                    dw $E780
                    dw $E840
                    dw $E900
                    dw $E9C0
                    dw $EA80
                    dw $EB40
                      
CODE_138B2A:        PHD                         
                    REP   #$20                  
                    LDA.w #$4300                
                    TCD                         
                    LDY.b $FE                   
                    CPY.b #$80                  
                    BEQ   CODE_138B44           
                    LDY.w $0217                 
                    BNE   CODE_138B48           
                    LDY.w $025E                 
                    BEQ   CODE_138B44           
                    JMP.w CODE_138C7D           

CODE_138B44:        SEP   #$20                  
                    PLD                         
                    RTL                         

CODE_138B48:        LDX.b #$80                  
                    STX.w $2115                 
                    LDA.b #$01                  
                    CLC                         
                    STA.b $00                   
                    LDX.w $0722                 
                    BNE   CODE_138BBA           
                    STA.b $10                   
                    STA.b $20                   
                    LDX.b #$2F                  
                    STX.b $04                   
                    STX.b $14                   
                    LDX.b #$16                  
                    STX.b $24                   
                    LDA.w #$0040                  
                    STA.b $05
                    STA.b $15                  
                    LDA.w #$00C0                                 
                    STA.b $25                   
                    LDA.w #$6000                       
                    STA.w $2116                 
                    LDA.w $10                 
                    AND.w #$0038                  
                    LSR   A
                    LSR   A                     
                    TAX                         
                    LDA.w $02ED                 
                    STA.b $02                   
                    LDA.w $02F1                 
                    STA.b $12                   
                    LDA.l DATA_138B0A,x             
                    STA.b $22                   
                    LDY.b #$07                  
                    STY.w $420B                 
                    LDA.w #$0040                  
                    STA.b $05                  
                    STA.b $15                   
                    LDA.w #$00C0                               
                    STA.b $25                   
                    LDA.w #$6100                  
                    STA.w $2116                 
                    LDA.w $02EF                 
                    STA.b $02                   
                    LDA.w $02F3                 
                    STA.b $12                   
                    LDA.l DATA_138B1A,x             
                    STA.b $22                   
                    STY.w $420B                 
CODE_138BBA:        LDA.w #$0200                 
                    STA.b $05                 
                    LDA.w $0765                       
                    STA.w $2116                 
                    LDA.w $021B                 
                    STA.b $02                   
                    LDY.w $0788                 
                    STY.b $04                   
                    LDX.b #$01                  
                    STX.w $420B                 
                    LDA.w #$0040                  
                    STA.b $05
                    LDA.w #$22E0                
                    STA.w $2116                 
                    LDA.w $0252                 
                    STA.b $02                   
                    STY.b $04                   
                    STX.w $420B                 
                    SEP   #$20                  
                    PLD                         
                    RTL                         

DATA_138BED:        dw $D000
                    dw $D600
                    dw $DC00
                    dw $E200
                    dw $E800
                    dw $EE00
                    dw $F400
                    dw $FA00

DATA_138BFD:        dw $0000
                    dw $0200
                    dw $0400

DATA_138C03:        dw $2000
                    dw $2100
                    dw $2200

DATA_138C09:        db $18,$1D
                   
CODE_138C0B:        LDA.w $025E          
                    BEQ   CODE_138C13
                    JMP.w CODE_138CCE

CODE_138C13:        INC.w $0767       
                    LDA.w $0767                 
                    CMP.b #$03                  
                    BCC   CODE_138C20           
                    STZ.w $0767                 
CODE_138C20:        INC.w $0219                 
                    LDA.w $0219                 
                    CMP.b #$08                  
                    BCC   CODE_138C30           
                    INC.w $021A                 
                    STZ.w $0219                 
CODE_138C30:        LDA.w $021A                 
                    AND.b #$07                  
                    ASL   A                     
                    TAX                         
                    REP   #$20                  
                    LDA.l DATA_138BED,x             
                    STA.w $021B                 
                    LDA.w $0767                 
                    AND.w #$00FF                
                    ASL   A                     
                    TAX                         
                    LDA.w $021B                 
                    CLC                         
                    ADC   DATA_138BFD,x             
                    STA.w $021B                 
                    LDA.l DATA_138C03,x             
                    STA.w $0765                 
                    LDX.w $0787                 
                    LDA.l DATA_138C09,x             
                    AND.w #$00FF                
                    TAY                         
                    STY.w $0788                 
                    LDA.b $10                   
                    AND.w #$0007                
                    ASL   A                     
                    TAX                         
                    LDA.l DATA_138BED,x             
                    CLC                         
                    ADC.w #$05C0                
                    STA.w $0252                 
                    SEP   #$20                  
                    RTL                         

CODE_138C7D:        LDX.b #$80                  
                    STX.w $2115                 
                    LDA.w #$1801                           
                    STA.b $00                   
                    LDA.w #$0800               
                    STA.b $05                   
                    LDA.w #$2000                  
                    STA.w $2116           
                    LDA.w $021B
                    STA.b $02                       
                    LDY.b #$1A                  
                    STY.b $04                   
                    LDX.b #$01                  
                    STX.w $420B                 
                    SEP   #$20                  
                    PLD                         
                    RTL                         

DATA_138CA4:        dw $8000
                    dw $8800
                    dw $9000
                    dw $9800
                    dw $A000
                    dw $A800
                    dw $B000
                    dw $B800
                    dw $B000
                    dw $A800
                    dw $A000
                    dw $9800
                    dw $9000
                    dw $8800

DATA_138CC0:        dw $D000
                    dw $C800
                    dw $C000
                    dw $D800                    
                    dw $C000
                    dw $C800
                    dw $D000
                
CODE_138CCE:        LDA.b $15                   
                    ASL   A                     
                    TAX                         
                    REP   #$20                  
                    LDA.w $025E                 
                    AND.w #$0003                
                    CMP.w #$0002                
                    BEQ   CODE_138CE8           
                    LDA.l DATA_138CA4,x             
                    STA.w $021B                 
                    BRA   CODE_138CEF           

CODE_138CE8:        LDA.l DATA_138CC0,x             
                    STA.w $021B                 
CODE_138CEF:        SEP   #$20                  
                    RTL                         

CODE_138CF2:        LDA.b #$04                  
                    STA.w $1199                 
                    STA.w $119B                 
                    STA.w $119D                 
                    STA.w $119F                 
                    STA.w $11A1                 
                    STA.w $11A3                 
                    STA.w $11A5                 
                    STA.w $11A7                 
                    STA.w $11A9                 
                    STA.w $11AB                 
                    STA.w $11AD                 
                    STA.w $11AF                 
                    STA.w $11B1                 
                    STA.w $11B3                 
                    STA.w $11B5                 
                    STA.w $11B7                 
                    RTL                         

CODE_138D25:        STZ.w $1199                 
                    STZ.w $119B                 
                    STZ.w $119D                 
                    STZ.w $119F                 
                    STZ.w $11A1                 
                    STZ.w $11A3                 
                    STZ.w $11A5                 
                    STZ.w $11A7                 
                    STZ.w $11A9                 
                    STZ.w $11AB                 
                    STZ.w $11AD                 
                    STZ.w $11AF                 
                    STZ.w $11B1                 
                    STZ.w $11B3                 
                    STZ.w $11B5                 
                    STZ.w $11B7                 
                    RTL                         

CODE_138D56:        REP   #$20                  
                    LDX.b #$2E                  
CODE_138D5A:        LDA.w DATA_11BBC6,x               
                    STA.w $1400,x               
                    DEX                         
                    DEX                         
                    BPL   CODE_138D5A           
                    SEP   #$20                  
                    RTL                         

CODE_138D67:        LDX.b #$23                  
CODE_138D69:        LDA.l DATA_15EC33,x             
                    STA.w $1194,x               
                    DEX                         
                    BPL   CODE_138D69           
                    RTL                         

                    LDA.b $FC                   
                    AND.b #$10                  
                    BEQ   CODE_138D96           
                    LDX.w $0635                 
                    INC.w $0533                 
                    LDA.w $0533                 
                    STA.w $04E8                 
                    CMP.w DATA_11C9B4+1,x               
                    BNE   CODE_138DC1           
                    LDA.w DATA_11C9B4,x               
                    STA.w $0533                 
                    STA.w $04E8                 
                    BRA   CODE_138DC1           

CODE_138D96:        LDA.b $FC                   
                    AND.b #$20                  
                    BNE   CODE_138D9F           
                    BRL   CODE_138E26           

CODE_138D9F:        INC.w $0635                 
                    LDX.w $0635                 
                    STX.w $0405                 
                    LDA.w DATA_11C9B4,x               
                    STA.w $0533                 
                    STA.w $04E8                 
                    CPX.b #$07                  
                    BNE   CODE_138DC1           
                    STZ.w $0635                 
                    STZ.w $0405                 
                    STZ.w $0533                 
                    STZ.w $04E8                 
CODE_138DC1:        LDA.w $0635                 
                    INC   A                     
                    ORA.b #$80                  
                    STA.w $118E                 
                    LDA.b #$0C                  
                    STA.w $118F                 
                    LDY.b #$0C                  
CODE_138DD1:        LDA.b #$BF                  
                    STA.w $116C,y               
                    LDA.b #$00                  
                    STA.w $116D,y               
                    DEY                         
                    DEY                         
                    BPL   CODE_138DD1           
                    LDY.w $0635                 
                    LDA.w $0533                 
                    SEC                         
                    SBC   DATA_11C9B4,y               
                    STA.w $0629                 
                    CLC                         
                    ADC.b #$81                  
                    STA.w $1192                 
                    LDA.b #$0C                  
                    STA.w $1193                 
                    LDA   DATA_11C9B4+1,y               
                    SEC                         
                    SBC   DATA_11C9B4,y               
                    STA.b $03                   
                    LDX.b #$00                  
                    TXY                         
CODE_138E03:        LDA.b #$EB                  
                    CPX.w $0629                 
                    BNE   CODE_138E0C           
                    LDA.b #$EC                  
CODE_138E0C:        STA.w $116C,y               
                    LDA.b #$1C                  
                    STA.w $116D,y               
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INX                         
                    CPX.b $03                   
                    BCC   CODE_138E03           
                    LDA.b #$FF                  
                    STA.w $1194                 
                    LDA.b #$08                  
                    STA.b $11                   
CODE_138E26:        RTL                         
                    LDY.b #$C0                  
CODE_138E29:        CMP.b #$0A                  
                    BCC   CODE_138E32           
                    SBC.b #$0A                  
                    INY                         
                    BRA   CODE_138E29           

CODE_138E32:        ORA.b #$C0                  
                    CPY.b #$C0                  
                    BNE   CODE_138E3A           

                    LDY.b #$BF                  
CODE_138E3A:        RTS                         

CODE_138E3B:        PHB                         
                    PHK                         
                    PLB                         
                    LDA.b #$00                  
                    STA.w $0235                 
                    LDA.b #$00                  
                    STA.w $0236                 
                    LDA.b #$CA                  
                    STA.w $0237                 
                    LDA.b #$15                  
                    STA.w $212A                 
                    LDA.b #$06                  
                    STA.w $212B                 
                    LDA.b #$41                  
                    STA.w $4370                 
                    LDA.b #$26                  
                    STA.w $4371                 
                    LDA.b #$DD                  
                    STA.w $4372                 
                    LDA.b #$8E                  
                    STA.w $4373                 
                    LDA.b #$13                  
                    STA.w $4374                 
                    LDA.b #$7F                  
                    STA.w $4377                 
                    LDA.b #$41                  
                    STA.w $4330                 
                    LDA.b #$28                  
                    STA.w $4331                 
                    LDA.b #$E4                  
                    STA.w $4332                 
                    LDA.b #$8E                  
                    STA.w $4333                 
                    LDA.b #$13                  
                    STA.w $4334                 
                    LDA.b #$7F                  
                    STA.w $4337                 
                    LDA.b #$10                  
                    STA.w $0238                 
                    LDA.b #$B7                  
                    STA.w $0239                 
                    LDA.b #$20                  
                    STA.w $023D                 
                    ASL   A                     
                    STA.w $023E                 
                    ASL   A                     
                    STA.w $023F                 
                    STZ.w $023C                 
                    STZ.w $0244                 
                    LDA.b #$13                  
                    STA.w $0243                 
                    STA.w $023B                 
                    LDA.w $04BC                 
                    STA.w $0B00                 
                    LDA.w $04BD                 
                    STA.w $0B01                 
                    LDA.b #$01                  
                    STA.w $02A9                 
                    STZ.w $023A                 
                    STZ.w $022B                 
                    STZ.w $0229                 
                    STZ.w $0232                 
                    STZ.w $0240                 
                    STZ.w $0245                 
                    PLB                         
                    RTL                         

                    db $F0,$00,$F0,$F0,$E0,$F0,$00,$F0
                    db $00,$F2,$F0,$E0,$F2,$00
            
CODE_138EEB:        REP   #$30                  
                    LDA.w $022B                 
                    AND.w #$00FF                
                    ASL   A                     
                    TAX                         
                    LDA.l DATA_138FB7,x             
                    STA.w $0712                 
                    LDA.l DATA_138FC1,x             
                    STA.w $0714                 
                    LDA.l DATA_138FCB,x             
                    STA.w $0716                 
                    LDA   DATA_138FC9               
                    STA.w $0718                 
                    LDA   DATA_138FBF               
                    TAX                         
CODE_138F16:        LDA.w #$00FF                
                    CPX.w $0714                 
                    BCS   CODE_138F26                   
                    CPX.w $0712                 
                    BCC   CODE_138F26           
                    LDA.w $0716                 
CODE_138F26:        STA.l $7FF000,x             
                    INX                         
                    INX                         
                    CPX.w $0718                 
                    BNE   CODE_138F16           
                    LDA.w #$0066                
                    TAX                         
CODE_138F35:        LDA.w #$C43B                
                    STA.l $7FF200,x             
                    INX                         
                    INX                         
                    CPX.w #$013A                
                    BNE   CODE_138F35           
                    SEP   #$30                  
                    LDA.w $0232                 
                    BNE   CODE_138FA9           
                    LDA.b #$CA                  
                    STA.w $0237                 
                    LDX.b #$FF                  
                    LDY.b #$FC                  
                    LDA.w $0231                 
                    BNE   CODE_138F5C           
                    LDX.b #$01                  
                    LDY.b #$04                  
CODE_138F5C:        TYA                         
                    CLC                         
                    ADC.w $0245                 
                    STA.w $0245                 
                    LDA.w $023D                 
                    AND.b #$20                  
                    ORA.w $0245                 
                    STA.w $023D                 
                    LDA.w $023E                 
                    AND.b #$40                  
                    ORA.w $0245                 
                    STA.w $023E                 
                    LDA.w $023F                 
                    AND.b #$80                  
                    ORA.w $0245                 
                    STA.w $023F                 
                    TXA                         
                    CLC                         
                    ADC.w $022B                 
                    STA.w $022B                 
                    BMI   CODE_138F95           
                    CMP.b #$05                  
                    BEQ   CODE_138F9F           
                    BRA   CODE_138FA9           

CODE_138F95:        STZ.w $022B                 
                    LDA.b #$02                  
                    STA.w $0722                 
                    BRA   CODE_138FA4           

CODE_138F9F:        LDA.b #$C0                  
                    STA.w $0237                 
CODE_138FA4:        LDA.b #$01                  
                    STA.w $0232                 
CODE_138FA9:        LDA.b #$88                  
                    STA.w $023A                 
                    LDA.b #$17                  
                    STA.w $0243                 
                    STA.w $023B                 
                    RTL                         

DATA_138FB7:        dw $00C6
                    dw $00AE
                    dw $0096
                    dw $007E
       
DATA_138FBF:        dw $0068

DATA_138FC1:        dw $00F6
                    dw $010E
                    dw $0126
                    dw $013E

DATA_138FC9:        dw $0154

DATA_138FCB:        db $70,$90,$60,$A0,$50,$B0,$40,$C0
                    db $36,$CA
                
CODE_138FD5:        PHB                         
                    LDA.b #$7F                  
                    PHA                         
                    PLB                         
                    REP   #$30                  
                    LDX.w #$01A0                
CODE_138FDF:        LDA.w #$00FF                
                    STA.w $F000,x               
                    STA.w $F002,x               
                    STA.w $F004,x               
                    STA.w $F006,x               
                    STA.w $F008,x               
                    STA.w $F00A,x               
                    STA.w $F00C,x               
                    STA.w $F00E,x               
                    STA.w $F010,x               
                    STA.w $F012,x               
                    STA.w $F014,x               
                    STA.w $F016,x               
                    STA.w $F018,x               
                    STA.w $F01A,x               
                    STA.w $F01C,x               
                    STA.w $F01E,x               
                    STA.w $F200,x               
                    STA.w $F202,x               
                    STA.w $F204,x               
                    STA.w $F206,x               
                    STA.w $F208,x               
                    STA.w $F20A,x               
                    STA.w $F20C,x               
                    STA.w $F20E,x               
                    STA.w $F210,x               
                    STA.w $F212,x               
                    STA.w $F214,x               
                    STA.w $F216,x               
                    STA.w $F218,x               
                    STA.w $F21A,x               
                    STA.w $F21C,x               
                    STA.w $F21E,x               
                    TXA                         
                    SEC                         
                    SBC.w #$0020                
                    TAX                         
                    BPL   CODE_138FDF           
                    SEP   #$30                  
                    PLB                         
                    RTL                         

                    LDX.b #$FF                  
CODE_139050:        LDA.l DATA_14C563,x             
                    STA.w $14BB,x               
                    DEX                         
                    CPX.b #$FF                  
                    BNE   CODE_139050           
                    STX.w $14C5                 
                    JSR.w CODE_139067           
                    LDA.b #$02                  
                    STA.b $11                   
                    RTL                         

CODE_139067:        LDX.w $0635                 
                    LDY.w $0533                 
                    INY                         
                    TYA                         
                    JSR.w CODE_1390C9           
                    INX                         
                    TXA                         
                    ORA.b #$00                  
                    STA.w $14BF                 
                    LDY.w $04EE                 
                    DEY                         
                    TYA                         
                    JSR.w CODE_1390C9           
                    STY.w $14C9                 
                    STA.w $14CB                 
                    LDY.b #$0C                  
CODE_139089:        LDA.b #$2F                  
                    STA.w $14CD,y               
                    DEY                         
                    DEY                         
                    CPY.b #$02                  
                    BNE   CODE_139089           
                    LDY.w $0635                 
                    LDA.w $0533                 
                    SEC                         
                    SBC   DATA_11C9B4,y               
                    STA.w $0629                 
                    CLC                         
                    ADC.b #$01                  
                    STA.w $14C3                 
                    LDA   DATA_11C9B4+1,y               
                    SEC                         
                    SBC   DATA_11C9B4,y               
                    STA.b $03                   
                    LDX.b #$00                  
                    TXY                         
CODE_1390B3:        LDA.b #$FD                  
                    CPX.w $0629                 
                    BNE   CODE_1390BC           
                    LDA.b #$F6                  
CODE_1390BC:        STA.w $14D1,y               
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INX                         
                    CPX.b $03                   
                    BCC   CODE_1390B3           
                    RTS                         
CODE_1390C9:        LDY.b #$00                  
CODE_1390CB:        CMP.b #$0A                  
                    BCC   CODE_1390D5           
                    SBC.b #$0A                  
                    INY                         
                    JMP.w CODE_1390CB           

CODE_1390D5:        ORA.b #$00                  
                    CPY.b #$00                  
                    BNE   CODE_1390DD           
                    LDY.b #$2F                  
CODE_1390DD:        RTS                         

CODE_1390DE:        LDA.b $38,x                 
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.b $3E,x                 
                    STA.b $3E,x                 
                    LDY.b #$00                  
                    LDA.b $38,x                 
                    PHP                         
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    PLP                         
                    BPL   CODE_1390F8           
                    ORA.b #$F0                  
                    DEY                         
CODE_1390F8:        ADC.b $44,x                 
                    STA.b $44,x                 
                    TYA                         
                    ADC.b $4A,x                 
                    STA.b $4A,x                 
                    RTL                         

DATA_139102:        db $E0,$E2,$E4,$E6,$E8,$EA,$EC,$EE
                    db $C0,$C2,$C4,$C6,$C8,$CA
                 
CODE_139110:        LDA.w $0429                 
                    STA.w $0712                 
                    LDA.w $021F                 
                    STA.w $0713                 
                    REP   #$20                  
                    LDA.w $0712                 
                    BPL   CODE_13912A           
                    CMP.w #$FF80                
                    BCS   CODE_139131                   
                    BRA   CODE_139137           

CODE_13912A:        CMP.w #$0180                
                    BCC   CODE_139131           
                    BRA   CODE_139137           

CODE_139131:        SEP   #$20                  
                    LDA.b $EE                   
                    BEQ   CODE_13913A           
CODE_139137:        SEP   #$20                  
                    RTL                         

CODE_13913A:        LDA.w $042C                 
                    STA.b $01                   
                    LDA.b $6F,x                 
                    LSR   A                     
                    PHP                         
                    LDA.b $65,x                 
                    AND.b #$80                  
                    PLP                         
                    BCC   CODE_13914C           
                    ORA.b #$40                  
CODE_13914C:        STA.b $02                   
                    REP   #$30                  
                    LDY.w $02F6                 
                    LDA.b $9F,x                 
                    AND.w #$00FF                
                    ASL   A                     
                    TAX                         
                    LDA.w $0712                 
                    CLC                         
                    ADC.w #$0010                
                    SEP   #$20                  
                    XBA                         
                    STA.w $0714                 
                    LDA.w $0712                 
                    STA.w $0800,y               
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0804,y               
                    LDA.b $01                   
                    STA.w $0801,y               
                    STA.w $0805,y               
                    LDA.l DATA_139102,x             
                    STA.w $0802,y               
                    LDA.l DATA_139102+1,x             
                    STA.w $0806,y               
                    LDA.b $02                   
                    ORA.b #$23                  
                    STA.w $0803,y               
                    STA.w $0807,y               
                    AND.b #$40                  
                    BEQ   CODE_1391A5           
                    LDA.w $0802,y               
                    PHA                         
                    LDA.w $0806,y               
                    STA.w $0802,y               
                    PLA                         
                    STA.w $0806,y               
CODE_1391A5:        REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.w $0713                 
                    BPL   CODE_1391B5           
                    EOR.b #$FF                  
                    INC   A                     
CODE_1391B5:        AND.b #$01                  
                    ORA.b #$02                  
                    STA.w $0A20,y               
                    LDA.w $0714                 
                    BPL   CODE_1391C4           
                    EOR.b #$FF                  
                    INC   A                     
CODE_1391C4:        AND.b #$01                  
                    ORA.b #$02                  
                    STA.w $0A21,y               
                    SEP   #$10                  
                    LDX.b $12                   
                    RTL                         

DATA_1391D0:        db $1D,$21,$2C,$1C,$1F,$2A

DATA_1391D6:        db $0A,$02,$0A,$04,$0A,$06
          
CODE_1391DC:        PHX                
                    LDA.b $90,x                 
                    LDX.b #$05                  
CODE_1391E1:        CMP   DATA_1391D0,x             
                    BEQ   CODE_1391EF           
                    DEX                         
                    BPL   CODE_1391E1           
                    LDA.b $08                   
                    CLC                         
                    BRA   CODE_139207           

CODE_1391EF:        LDX.w $0254                 
                    LDA.l DATA_1391D6,x             
                    STA.w $0712                 
                    LDA.w $0213                 
                    AND.b #$F1                  
                    ORA.w $0712                 
                    STA.w $0213                 
                    LDA.b $08                   
                    SEC                         
CODE_139207:        PLX                         
                    RTL                         

DATA_139209:        db $C4,$D4,$C5

DATA_13920C:        db $FD,$FF,$0B,$00
            
CODE_139210:        LDA.b $90,x           
                    CMP.b #$37               
                    BNE   CODE_139252
                    LDA.b $10               
                    AND.b #$03                  
                    BNE   CODE_13921E           
                    INC.b $9F,x                 
CODE_13921E:        LDA.b $9F,x                 
                    CMP.b #$03                  
                    BCC   CODE_139228           
                    LDA.b #$00                  
                    STZ.b $9F,x                 
CODE_139228:        STA.w $0714                 
                    LDA.w $0429                 
                    STA.w $0712                 
                    LDA.w $021F                 
                    STA.w $0713                 
                    REP   #$20                  
                    LDA.w $0712                 
                    BPL   CODE_139245           
                    CMP.w #$FF80                
                    BCS   CODE_13924C                   
                    BRA   CODE_139252           

CODE_139245:        CMP.w #$0180                
                    BCC   CODE_13924C           
                    BRA   CODE_139252           

CODE_13924C:        SEP   #$20                  
                    LDA.b $EE                   
                    BEQ   CODE_139255           
CODE_139252:        SEP   #$20                  
                    RTL                         

CODE_139255:        LDA.b $6F,x                 
                    DEC   A                     
                    ASL   A                     
                    TAX                         
                    REP   #$20                  
                    LDA.l DATA_13920C,x             
                    CLC                         
                    ADC.w $0712                 
                    STA.w $0712                 
                    SEP   #$20                  
                    LDX.w $0714                 
                    LDA.l DATA_139209,x             
                    STA.w $0716                 
                    REP   #$30                  
                    LDA.w $02F6                 
                    CLC                         
                    ADC.w #$0004                
                    TAY                         
                    SEP   #$20                  
                    LDA.w $0712                 
                    STA.w $0800,y               
                    LDA.w $042C                 
                    CLC                         
                    ADC.b #$FB                  
                    STA.w $0801,y               
                    LDA.w $0716                 
                    STA.w $0802,y               
                    LDA.b #$24                  
                    STA.w $0803,y               
                    REP   #$20                  
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    SEP   #$20                  
                    LDA.w $0713                 
                    BPL   CODE_1392A9           
                    EOR.b #$FF                  
                    INC   A                     
CODE_1392A9:        AND.b #$01                  
                    STA.w $0A20,y               
                    SEP   #$10                  
                    LDX.b $12                   
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
                    db $FF,$FF,$FF,$FF,$FF                  ; /
                                            
CODE_139300:        ASL   A
                    TAX
                    JMP.w (PNTR_139305,x)           

PNTR_139305:        dw CODE_1393DC
                    dw CODE_1393DC
             
CODE_139309:        ASL             
                    TAX                         
                    JMP.w (PNTR_13930E,x)             

PNTR_13930E:        dw CODE_139439
                    dw CODE_139472
                    dw CODE_139472
                    dw CODE_139472
                    dw CODE_139472
               
CODE_139318:        LDA.w $050F                
                    ASL   A
                    TAX
                    JMP.w (PNTR_139320,x)             

PNTR_139320:        dw CODE_1394CF
                    dw CODE_1394B5
                    dw CODE_1395AE
                    dw CODE_13993E
                    dw CODE_13997C
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1394CF
                    dw CODE_13993E
                    dw CODE_13951D
                    dw CODE_13951D
                    dw CODE_139A2A
                    dw CODE_139A2A
                    dw CODE_139A2A
                    dw CODE_13951D
                    dw CODE_13951D
                    dw CODE_139AA2
                    dw CODE_1394CF
                    dw CODE_1394CF
                    dw CODE_1394B5
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1399A9               
                    dw CODE_139AEF
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1394B5
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1399A9                                 
                    dw CODE_1395AE
                    dw CODE_139B34
                    dw CODE_139B34
                    dw CODE_139B34
                    dw CODE_139B34
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1394CF
                    dw CODE_139BA6
                    dw CODE_139BA6
                    dw CODE_139BA6
                    dw CODE_139BA6
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_139C94
                    dw CODE_13993E
                    dw CODE_1394F6
                    dw CODE_1394F6   
                    dw CODE_1394F6   
                    dw CODE_1394F6   
                    dw CODE_1394F6   
                    dw CODE_1394F6   
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_13993E
                    dw CODE_139D38
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_13951D
                    dw CODE_1399A9
                    dw CODE_1399A9                               
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1399A9
                    dw CODE_1399A9 
                    dw CODE_1399A9
                    dw CODE_1399A9 
                    dw CODE_1399A9
                    dw CODE_1399A9   
                    dw CODE_1399A9
                    dw CODE_1399A9                   

DATA_1393DA:        db $3C,$02
                                   
CODE_1393DC:        LDA.b [$05],y
                    SEC
                    SBC.b #$70                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    TAX                         
                    LDA.l DATA_1393DA,x             
                    STA.w $0712                 
                    LDA.w $050E                 
                    STA.b $08                   
                    LDA.b $E9                   
                    STA.b $0E                   
CODE_1393F6:        LDX.b $0E                   
                    JSR.w CODE_1397DC           
                    LDX.b #$07                  
                    LDA.b $E7                   
                    AND.b #$F0                  
                    TAY                         
                    LDA.w $0712                 
                    XBA                         
                    LDA.w $0712                 
CODE_139409:        REP   #$20                  
                    STA.b [$01],y               
                    SEP   #$20                  
                    INY                         
                    INY                         
                    DEX                         
                    BPL   CODE_139409           
                    DEC.b $08                   
                    BMI   CODE_139430           
                    LDA.b $E7                   
                    CLC                         
                    ADC.b #$10                  
                    CMP.b #$F0                  
                    BCC   CODE_13942B           
                    INC.b $0E                   
                    LDA.b $0E                   
                    CMP.b #$0A                  
                    BEQ   CODE_139430           
                    LDA.b #$00                  
CODE_13942B:        STA.b $E7                   
                    BRL   CODE_1393F6           

CODE_139430:        RTS                         

DATA_139431:        db $FF,$2A,$FF,$FF,$FF,$FF,$2D,$FF

CODE_139439:        LDA.b $E9                   
                    STA.w $0247                 
                    LDA.b #$80                  
                    STA.b $0A                   
                    LDA.b #$31                  
                    STA.b $09                   
CODE_139446:        JSR.w CODE_139705           
                    AND.b #$07                  
                    TAX                         
                    LDA.l DATA_139431,x             
                    STA.b [$01],y               
                    JSR.w CODE_1396D2           
                    CPY.b #$30                  
                    BCC   CODE_139446           
                    TYA                         
                    AND.b #$0F                  
                    TAY                         
                    JSR.w CODE_1396B0           
                    LDA.w $0247                 
                    STA.b $E9                   
                    CMP.b #$0A                  
                    BNE   CODE_139446           
                    LDA.b #$00                  
                    STA.b $E9                   
                    STA.b $E6                   
                    STA.b $E5                   
                    RTS                         

CODE_139472:        STZ.b $0E                   
                    LDA.b $E9                   
                    STA.b $0F                   
                    LDA.w $050F                 
                    SEC                         
                    SBC.b #$01                  
                    ASL   A                     
                    TAX                         
                    LDA   PNTR_13DA0E,x             
                    STA.b $C4                   
                    LDA   PNTR_13DA0E+1,x             
                    STA.b $C5                   
                    LDA.b #$13                  
                    STA.b $C6                   
CODE_139490:        LDY.b $0E                   
                    LDA.b [$C4],y               
                    CMP.b #$FF                  
                    BEQ   CODE_1394B4           
                    CMP.b #$F0                  
                    BEQ   CODE_1394A9           
                    STA.b $0D                   
                    INY                         
                    LDA.b [$C4],y               
                    LDY.b $0D                   
                    STA.b [$01],y               
                    INC.b $0E                   
                    BRA   CODE_1394B0           

CODE_1394A9:        INC.b $0F                   
                    LDX.b $0F                   
                    JSR.w CODE_1397DC           
CODE_1394B0:        INC.b $0E                   
                    BRA   CODE_139490           

CODE_1394B4:        RTS                         

CODE_1394B5:        LDX.b #$01                  
                    LDA.w $050F                 
                    CLC                         
                    ADC.b #$10                  
CODE_1394BD:        CMP   DATA_13D464,x             
                    BEQ   CODE_1394C6           
                    DEX                         
                    BPL   CODE_1394BD           
CODE_1394C6:        LDY.b $E7                   
                    LDA.l DATA_13D466,x             
                    STA.b [$01],y               
                    RTS                         

CODE_1394CF:        LDX.b #$02                  
                    LDA.w $050F                 
                    CLC                         
                    ADC.b #$10                  
CODE_1394D7:        CMP   DATA_13D468,x             
                    BEQ   CODE_1394E0           
                    DEX                         
                    BPL   CODE_1394D7           
CODE_1394E0:        TXA                         
                    ASL   A                     
                    TAX                         
                    LDY.b $E7                   
                    LDA.l DATA_13D46B,x             
                    STA.b [$01],y               
                    INX                         
                    JSR.w CODE_1396B0           
                    LDA.l DATA_13D46B,x             
                    STA.b [$01],y               
                    RTS                         

CODE_1394F6:        LDX.b #$05                  
                    LDA.w $050F                 
                    CLC                         
                    ADC.b #$10                  
CODE_1394FE:        CMP   DATA_13D471,x             
                    BEQ   CODE_139507           
                    DEX                         
                    BPL   CODE_1394FE           
CODE_139507:        TXA                         
                    ASL   A                     
                    TAX                         
                    LDY.b $E7                   
                    LDA.l DATA_13D477,x             
                    STA.b [$01],y               
                    INX                         
                    JSR.w CODE_1396D2           
                    LDA.l DATA_13D477,x             
                    STA.b [$01],y               
                    RTS                         

CODE_13951D:        LDX.b #$04                  
                    LDA.w $050F                 
                    CLC                         
                    ADC.b #$10                  
CODE_139525:        CMP   DATA_13D497,x             
                    BEQ   CODE_13952E           
                    DEX                         
                    BPL   CODE_139525           
CODE_13952E:        TXA                         
                    ASL   A                     
                    STA.b $0E                   
                    ASL   A                     
                    STA.b $0F                   
                    CLC                         
                    ADC.b $0E                   
                    TAX                         
                    LDY.b $E7                   
                    STY.b $0E                   
                    STZ.b $0F                   
CODE_13953F:        LDA.b $0F                   
                    CMP.b #$02                  
                    BNE   CODE_13954E           
                    PHX                         
                    JSR.w CODE_139580           
                    PLX                         
                    CMP.b #$00                  
                    BNE   CODE_139552           
CODE_13954E:        LDA.l DATA_13D49C,x             
CODE_139552:        STA.b [$01],y               
                    INX                         
                    JSR.w CODE_1396D2           
                    LDA.b $0F                   
                    CMP.b #$02                  
                    BNE   CODE_139567           
                    PHX                         
                    JSR.w CODE_139580           
                    PLX                         
                    CMP.b #$00                  
                    BNE   CODE_13956B           
CODE_139567:        LDA.l DATA_13D49C,x             
CODE_13956B:        STA.b [$01],y               
                    INC.b $0F                   
                    LDA.b $0F                   
                    CMP.b #$03                  
                    BEQ   CODE_13957F           
                    INX                         
                    LDY.b $0E                   
                    JSR.w CODE_1396B0           
                    STY.b $0E                   
                    BRA   CODE_13953F           

CODE_13957F:        RTS                         

CODE_139580:        LDX.b #$09                  
CODE_139582:        LDA.w $0533                 
                    CMP   DATA_13D4BA,x             
                    BNE   CODE_139594           
                    LDA.w $0534                 
                    CMP   DATA_13D4C4,x             
                    BEQ   CODE_139599           
CODE_139594:        DEX                         
                    BPL   CODE_139582           
                    BRA   CODE_1395A6           

CODE_139599:        LDX.b #$06                  
CODE_13959B:        LDA.b [$01],y               
                    CMP   DATA_13D4CE,x             
                    BEQ   CODE_1395A9           
                    DEX                         
                    BPL   CODE_13959B           
CODE_1395A6:        LDA.b #$00                  
                    RTS                         

CODE_1395A9:        LDA.l DATA_13D4D5,x             
                    RTS                         

CODE_1395AE:        STZ.b $0F                   
                    LDA.w $050F                 
                    CMP.b #$02                  
                    BEQ   CODE_1395BB           
                    LDA.b #$03                  
                    STA.b $0F                   
CODE_1395BB:        LDY.b $E7                   
                    LDA.b $E9                   
                    STA.w $0712                 
                    STZ.b $08                   
CODE_1395C4:        LDX.b $0F                   
                    CPX.b #$01                  
                    BNE   CODE_1395D2           
                    DEY                         
                    LDA   DATA_13DAA2               
                    STA.b [$01],y               
                    INY                         
CODE_1395D2:        LDA.l DATA_13DA8E,x             
                    STA.b [$01],y               
                    LDX.b $08                   
                    BEQ   CODE_139602           
CODE_1395DC:        JSR.w CODE_139660           
                    BCS   CODE_139621                   
                    PHX                         
                    LDX.b $0F                   
                    LDA.l DATA_13DA93,x             
                    STA.b [$01],y               
                    PLX                         
                    DEX                         
                    BNE   CODE_1395DC           
                    LDX.b $08                   
CODE_1395F0:        JSR.w CODE_139660           
                    BCS   CODE_139621                   
                    PHX                         
                    LDX.b $0F                   
                    LDA.l DATA_13DA98,x             
                    STA.b [$01],y               
                    PLX                         
                    DEX                         
                    BNE   CODE_1395F0           
CODE_139602:        JSR.w CODE_139660           
                    BCS   CODE_139621                  
                    LDX.b $0F                   
                    LDA.l DATA_13DA9D,x             
                    STA.b [$01],y               
                    CPX.b #$01                  
                    BNE   CODE_139621           
                    INY                         
                    LDA   DATA_13DAA3               
                    STA.b [$01],y               
                    INY                         
                    LDA   DATA_13DAA4               
                    STA.b [$01],y               
CODE_139621:        INC.b $08                   
                    LDX.b $E9                   
                    STX.w $0712                 
                    JSR.w CODE_1397DC           
                    LDA.b $E7                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $E7                   
                    SEC                         
                    SBC.b $08                   
                    TAY                         
                    LDA.b $0F                   
                    CMP.b #$03                  
                    BPL   CODE_13964C           
                    LDA.b $0F                   
                    CMP.b #$02                  
                    BEQ   CODE_13965F           
                    LDA.b [$01],y               
                    CMP.b #$FF                  
                    BEQ   CODE_139659           
                    INC.b $0F                   
                    BRA   CODE_139659           

CODE_13964C:        TYA                         
                    AND.b #$F0                  
                    CMP.b #$A0                  
                    BEQ   CODE_13965F           
                    CMP.b #$90                  
                    BNE   CODE_139659           
                    INC.b $0F                   
CODE_139659:        JSR.w CODE_139689           
                    BRL   CODE_1395C4           

CODE_13965F:        RTS                         

CODE_139660:        PHX                         
                    LDA.b $E7                   
                    AND.b #$F0                  
                    STA.w $0713                 
                    INY                         
                    TYA                         
                    AND.b #$F0                  
                    CMP.w $0713                 
                    BEQ   CODE_139686           
                    LDA.b $E7                   
                    AND.b #$F0                  
                    TAY                         
                    INC.w $0712                 
                    LDX.w $0712                 
                    JSR.w CODE_1397DC           
                    CPX.b #$0A                  
                    BNE   CODE_139686           
                    PLX                         
                    SEC                         
                    RTS                         

CODE_139686:        PLX                         
                    CLC                         
                    RTS                         

CODE_139689:        LDA.b $E7                   
                    AND.b #$F0                  
                    STA.w $0713                 
                    TYA                         
                    AND.b #$F0                  
                    CMP.w $0713                 
                    BEQ   CODE_1396AF           
                    TYA                         
                    AND.b #$0F                  
                    STA.w $0713                 
                    LDA.b $E7                   
                    AND.b #$F0                  
                    ORA.w $0713                 
                    TAY                         
                    DEC.w $0712                 
                    LDX.w $0712                 
                    JSR.w CODE_1397DC           
CODE_1396AF:        RTS                         

CODE_1396B0:        INY                         
                    TYA                         
                    AND.b #$0F                  
                    BEQ   CODE_1396BF           
                    LDA.w $02E4                 
                    BEQ   CODE_1396D1           
                    LDX.b $E9                   
                    BRA   CODE_1396CC           

CODE_1396BF:        TYA                         
                    SEC                         
                    SBC.b #$10                  
                    TAY                         
                    STX.b $0B                   
                    LDX.b $E9                   
                    INX                         
                    STX.w $0247                 
CODE_1396CC:        JSR.w CODE_1397DC           
                    LDX.b $0B                   
CODE_1396D1:        RTS                         

CODE_1396D2:        TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    CMP.b #$F0                  
                    BCC   CODE_139704           
                    LDA.w $050F                 
                    CLC                         
                    ADC.b #$10                  
                    CMP.b #$2A                  
                    BEQ   CODE_1396EB           
                    LDX.b $E9                   
                    INX                         
                    JSR.w CODE_1397DC           
CODE_1396EB:        TYA                         
                    AND.b #$0F                  
                    TAY                         
                    LDX.b #$06                  
                    LDA.w $050F                 
                    CLC                         
                    ADC.b #$10                  
CODE_1396F7:        CMP   DATA_13DB60,x             
                    BEQ   CODE_139701           
                    DEX                         
                    BPL   CODE_1396F7           
                    RTS                         

CODE_139701:        INC.w $02E4                 
CODE_139704:        RTS                         

CODE_139705:        LDA.b $09                   
                    ASL   A                     
                    ASL   A                     
                    SEC                         
                    ADC.b $09                   
                    STA.b $09                   
                    ASL.b $0A                   
                    LDA.b #$20                  
                    BIT.b $0A                   
                    BCS   CODE_13971A                   
                    BNE   CODE_13971C           
                    BEQ   CODE_13971E           
CODE_13971A:        BNE   CODE_13971E           
CODE_13971C:        INC.b $0A                   
CODE_13971E:        LDA.b $0A                   
                    EOR.b $09                   
                    RTS                         

DATA_139723:        db $00,$10,$20,$30,$40,$50         

CODE_139729:        STZ.b $E9
                    LDY.b #$01
                    LDA.b [$05],y
                    AND.b #$80
                    BNE   CODE_139736
                    JSR.w CODE_13986E
CODE_139736:        INC.b $04                
CODE_139738:        LDY.b $04
CODE_13973A:        INY                         
                    LDA.b [$05],y               
                    CMP.b #$FF                  
                    BNE   CODE_139742           
                    RTL                         

CODE_139742:        LDA.b [$05],y               
                    AND.b #$0F                  
                    STA.b $E5                   
                    LDA.b [$05],y               
                    AND.b #$F0                  
                    CMP.b #$F0                  
                    BNE   CODE_13975E           
                    LDA.b $E5                   
                    STY.b $08                   
                    JSR.w CODE_1397C1           
                    JSR.w CODE_13992F           
                    LDY.b $08                   
                    BRA   CODE_13973A           

CODE_13975E:        STA.b $E6                   
                    INY                         
                    STY.b $04                   
                    JSR.w CODE_1397D3           
                    LDA.b [$05],y               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.w $050F                 
                    CMP.b #$07                  
                    BCS   CODE_1397A2                   
                    PHA                         
                    LDA.b [$05],y               
                    AND.b #$0F                  
                    STA.w $050F                 
                    PLA                         
                    BEQ   CODE_1397B8           
                    CMP.b #$01                  
                    BNE   CODE_139788           
                    JSR.w CODE_139318           
                    BRL   CODE_139738           

CODE_139788:        CMP.b #$07                  
                    BPL   CODE_13979F           
                    DEC   A                     
                    TAX                         
                    LDA.w $050F                 
                    CLC                         
                    ADC   DATA_139723,x             
                    STA.w $050F                 
                    JSR.w CODE_139318           
                    BRL   CODE_139738           

CODE_13979F:        BRL   CODE_139738           

CODE_1397A2:        LDA.b [$05],y               
                    AND.b #$0F                  
                    STA.w $050E                 
                    LDA.w $050F                 
                    SEC                         
                    SBC.b #$07                  
                    STA.w $050F                 
                    JSR.w CODE_139300           
                    BRL   CODE_139738           

CODE_1397B8:        LDA.w $050F                 
                    JSR.w CODE_139309           
                    BRL   CODE_139738           

CODE_1397C1:        ASL   A                     
                    TAX                         
                    JMP.w (PNTR_1397C6,x)             

PNTR_1397C6:        dw CODE_1397CC
                    dw CODE_1397CA

CODE_1397CA:        INC.b $E9
CODE_1397CC:        INC.b $E9
                    LDA.b #$00
                    STA.b $E6
                    RTS
                 
CODE_1397D3:        LDX.b $E9                   
                    LDA.b $E6                   
                    CLC                         
                    ADC.b $E5                   
                    STA.b $E7                   
CODE_1397DC:        LDA.w $0534                 
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.w DATA_11AAFB,x               
                    STA.b $02                   
                    LDA.w DATA_11AAF0,x               
                    STA.b $01                   
                    LDA.b #$7F                  
                    STA.b $03                   
                    RTS                         

CODE_1397F3:        REP   #$30                  
                    LDA.w $02D9                 
                    STA.l $7F0002               
                    LDA.w #$8000                
                    STA.l $7F0004               
                    LDX.w #$0000                
CODE_139806:        LDA.b [$C4]                 
                    AND.w #$00FF                
                    CMP.w #$00FF                
                    BEQ   CODE_139834           
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    TAY                         
                    LDA.b [$00],y               
                    STA.l $7F0006,x             
                    INY                         
                    INY                         
                    LDA.b [$00],y               
                    STA.l $7F0008,x             
                    INY                         
                    INY                         
                    LDA.b [$00],y               
                    STA.l $7F0046,x             
                    INY                         
                    INY                         
                    LDA.b [$00],y               
                    STA.l $7F0048,x             
                    BRA   CODE_139847           

CODE_139834:        LDA.w #$00BF                
                    STA.l $7F0006,x             
                    STA.l $7F0008,x             
                    STA.l $7F0046,x             
                    STA.l $7F0048,x             
CODE_139847:        LDA.b $C4                   
                    CLC                         
                    ADC.w #$0001                
                    STA.b $C4                   
                    INX                         
                    INX                         
                    INX                         
                    INX                         
                    CPX.w #$0040                
                    BNE   CODE_139806           
                    LDA.w #$FFFF                
                    STA.l $7F0086               
                    LDA.w $02D9                 
                    XBA                         
                    CLC                         
                    ADC.w #$0040                
                    XBA                         
                    STA.w $02D9                 
                    SEP   #$30                  
                    RTS                         

CODE_13986E:        LDA.b [$05],y               
                    AND.b #$7F                  
                    ASL   A                     
                    TAX                         
                    LDA   PNTR_13C661,x             
                    STA.b $C4                   
                    INX                         
                    LDA   PNTR_13C661,x             
                    STA.b $C5                   
                    LDA.b #$13                  
                    STA.b $C6                   
                    LDY.b #$00                  
                    LDA.b [$C4],y               
                    AND.b #$F0                  
                    STA.w $02DC                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.w $02DE                 
                    LDA.b [$C4],y               
                    AND.b #$0F                  
                    STA.w $02DD                 
                    INC.w $02DD                 
                    STZ.b $0C                   
                    STZ.b $0E                   
CODE_1398A3:        STZ.b $0D                   
                    STZ.b $0F                   
                    JSR.w CODE_139913           
                    JSR.w CODE_1398C4           
                    JSR.w CODE_1398D6           
                    INC.b $0C                   
                    LDA.b $0C                   
                    CMP.w $02DD                 
                    BMI   CODE_1398BB           
                    STZ.b $0C                   
CODE_1398BB:        INC.b $0E                   
                    LDA.b $0E                   
                    CMP.b #$10                  
                    BNE   CODE_1398A3           
                    RTS                         

CODE_1398C4:        LDA.w $02DC                 
                    BEQ   CODE_1398D5           
CODE_1398C9:        LDA.b $0F                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $0F                   
                    CMP.w $02DC                 
                    BNE   CODE_1398C9           
CODE_1398D5:        RTS                         

CODE_1398D6:        JSR.w CODE_1398F7           
CODE_1398D9:        LDY.b $0F                   
                    LDA.b [$01],y               
                    CMP.b #$FF                  
                    BNE   CODE_1398E9           
                    LDY.b $0D                   
                    LDA.b [$C4],y               
                    LDY.b $0F                   
                    STA.b [$01],y               
CODE_1398E9:        INC.b $0D                   
                    LDA.b $0F                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $0F                   
                    CMP.b #$F0                  
                    BNE   CODE_1398D9           
                    RTS                         

CODE_1398F7:        LDA.b $0C                   
                    BEQ   CODE_139910           
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    STA.b $0D                   
                    LDX.b $0C                   
CODE_139903:        DEX                         
                    BMI   CODE_139910           
                    LDA.b $0D                   
                    SEC                         
                    SBC.w $02DE                 
                    STA.b $0D                   
                    BRA   CODE_139903           

CODE_139910:        INC.b $0D                   
                    RTS                         

CODE_139913:        LDX.b $E9                   
                    LDA.w DATA_11AAF0,x               
                    CLC                         
                    ADC.b $0E                   
                    STA.b $01                   
                    LDA.w $0534                 
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.w DATA_11AAFB,x               
                    STA.b $02                   
                    LDA.b #$7F                  
                    STA.b $03                   
                    RTS                         

CODE_13992F:        LDY.b $08                   
                    INY                         
                    LDA.b [$05],y               
                    AND.b #$80                  
                    BNE   CODE_13993B           
                    JSR.w CODE_13986E           
CODE_13993B:        INC.b $08                   
                    RTS                         

CODE_13993E:        LDX.b #$03                  
                    LDA.w $050F                 
                    CLC                         
                    ADC.b #$10                  
CODE_139946:        CMP   DATA_13D483,x             
                    BEQ   CODE_13994F           
                    DEX                         
                    BPL   CODE_139946           
CODE_13994F:        TXA                         
                    ASL   A                     
                    ASL   A                     
                    TAX                         
                    LDY.b $E7                   
                    LDA.l DATA_13D487,x             
                    STA.b [$01],y               
                    JSR.w CODE_1396D2           
                    INX                         
                    LDA.l DATA_13D487,x             
                    STA.b [$01],y               
                    INX                         
                    LDY.b $E7                   
                    JSR.w CODE_1396B0           
                    LDA.l DATA_13D487,x             
                    STA.b [$01],y               
                    JSR.w CODE_1396D2           
                    INX                         
                    LDA.l DATA_13D487,x             
                    STA.b [$01],y               
                    RTS                         

CODE_13997C:        LDY.b $E7                   
                    LDX.b #$00                  
CODE_139980:        LDA.l DATA_13D4DC,x             
                    STA.b [$01],y               
                    STY.w $02DE                 
                    LDY.b $E7                   
                    INX                         
                    CPX.b #$02                  
                    BEQ   CODE_1399A3           
                    CPX.b #$07                  
                    BEQ   CODE_1399A0           
                    CPX.b #$0A                  
                    BEQ   CODE_1399A8           
                    LDY.w $02DE                 
                    JSR.w CODE_1396D2           
                    BRA   CODE_139980           

CODE_1399A0:        JSR.w CODE_1396B0           
CODE_1399A3:        JSR.w CODE_1396B0           
                    BRA   CODE_139980           

CODE_1399A8:        RTS                         

CODE_1399A9:        LDX.b #$33                  
                    LDA.w $050F                 
                    CLC                         
                    ADC.b #$10                  
CODE_1399B1:        CMP   DATA_13D4E6,x             
                    BEQ   CODE_1399BA           
                    DEX                         
                    BPL   CODE_1399B1           
CODE_1399BA:        TXA                         
                    ASL   A                     
                    TAX                         
                    LDA   PNTR_13D51A,x             
                    STA.b $08                   
                    INX                         
                    LDA   PNTR_13D51A,x             
                    STA.b $09                   
                    LDA.b #$13                  
                    STA.b $0A                   
                    LDY.b #$00                  
                    LDA.b [$08],y               
                    AND.b #$F0                  
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $0E                   
                    STA.b $0D                   
                    LDA.b [$08],y               
                    AND.b #$0F                  
                    STA.b $0F                   
                    JSR.w CODE_1399E9           
                    STZ.w $02E4                 
                    RTS                         

CODE_1399E9:        LDA.b #$01                  
                    STA.w $02E3                 
                    LDA.b $E7                   
                    STA.w $02E2                 
                    LDA.b $E7                   
                    STA.b $0C                   
CODE_1399F7:        LDY.w $02E3                 
                    LDA.b [$08],y               
                    LDY.w $02E2                 
                    STA.b [$01],y               
                    INC.w $02E3                 
                    LDY.w $02E2                 
                    JSR.w CODE_1396D2           
                    STY.w $02E2                 
                    DEC.b $0E                   
                    LDA.b $0E                   
                    BPL   CODE_1399F7           
                    DEC.b $0F                   
                    LDA.b $0F                   
                    BMI   CODE_139A29           
                    LDY.b $0C                   
                    JSR.w CODE_1396B0           
                    STY.b $0C                   
                    STY.w $02E2                 
                    LDA.b $0D                   
                    STA.b $0E                   
                    BRA   CODE_1399F7           

CODE_139A29:        RTS                         

CODE_139A2A:        LDA.w $050F                 
                    SEC                         
                    SBC.b #$0E                  
                    STA.b $0C                   
                    ASL   A                     
                    CLC                         
                    ADC.b $0C                   
                    STA.b $0F                   
                    TAX                         
                    LDY.b $E7                   
                    STY.b $0E                   
CODE_139A3D:        LDA.w $0533                 
                    CMP.b #$05                  
                    BNE   CODE_139A4B           
                    LDA.w $0534                 
                    CMP.b #$04                  
                    BEQ   CODE_139A65           
CODE_139A4B:        LDA.w $0533                 
                    CMP.b #$0F                  
                    BNE   CODE_139A69           
                    LDA.w $0534                 
                    CMP.b #$03                  
                    BEQ   CODE_139A65           
                    CMP.b #$04                  
                    BEQ   CODE_139A65           
                    CMP.b #$05                  
                    BEQ   CODE_139A65           
                    CMP.b #$06                  
                    BNE   CODE_139A69           
CODE_139A65:        LDA.b #$05                  
                    BRA   CODE_139A6B           

CODE_139A69:        LDA.b #$04                  
CODE_139A6B:        STA.b $0D                   
CODE_139A6D:        LDA.l DATA_13D9BE,x             
                    STA.b [$01],y               
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.l DATA_13D9C8,x             
                    STA.b [$01],y               
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    DEC.b $0D                   
                    BPL   CODE_139A6D           
                    LDA.l DATA_13D9D2,x             
                    STA.b [$01],y               
                    INX                         
                    TXA                         
                    LDX.b $0C                   
                    CMP   DATA_13D9DC,x             
                    BEQ   CODE_139AA1           
                    TAX                         
                    LDY.b $0E                   
                    JSR.w CODE_1396B0           
                    STY.b $0E                   
                    BRA   CODE_139A3D           

CODE_139AA1:        RTS                         

CODE_139AA2:        LDY.b $E7                   
                    LDA.b #$03                  
                    STA.b $0F                   
CODE_139AA8:        STA.b $0E                   
CODE_139AAA:        LDX.b $0E                   
                    LDA.l DATA_13D9DF,x             
                    STA.b [$01],y               
                    STY.b $0D                   
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    STX.b $0C                   
                    JSR.w CODE_139ADA           
                    LDX.b $0C                   
                    CMP.b #$00                  
                    BNE   CODE_139AC8           
                    LDA   DATA_13D9E3               
CODE_139AC8:        STA.b [$01],y               
                    LDY.b $0D                   
                    INY                         
                    DEC.b $0E                   
                    BPL   CODE_139AAA           
                    DEC.b $0F                   
                    BMI   CODE_139AD9           
                    LDA.b #$03                  
                    BRA   CODE_139AA8           

CODE_139AD9:        RTS                         

CODE_139ADA:        LDX.b #$05                  
CODE_139ADC:        LDA.b [$01],y               
                    CMP   DATA_13D9E4,x             
                    BEQ   CODE_139AEA           
                    DEX                         
                    BPL   CODE_139ADC           
                    LDA.b #$00                  
                    RTS                         

CODE_139AEA:        LDA.l DATA_13D9EA,x             
                    RTS                         

CODE_139AEF:        LDY.b $E7                   
                    STY.b $0C                   
                    STZ.b $0D                   
                    STZ.b $0F                   
CODE_139AF7:        STZ.b $0E                   
CODE_139AF9:        LDX.b $0D                   
                    LDA.l DATA_13D9F7,x             
                    STA.b [$01],y               
                    INC.b $0D                   
                    LDA.b $0D                   
                    CMP.b #$17                  
                    BEQ   CODE_139B32           
                    INC.b $0E                   
                    LDX.b $0F                   
                    LDA.l DATA_13D9F0,x             
                    CMP.b $0E                   
                    BEQ   CODE_139B27           
                    TYA                         
                    AND.b #$F0                  
                    CMP.b #$E0                  
                    BEQ   CODE_139B21           
                    JSR.w CODE_1396D2           
                    BRA   CODE_139AF9           

CODE_139B21:        INC.b $0D                   
                    INC.b $0D                   
                    INC.b $0D                   
CODE_139B27:        INC.b $0F                   
                    LDY.b $0C                   
                    JSR.w CODE_1396B0           
                    STY.b $0C                   
                    BRA   CODE_139AF7           

CODE_139B32:        RTS                         

                    RTS                         

CODE_139B34:        STZ.b $0D                   
                    STZ.b $0E                   
                    LDA.w $050F                 
                    SEC                         
                    SBC.b #$31                  
                    STA.b $0F                   
                    LDY.b $E7                   
CODE_139B42:        LDX.b $0D                   
                    LDY.b $E7                   
                    LDA.l DATA_13DAA9,x             
                    STA.b [$01],y               
                    JSR.w CODE_1396D2           
                    LDA.l DATA_13DAAE,x             
                    STA.b [$01],y               
                    JSR.w CODE_1396D2           
                    LDA.l DATA_13DAB3,x             
                    STA.b [$01],y               
CODE_139B5E:        JSR.w CODE_1396D2           
                    LDA.l DATA_13DAB8,x             
                    STA.b [$01],y               
                    TYA                         
                    AND.b #$F0                  
                    CMP.b #$E0                  
                    BNE   CODE_139B5E           
                    LDX.b $0F                   
                    INC.b $0E                   
                    LDA.b $0E                   
                    CMP   DATA_13DAA5,x             
                    BEQ   CODE_139BA5           
                    CPX.b #$02                  
                    BNE   CODE_139B86           
                    CMP.b #$02                  
                    BNE   CODE_139B97           
                    INC.b $0D                   
                    BRA   CODE_139B97           

CODE_139B86:        CMP.b #$03                  
                    BPL   CODE_139B8C           
                    BRA   CODE_139B97           

CODE_139B8C:        LDA.l DATA_13DAA5,x             
                    SEC                         
                    SBC.b #$03                  
                    CMP.b $0E                   
                    BCS   CODE_139B99                  
CODE_139B97:        INC.b $0D                   
CODE_139B99:        LDY.w $00E7                 
                    JSR.w CODE_1396B0           
                    STY.w $00E7                 
                    BRL   CODE_139B42           

CODE_139BA5:        RTS                         

CODE_139BA6:        STZ.b $0E                   
                    LDA.w $050F                 
                    SEC                         
                    SBC.b #$39                  
                    ASL   A                     
                    ASL   A                     
                    STA.b $0D                   
CODE_139BB2:        STZ.b $0C                   
                    STZ.b $0F                   
                    LDY.b $E7                   
                    LDA.b $0D                   
                    CLC                         
                    ADC.b $0E                   
                    TAX                         
                    LDA.l DATA_13DABD,x             
                    PHX                         
                    JSR.w CODE_139C24           
                    PLX                         
                    STA.b [$01],y               
                    INC.b $0C                   
                    JSR.w CODE_1396D2           
                    LDA.l DATA_13DACD,x             
                    PHX                         
                    JSR.w CODE_139C24           
                    PLX                         
                    STA.b [$01],y               
                    INC.b $0C                   
                    TYA                         
                    AND.b #$F0                  
                    CMP.b #$E0                  
                    BEQ   CODE_139C0A           
CODE_139BE2:        JSR.w CODE_1396D2           
                    LDA.b $0D                   
                    CLC                         
                    ADC.b $0E                   
                    CLC                         
                    ADC.b $0F                   
                    TAX                         
                    LDA.l DATA_13DADD,x             
                    STA.b [$01],y               
                    TYA                         
                    AND.b #$F0                  
                    CMP.b #$E0                  
                    BEQ   CODE_139C0A           
                    LDA.b $0F                   
                    CLC                         
                    ADC.b #$10                  
                    STA.b $0F                   
                    CMP.b #$50                  
                    BNE   CODE_139BE2           
                    STZ.b $0F                   
                    BRA   CODE_139BE2           

CODE_139C0A:        LDA.b $0E                   
                    CMP.b #$03                  
                    BEQ   CODE_139C1E           
                    LDY.w $00E7                 
                    JSR.w CODE_1396B0           
                    STY.w $00E7                 
                    INC.b $0E                   
                    BRL   CODE_139BB2           

CODE_139C1E:        PHX                         
                    JSR.w CODE_139C57           
                    PLX                         
                    RTS                         

CODE_139C24:        STA.w $0247                 
                    LDA.b $0D                   
                    CMP.b #$0C                  
                    BEQ   CODE_139C53           
                    LDA.b $0C                   
                    BEQ   CODE_139C3B           
                    LDA.b $0E                   
                    BEQ   CODE_139C3B           
                    CMP.b #$03                  
                    BEQ   CODE_139C3B           
                    BRA   CODE_139C53           

CODE_139C3B:        LDA.b [$01],y               
                    CMP.b #$FF                  
                    BEQ   CODE_139C53           
                    LDX.b #$05                  
CODE_139C43:        CMP   DATA_13DB2D,x             
                    BEQ   CODE_139C4E           
                    DEX                         
                    BPL   CODE_139C43           
                    BRA   CODE_139C53           

CODE_139C4E:        LDA.l DATA_13DB33,x             
                    RTS                         

CODE_139C53:        LDA.w $0247                 
                    RTS                         

CODE_139C57:        LDY.w $00E7                 
                    JSR.w CODE_1396B0           
                    TYA                         
                    CLC                         
                    ADC.b #$10                  
                    TAY                         
                    LDA.b [$01],y               
                    CMP.b #$32                  
                    BNE   CODE_139C6E           
                    LDA.b #$45                  
                    STA.b [$01],y               
                    BRA   CODE_139C87           

CODE_139C6E:        LDA.b [$01],y               
                    CMP.b #$FF                  
                    BEQ   CODE_139C87           
                    LDX.b #$05                  
CODE_139C76:        CMP   DATA_13DB39,x             
                    BEQ   CODE_139C81           
                    DEX                         
                    BPL   CODE_139C76           
                    BRA   CODE_139C87           

CODE_139C81:        LDA.l DATA_13DB3F,x             
                    STA.b [$01],y               
CODE_139C87:        TYA                         
                    AND.b #$F0                  
                    CMP.b #$E0                  
                    BEQ   CODE_139C93           
                    JSR.w CODE_1396D2           
                    BRA   CODE_139C6E           

CODE_139C93:        RTS                         

CODE_139C94:        LDA.w $0533                 
                    CMP.b #$0D                  
                    BNE   CODE_139CAA           
                    LDA.w $0534                 
                    CMP.b #$02                  
                    BEQ   CODE_139CA6           
                    CMP.b #$03                  
                    BNE   CODE_139CAA           
CODE_139CA6:        LDA.b #$C0                  
                    BRA   CODE_139CAC           

CODE_139CAA:        LDA.b #$B0                  
CODE_139CAC:        STA.b $0D                   
                    STZ.b $0E                   
                    LDY.b $E7                   
CODE_139CB2:        LDX.b $0E                   
                    LDA.l DATA_13DB45,x             
                    JSR.w CODE_139CE0           
                    STA.b [$01],y               
CODE_139CBD:        JSR.w CODE_1396D2           
                    TYA                         
                    AND.b #$F0                  
                    CMP.b $0D                   
                    BEQ   CODE_139CCF           
                    LDA.l DATA_13DB47,x             
                    STA.b [$01],y               
                    BRA   CODE_139CBD           

CODE_139CCF:        JSR.w CODE_139D04           
                    LDA.b $0E                   
                    BNE   CODE_139CDF           
                    LDY.b $E7                   
                    JSR.w CODE_1396B0           
                    INC.b $0E                   
                    BRA   CODE_139CB2           

CODE_139CDF:        RTS                         

CODE_139CE0:        STA.w $0247                 
                    STX.b $0F                   
                    LDA.b [$01],y               
                    CMP.b #$FF                  
                    BEQ   CODE_139CFE           
                    LDX.b #$01                  
CODE_139CED:        CMP   DATA_13DB49,x             
                    BEQ   CODE_139CF8           
                    DEX                         
                    BPL   CODE_139CED           
                    BRA   CODE_139CFE           

CODE_139CF8:        LDA.l DATA_13DB4B,x             
                    BRA   CODE_139D01           

CODE_139CFE:        LDA.w $0247                 
CODE_139D01:        LDX.b $0F                   
                    RTS                         

CODE_139D04:        LDA.b $0E                   
                    ASL   A                     
                    TAX                         
                    LDA.b [$01],y               
                    CMP   DATA_13DB4D,x             
                    BEQ   CODE_139D17           
                    INX                         
                    CMP   DATA_13DB4D,x             
                    BNE   CODE_139D1E           
CODE_139D17:        LDA.l DATA_13DB51,x             
                    STA.b [$01],y               
                    RTS                         

CODE_139D1E:        LDA.b $0E                   
                    ASL   A                     
                    TAX                         
                    LDA.b [$01],y               
                    CMP   DATA_13DB55,x             
                    BEQ   CODE_139D31           
                    INX                         
                    CMP   DATA_13DB55,x             
                    BNE   CODE_139D37           
CODE_139D31:        LDA.l DATA_13DB59,x             
                    STA.b [$01],y               
CODE_139D37:        RTS                         

CODE_139D38:        LDY.b $E7                   
                    LDA   DATA_13DB5D               
                    STA.b [$01],y               
                    JSR.w CODE_1396D2           
                    LDA   DATA_13DB5E               
                    STA.b [$01],y               
                    JSR.w CODE_1396D2           
                    LDA   DATA_13DB5F               
                    STA.b [$01],y               
                    RTS                         

CODE_139D53:        STZ.w $0770                 
                    STZ.b $C4                   
                    LDA.w $0533                 
                    CMP.b #$0F                  
                    BNE   CODE_139D6B           
                    LDA.w $051B                 
                    BNE   CODE_139D6B           
                    INC.w $0770                 
                    LDA.b #$80                  
                    BRA   CODE_139D6D           

CODE_139D6B:        LDA.b #$60                  
CODE_139D6D:        STA.b $C5                   
                    LDA.b #$7F                  
                    STA.b $C6                   
                    LDA.w $0770                 
                    BNE   CODE_139D85           
                    LDX.w $0533                 
                    LDA.l DATA_11D098,x             
                    CLC                         
                    ADC.w $0534                 
                    BRA   CODE_139D8E           

CODE_139D85:        LDX.b #$0F                  
                    LDA.l DATA_11D098,x             
                    CLC                         
                    ADC.b #$06                  
CODE_139D8E:        TAX                         
                    LDA.l DATA_13A61D,x             
                    ASL   A                     
                    TAX                         
                    LDA   PNTR_13A6E5,x             
                    STA.b $00                   
                    INX                         
                    LDA   PNTR_13A6E5,x             
                    STA.b $01                   
                    LDA.b #$13                  
                    STA.b $02                   
                    STZ.w $02D7                 
                    STZ.w $02D8                 
                    STZ.w $02DA                 
                    LDA.b #$10                  
                    STA.w $02D9                 
CODE_139DB4:        JSL.l CODE_118B2D           
                    JSR.w CODE_1397F3           
                    LDA.w $02D9                 
                    CMP.b #$14                  
                    BNE   CODE_139DB4           
                    LDA.b #$00                  
                    STA.l $7F0000               
                    STA.l $7F0001               
                    DEC   A                     
                    STA.l $7F0002               
                    STZ.w $0202                 
                    STZ.w $0203                 
                    LDA.b #$20                  
                    STA.w $023D                 
                    LDA.b #$40                  
                    STA.w $023E                 
                    LDA.b #$80                  
                    STA.w $023F                 
                    RTL                         

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ; \ Empty.
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF                                  ; /
          
DATA_139E00:        db $00,$0A,$14,$1E,$28,$32,$3C,$46
                    db $50,$5A,$64,$6E,$78,$82,$8C,$96
                    db $A0,$AA,$B4,$BE,$C8

DATA_139E15:        db $13

DATA_139E16:        db $BA,$BA,$C7,$F8,$F8,$E5,$E5,$E5
                    db $E5,$E5,$C7,$F8,$C7,$E8,$E8,$F3
                    db $F3,$F3,$F3,$F3,$C7,$F3,$F6,$B3
                    db $52,$52,$52,$52,$52,$52,$89,$AE
                    db $BD,$BD,$F6,$BD,$BD,$BD,$BD,$BD
                    db $FD,$0E,$FD,$4D,$56,$FD,$67,$67
                    db $67,$67,$FD,$89,$FD,$AE,$70,$BD
                    db $7B,$F3,$8A,$8A,$8D,$BA,$F8,$92
                    db $F8,$95,$95,$95,$95,$95,$95,$A2
                    db $A2,$AD,$AD,$AD,$AD,$AD,$AD,$AD
                    db $F8,$C7,$B3,$F6,$F6,$F6,$F3,$AD
                    db $52,$B4,$B4,$D7,$18,$18,$18,$18
                    db $18,$18,$18,$18,$18,$D7,$B4,$1D
                    db $18,$20,$20,$20,$20,$20,$18,$B4
                    db $F6,$F6,$23,$F3,$18,$18,$26,$26
                    db $26,$F8,$F8,$2B,$2B,$2B,$2B,$2B
                    db $2B,$2B,$F8,$2B,$8C,$B7,$E4,$EB
                    db $0A,$0A,$0A,$0A,$F8,$C7,$F8,$0A
                    db $19,$1C,$1C,$1C,$1C,$1C,$0E,$FD
                    db $FD,$60,$60,$60,$67,$67,$67,$67
                    db $FD,$78,$FD,$85,$85,$85,$85,$85
                    db $85,$85,$FD,$89,$FD,$BA,$85,$BD
                    db $7B,$88,$88,$88,$BA,$88,$88,$BA
                    db $B1,$B1,$B1,$B1,$B1,$B1,$B6,$B9
                    db $B9,$B9,$B9,$D8,$FB,$FB,$FB,$BA
                    db $10,$10,$10,$10,$10,$10,$10,$10
                    db $10,$10
         
DATA_139EE8:        db $9F,$9F,$9F,$9F,$9F,$A0,$A0,$A0
                    db $A0,$A0,$9F,$9F,$9F,$A0,$A0,$A0
                    db $A0,$A0,$A0,$A0,$9F,$A0,$A0,$A1
                    db $A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2
                    db $A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2
                    db $A2,$A3,$A2,$A3,$A3,$A2,$A3,$A3
                    db $A3,$A3,$A2,$A2,$A2,$A2,$A3,$A2
                    db $A3,$A0,$A3,$A3,$A3,$9F,$9F,$A3
                    db $9F,$A3,$A3,$A3,$A3,$A3,$A3,$A3
                    db $A3,$A3,$A3,$A3,$A3,$A3,$A3,$A3
                    db $9F,$9F,$A1,$A0,$A0,$A0,$A0,$A3
                    db $A2,$A3,$A3,$A3,$A4,$A4,$A4,$A4
                    db $A4,$A4,$A4,$A4,$A4,$A3,$A3,$A4
                    db $A4,$A4,$A4,$A4,$A4,$A4,$A4,$A3
                    db $A0,$A0,$A4,$A0,$A4,$A4,$A4,$A4
                    db $A4,$9F,$9F,$A4,$A4,$A4,$A4,$A4
                    db $A4,$A4,$9F,$A4,$A4,$A4,$A4,$A4
                    db $A5,$A5,$A5,$A5,$9F,$9F,$9F,$A5
                    db $A5,$A5,$A5,$A5,$A5,$A5,$A3,$A2
                    db $A2,$A5,$A5,$A5,$A5,$A5,$A5,$A5
                    db $A2,$A5,$A2,$A5,$A5,$A5,$A5,$A5
                    db $A5,$A5,$A2,$A2,$A2,$9F,$A5,$A2
                    db $A3,$A5,$A5,$A5,$9F,$A5,$A5,$9F
                    db $A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5
                    db $A5,$A5,$A5,$A5,$A5,$A5,$A5,$9F
                    db $A6,$A6,$A6,$A6,$A6,$A6,$A6,$A6
                    db $A6,$A6 

                    db $00,$80,$F0,$80,$F0,$80,$F0,$80
                    db $F0,$80,$F0,$80,$FF

                    db $00,$00,$82,$13,$78,$14,$8C,$13
                    db $F0,$00,$70,$14,$88,$13,$8C,$13
                    db $F0,$00,$82,$13,$74,$14,$88,$13
                    db $7E,$14,$F0,$00,$84,$13,$78,$14
                    db $F0,$00,$82,$13,$78,$14,$8C,$13
                    db $F0,$00,$70,$14,$88,$13,$8C,$13
                    db $FF
       
                    db $D0,$01,$46,$1A,$6C,$1A,$82,$1A
                    db $C6,$1A,$CE,$1A,$23,$1B,$2B,$1B
                    db $4F,$1B,$85,$1B,$C1,$1B,$41,$1C
                    db $A9,$1C,$68,$1D,$F0,$01,$22,$1A
                    db $46,$1A,$A2,$1A,$4B,$1B,$67,$1B
                    db $AB,$1B,$C3,$1B,$63,$1C,$C7,$1C
                    db $2A,$1D,$8C,$1D,$F0,$01,$46,$1A
                    db $6C,$1A,$82,$1A,$C6,$1A,$CE,$1A
                    db $23,$1B,$2B,$1B,$4F,$1B,$85,$1B
                    db $C1,$1B,$41,$1C,$A9,$1C,$68,$1D
                    db $F0,$01,$22,$1A,$46,$1A,$A2,$1A
                    db $4B,$1B,$67,$1B,$AB,$1B,$C3,$1B
                    db $63,$1C,$C7,$1C,$2A,$1D,$8C,$1D
                    db $F0,$01,$46,$1A,$6C,$1A,$82,$1A
                    db $C6,$1A,$CE,$1A,$23,$1B,$2B,$1B
                    db $4F,$1B,$85,$1B,$C1,$1B,$41,$1C
                    db $A9,$1C,$68,$1D,$F0,$01,$22,$1A
                    db $46,$1A,$A2,$1A,$4B,$1B,$67,$1B
                    db $AB,$1B,$C3,$1B,$63,$1C,$C7,$1C
                    db $2A,$1D,$8C,$1D,$F0,$01,$46,$1A
                    db $6C,$1A,$82,$1A,$C6,$1A,$CE,$1A
                    db $23,$1B,$2B,$1B,$4F,$1B,$85,$1B
                    db $C1,$1B,$41,$1C,$A9,$1C,$68,$1D
                    db $F0,$01,$22,$1A,$46,$1A,$A2,$1A
                    db $4B,$1B,$67,$1B,$AB,$1B,$C3,$1B
                    db $63,$1C,$C7,$1C,$2A,$1D,$8C,$1D
                    db $F0,$01,$46,$1A,$6C,$1A,$82,$1A
                    db $C6,$1A,$CE,$1A,$23,$1B,$2B,$1B
                    db $4F,$1B,$85,$1B,$C1,$1B,$41,$1C
                    db $A9,$1C,$68,$1D,$FF

                    db $00,$80,$FF

                    db $00,$1B,$80,$13,$78,$14,$8C,$13
                    db $8E,$13,$FF

                    db $E0,$24,$FF

                    db $D0,$09,$20,$23,$80,$23,$E0,$23
                    db $41,$21,$61,$21,$63,$21,$0B,$61
                    db $3D,$63,$90,$62,$F0,$09,$20,$23
                    db $80,$23,$E0,$23,$C1,$21,$C3,$21
                    db $0B,$61,$30,$62,$3D,$63,$F0,$14
                    db $20,$23,$80,$23,$E0,$23,$41,$21
                    db $61,$21,$63,$21,$0B,$61,$3D,$63
                    db $90,$62,$F0,$14,$20,$23,$80,$23
                    db $E0,$23,$41,$21,$43,$21,$61,$21
                    db $63,$21,$0B,$61,$3D,$63,$90,$62
                    db $F0,$09,$20,$23,$80,$23,$E0,$23
                    db $41,$21,$61,$21,$63,$21,$0B,$61
                    db $3D,$63,$90,$62,$F0,$09,$20,$23
                    db $80,$23,$E0,$23,$C1,$21,$C3,$21
                    db $0B,$61,$30,$62,$3D,$63,$FF

                    db $14,$20,$23,$80,$23,$E0,$23,$41
                    db $21,$61,$21,$0B,$61,$3D,$63,$90
                    db $62,$F0,$14,$20,$23,$80,$23,$E0
                    db $23,$41,$21,$61,$21,$63,$21,$0B
                    db $61,$3D,$63,$90,$62,$F0,$09,$20
                    db $23,$80,$23,$E0,$23,$41,$21,$61
                    db $21,$63,$21,$0B,$61,$3D,$63,$90
                    db $62,$F0,$09,$20,$23,$80,$23,$0B
                    db $61,$30,$62,$3D,$63,$FF

                    db $D0,$02,$71,$21,$91,$21,$93,$21
                    db $40,$23,$B0,$23,$02,$26,$D4,$24
                    db $D7,$25,$0B,$27,$04,$28,$57,$29
                    db $A8,$32,$5D,$34,$F0,$02,$40,$23
                    db $B0,$23,$09,$26,$64,$24,$66,$26
                    db $67,$25,$76,$26,$0B,$27,$C3,$2A
                    db $0A,$2C,$C9,$2D,$5D,$34,$F0,$02
                    db $40,$23,$B0,$23,$09,$26,$64,$24
                    db $67,$25,$0B,$27,$C3,$2A,$0A,$2C
                    db $C9,$2D,$56,$2E,$5D,$34,$F0,$02
                    db $95,$21,$97,$21,$40,$23,$B0,$23
                    db $09,$26,$64,$24,$66,$26,$67,$25
                    db $76,$26,$C3,$2A,$0B,$27,$0A,$2C
                    db $F0,$02,$71,$21,$91,$21,$93,$21
                    db $40,$23,$B0,$23,$02,$26,$D4,$24
                    db $D7,$25,$0B,$27,$04,$28,$57,$29
                    db $A8,$32,$5D,$34,$F0,$02,$40,$23
                    db $B0,$23,$09,$26,$64,$24,$66,$26
                    db $67,$25,$76,$26,$0B,$27,$C3,$2A
                    db $0A,$2C,$C9,$2D,$5D,$34,$FF

                    db $D1,$02,$40,$23,$B0,$23,$62,$24
                    db $0B,$27,$04,$28,$57,$29,$59,$29
                    db $C7,$2B,$C9,$2B,$A0,$33,$5D,$34
                    db $F0,$02,$40,$23,$B0,$23,$0B,$27
                    db $0A,$2C,$5A,$2F,$7B,$22,$99,$22
                    db $9B,$22,$9D,$22,$64,$24,$67,$25
                    db $56,$30,$01,$31,$C4,$34,$FF

                    db $C4,$03,$82,$35,$8A,$35,$F0,$03
                    db $80,$35,$8E,$35,$69,$12,$F0,$03
                    db $8A,$35,$76,$12,$7D,$36,$F0,$03
                    db $8D,$35,$F0,$03,$81,$35,$74,$37
                    db $F0,$03,$55,$12,$FF
          
                    db $D0,$15,$F0,$1D,$F0,$15,$F0,$1D
                    db $FF,$15,$F0,$1D,$F0,$15,$FF,$D0
                    db $04,$04,$1E,$09,$1F,$0E,$20,$F0
                    db $04,$05,$1F,$0C,$1E,$F0,$04,$01
                    db $1F,$04,$1E,$0C,$20,$F0,$04,$04
                    db $1E,$09,$1F,$0E,$20,$F0,$04,$05
                    db $1F,$0C,$1E,$F0,$04,$01,$1F,$04
                    db $1E,$0C,$20,$F0,$04,$04,$1E,$09
                    db $1F,$0E,$20,$F0,$04,$05,$1F,$FF

                    db $00,$03,$70,$69,$29,$38,$FF

                    db $D0,$1E,$F0,$1E,$F0,$1E,$F0,$1E
                    db $F0,$1E,$F0,$1E,$F0,$1E,$F0,$1E
                    db $FF
                             
                    db $00,$0A,$40,$39,$4F,$3A,$F0,$0A
                    db $40,$3B,$42,$3B,$44,$3B,$46,$3B
                    db $48,$3B,$4A,$3B,$4C,$3C,$6E,$3E
                    db $F0,$0A,$4D,$3A,$4E,$3B,$F0,$0A
                    db $40,$3B,$42,$3C,$47,$3A,$48,$3B
                    db $4A,$3B,$4C,$3C,$F0,$26,$40,$3F
                    db $42,$3F,$44,$3F,$45,$3A,$46,$3B
                    db $77,$3D,$5E,$40,$F0,$26,$FF

                    db $D0,$1E,$F0,$1F,$F0,$1E,$F0,$1F
                    db $FF

                    db $C1,$1A,$40,$3B,$42,$3B,$44,$3B
                    db $45,$3C,$67,$3E,$4E,$3B,$4E,$3A
                    db $FF
           
                    db $C1,$04,$09,$1F,$F0,$80,$00,$20
                    db $FF

                    db $C1,$16,$00,$67,$04,$1E,$08,$1F
                    db $0D,$68,$FF
           
                    db $D1,$04,$04,$1E,$09,$1F,$0E,$20
                    db $F0,$04,$05,$1F,$0C,$1E,$FF

                    db $C1,$15,$FF

                    db $00,$05,$F0,$05,$FF
        
                    db $00,$80,$FF

                    db $00,$05,$F0,$05,$F0,$05,$F0,$05
                    db $F0,$05,$F0,$05,$FF
              
                    db $C0,$25,$F0,$25,$F0,$25,$F0,$25
                    db $F0,$25,$FF

                    db $00,$0D,$F0,$0E,$F0,$0D,$FF

                    db $00,$80,$A6,$41,$87,$45,$F0,$80
                    db $92,$41,$F0,$80,$A4,$42,$86,$46
                    db $BF,$43,$F0,$80,$AB,$44,$8D,$47
                    db $F0,$80,$B8,$43,$F0,$80,$B1,$41
                    db $92,$45,$FF
                 
                    db $00,$80,$80,$5F,$56,$4B,$74,$49
                    db $AA,$4B,$5F,$4B,$F0,$80,$A3,$4B
                    db $71,$49,$B7,$4A,$8E,$4B,$AC,$49
                    db $F0,$80,$96,$4B,$B4,$49,$DA,$4A
                    db $F0,$80,$A0,$4B,$94,$4B,$72,$49
                    db $B8,$4A,$9E,$49,$F0,$80,$72,$4B
                    db $B4,$4C,$A9,$4A,$CF,$49,$F0,$80
                    db $01,$4B,$A5,$4B,$73,$49,$C1,$4D
                    db $FF
           
                    db $D0,$06,$F0,$06,$FF

                    db $00,$80,$FF

                    db $00,$80,$FF

                    db $00,$80,$FF

                    db $00,$10,$F0,$10,$FF
    
                    db $C4,$0F,$85,$4F,$A4,$4F,$79,$4F
                    db $98,$4F,$8A,$4F,$A0,$52,$A3,$53
                    db $A7,$56,$F0,$0F,$66,$4F,$85,$4F
                    db $79,$4F,$98,$4F,$8A,$4F,$AC,$50
                    db $AE,$50,$F0,$0F,$AE,$54,$76,$4F
                    db $95,$4F,$88,$4F,$AF,$4F,$A0,$50
                    db $A2,$50,$A4,$55,$F0,$0F,$61,$4F
                    db $80,$4F,$A2,$4F,$8A,$4F,$79,$4F
                    db $98,$4F,$A0,$51,$A4,$52,$A7,$53
                    db $F0,$0F,$66,$4F,$85,$4F,$A4,$4F
                    db $97,$4F,$8A,$4F,$A3,$53,$F0,$0F
                    db $72,$4F,$81,$4F,$94,$4F,$A6,$55
                    db $FF

                    db $C1,$80,$00,$04,$F0,$80,$9C,$38
                    db $F0,$80,$F0,$11,$52,$4F,$25,$4F
                    db $57,$4F,$7C,$4F,$4B,$4F,$8A,$4F
                    db $79,$4F,$98,$4F,$86,$4F,$74,$4F
                    db $80,$4F,$B1,$4F,$93,$4F,$A5,$4F
                    db $AD,$4F,$FF

                    db $C1,$80,$00,$04,$F0,$80,$9C,$38
                    db $F0,$80,$F0,$80,$00,$04,$F0,$80
                    db $F0,$80,$F0,$11,$52,$4F,$25,$4F
                    db $57,$4F,$4B,$4F,$8A,$4F,$79,$4F
                    db $98,$4F,$86,$4F,$74,$4F,$80,$4F
                    db $93,$4F,$A5,$4F,$FF
              
                    db $D1,$18,$1A,$38,$F0,$19,$FF

                    db $C4,$0F,$85,$4F,$A4,$4F,$79,$4F
                    db $98,$4F,$8A,$4F,$A0,$52,$A3,$53
                    db $A7,$56,$F0,$0F,$66,$4F,$85,$4F
                    db $79,$4F,$98,$4F,$8A,$4F,$FF

                    db $D0,$20,$F0,$21,$F0,$20,$F0,$21
                    db $F0,$20,$F0,$21,$F0,$20,$FF

                    db $00,$80,$FF

                    db $D1,$01,$46,$1A,$6C,$1A,$82,$1A
                    db $C6,$1A,$CE,$1A,$23,$1B,$2B,$1B
                    db $4F,$1B,$85,$1B,$C1,$1B,$41,$1C
                    db $A9,$1C,$68,$1D,$F0,$01,$22,$1A
                    db $46,$1A,$A2,$1A,$4B,$1B,$67,$1B
                    db $AB,$1B,$C3,$1B,$63,$1C,$C7,$1C
                    db $2A,$1D,$8C,$1D,$FF

                    db $C1,$16,$00,$67,$04,$1E,$08,$1F
                    db $0D,$68,$F0,$17,$F0,$17,$FF

                    db $C1,$1E,$F0,$1F,$F0,$1E,$FF

                    db $01,$1A,$40,$3B,$42,$3B,$44,$3B
                    db $45,$3C,$67,$3E,$4E,$3B,$4E,$3A
                    db $FF

                    db $C4,$0D,$F0,$0E,$F0,$0D,$F0,$0E
                    db $F0,$0D,$F0,$0E,$FF

                    db $00,$80,$FF

                    db $00,$12,$B6,$57,$30,$58,$9F,$5A
                    db $F0,$12,$B0,$57,$BA,$57,$71,$5B
                    db $26,$5C,$A5,$59,$F0,$12,$B4,$57
                    db $BE,$57,$54,$5D,$9E,$5A,$F0,$12
                    db $B8,$57,$70,$5B,$25,$5C,$A3,$59
                    db $FF

                    db $D0,$22,$F0,$23,$FF

                    db $00,$80,$FF

                    db $D8,$0B,$F0,$0B,$08,$4E,$F0,$0B
                    db $F0,$0B,$08,$4E,$F0,$0B,$F0,$0B
                    db $08,$4E,$F0,$0B,$F0,$0B,$08,$4E
                    db $F0,$0B,$F0,$0B,$08,$4E,$FF

                    db $D9,$1C,$00,$6A,$B0,$6A,$72,$6C
                    db $76,$6C,$7A,$6C,$F0,$1C,$00,$6A
                    db $B0,$6A,$7A,$6C,$7E,$6C,$F0,$1C
                    db $00,$6A,$B0,$6A,$38,$6B,$72,$6C
                    db $76,$6C,$FF

                    db $D0,$0C,$F0,$0C,$F0,$0C,$F0,$0C
                    db $F0,$0C,$F0,$0C,$FF

                    db $0C,$F0,$0C,$F0,$0C,$F0,$0C,$FF

                    db $00,$80,$FF

PNTR_13A613:        dw DATA_13A615

DATA_13A615:        db $BF,$00,$BF,$00,$BF,$00,$BF,$00      ; Empty tile. (Tile FF)

DATA_13A61D:        db $00,$00,$00,$01,$01,$00,$00,$00
                    db $00,$00,$00,$01,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$0D,$02,$02
                    db $02,$00,$00,$00,$00,$00,$03,$05
                    db $05,$00,$03,$00,$00,$00,$00,$00
                    db $05,$04,$05,$05,$04,$05,$00,$00
                    db $00,$00,$05,$03,$05,$05,$05,$05
                    db $05,$0D,$00,$00,$00,$00,$01,$00
                    db $01,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $01,$00,$02,$02,$02,$02,$0D,$08
                    db $02,$00,$07,$07,$00,$00,$00,$00
                    db $00,$00,$00,$00,$06,$07,$07,$00
                    db $06,$00,$00,$00,$00,$00,$06,$07
                    db $02,$02,$00,$0D,$06,$06,$00,$00
                    db $00,$01,$01,$00,$00,$00,$00,$00
                    db $00,$00,$01,$0B,$0B,$0B,$0B,$0B
                    db $00,$00,$00,$00,$01,$00,$01,$0C
                    db $00,$01,$00,$00,$00,$00,$04,$05
                    db $05,$05,$05,$05,$04,$00,$00,$00
                    db $05,$08,$05,$00,$00,$00,$00,$00
                    db $00,$00,$05,$03,$05,$00,$00,$05
                    db $05,$00,$00,$00,$00,$09,$09,$00
                    db $0A,$0A,$00,$00,$00,$00,$00,$0A
                    db $0A,$0A,$0A,$0A,$0A,$0A,$0A,$00

PNTR_13A6E5:        dw DATA_13A701                          ; Tileset 0.
                    dw DATA_13A969                          ; Tileset 1.
                    dw DATA_13A9C9                          ; Tileset 2.
                    dw DATA_13AE41                          ; Tileset 3.
                    dw DATA_13B029                          ; Tileset 4.
                    dw DATA_13B201                          ; Tileset 5.
                    dw DATA_13B351                          ; Tileset 6.
                    dw DATA_13B3D1                          ; Tileset 7.
                    dw DATA_13B7C9                          ; Tileset 8.
                    dw DATA_13B9E1                          ; Tileset 9.
                    dw DATA_13BDB1                          ; Tileset A.
                    dw DATA_13C151                          ; Tileset B.
                    dw DATA_13C309                          ; Tileset C.
                    dw DATA_13C3E9                          ; Tileset D.

DATA_13A701:        db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $00,$1D,$01,$1D,$10,$1D,$13,$1D
                    db $02,$1D,$03,$1D,$13,$1D,$13,$1D
                    db $04,$1D,$05,$1D,$13,$1D,$15,$1D
                    db $20,$1D,$13,$1D,$30,$1D,$31,$1D
                    db $13,$1D,$13,$1D,$32,$1D,$33,$1D
                    db $13,$1D,$25,$1D,$34,$1D,$35,$1D
                    db $21,$1D,$13,$1D,$13,$1D,$13,$1D
                    db $13,$1D,$11,$1D,$13,$1D,$13,$1D
                    db $13,$1D,$13,$1D,$22,$1D,$13,$1D
                    db $13,$1D,$13,$1D,$13,$1D,$12,$1D
                    db $06,$1D,$07,$1D,$16,$1D,$13,$1D
                    db $08,$1D,$09,$1D,$13,$1D,$13,$1D
                    db $0A,$1D,$0B,$1D,$13,$1D,$1B,$1D
                    db $26,$1D,$13,$1D,$36,$1D,$37,$1D
                    db $13,$1D,$13,$1D,$38,$1D,$39,$1D
                    db $13,$1D,$2B,$1D,$3A,$1D,$3B,$1D
                    db $14,$1D,$13,$1D,$24,$1D,$13,$1D
                    db $13,$1D,$17,$1D,$13,$1D,$27,$1D
                    db $18,$1D,$13,$1D,$28,$1D,$13,$1D
                    db $13,$1D,$19,$1D,$13,$1D,$29,$1D
                    db $13,$1D,$13,$1D,$13,$1D,$13,$1D
                    db $80,$1D,$81,$1D,$4A,$05,$4B,$05
                    db $82,$1D,$83,$1D,$EE,$05,$EF,$05
                    db $5A,$05,$5B,$05,$B7,$05,$B7,$05
                    db $FA,$05,$FB,$05,$B7,$05,$B7,$05
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$40,$1D,$41,$1D
                    db $70,$1D,$71,$1D,$42,$1D,$43,$1D
                    db $BF,$00,$BF,$00,$44,$1D,$45,$1D
                    db $84,$1D,$85,$1D,$94,$1D,$95,$1D
                    db $86,$1D,$87,$1D,$96,$1D,$97,$1D
                    db $50,$1D,$51,$1D,$60,$1D,$61,$1D
                    db $52,$1D,$53,$1D,$62,$1D,$63,$1D
                    db $54,$1D,$55,$1D,$64,$1D,$65,$1D
                    db $66,$1D,$67,$1D,$76,$1D,$77,$1D
                    db $68,$1D,$69,$1D,$78,$1D,$79,$1D
                    db $A4,$1D,$A5,$1D,$76,$1D,$B5,$1D
                    db $A6,$1D,$A7,$1D,$78,$1D,$79,$1D
                    db $72,$1D,$73,$1D,$7A,$1D,$6B,$1D
                    db $74,$1D,$67,$1D,$75,$1D,$77,$1D
                    db $6C,$1D,$6D,$1D,$7C,$1D,$7D,$1D
                    db $6E,$1D,$6F,$1D,$7E,$1D,$7F,$1D
                    db $7A,$1D,$7B,$1D,$7A,$1D,$7B,$1D
                    db $4E,$1D,$4F,$1D,$56,$1D,$57,$1D
                    db $5E,$1D,$5F,$1D,$58,$1D,$59,$1D
                    db $4C,$1D,$4D,$1D,$5C,$1D,$5D,$1D
                    db $80,$1D,$81,$1D,$58,$1D,$59,$1D
                    db $82,$1D,$83,$1D,$56,$1D,$57,$1D
                    db $13,$1D,$13,$1D,$88,$1D,$89,$1D
                    db $B8,$1D,$B9,$1D,$8A,$1D,$8B,$1D
                    db $13,$1D,$13,$1D,$8C,$1D,$8D,$1D
                    db $90,$1D,$91,$1D,$A0,$1D,$A1,$1D
                    db $92,$1D,$93,$1D,$A2,$1D,$A3,$1D
                    db $98,$1D,$99,$1D,$A8,$1D,$A9,$1D
                    db $9A,$1D,$9B,$1D,$AA,$1D,$AB,$1D
                    db $9C,$1D,$9D,$1D,$AC,$1D,$AD,$1D
                    db $8E,$1D,$8F,$1D,$9E,$1D,$9F,$1D
                    db $AE,$1D,$AF,$1D,$BE,$1D,$BF,$1D
                    db $B0,$1D,$B1,$1D,$9E,$1D,$B6,$1D
                    db $B2,$1D,$B3,$1D,$78,$1D,$BF,$1D
                    db $BA,$1D,$BB,$1D,$7A,$1D,$6B,$1D
                    db $13,$1D,$8F,$1D,$BD,$1D,$9F,$1D
                    db $C0,$05,$C1,$05,$D0,$05,$D1,$05
                    db $C2,$05,$C3,$05,$D2,$05,$D3,$05
                    db $E0,$05,$E1,$05,$F0,$05,$F1,$05
                    db $E2,$05,$E3,$05,$F2,$05,$F3,$05
                    db $88,$11,$89,$11,$98,$11,$99,$11
                    db $8A,$11,$8B,$11,$9A,$11,$9B,$11
                    db $A8,$11,$A9,$11,$B8,$11,$B9,$11
                    db $AA,$11,$AB,$11,$BA,$11,$BB,$11
                    db $B8,$11,$B9,$11,$BA,$11,$BB,$11

DATA_13A969:        db $C4,$05,$C5,$05,$D4,$05,$D5,$05
                    db $C6,$05,$C7,$05,$D6,$05,$D7,$05
                    db $E4,$05,$E5,$05,$F4,$05,$F5,$05
                    db $E6,$05,$E7,$05,$F6,$05,$F7,$05
                    db $C6,$05,$C7,$05,$D6,$05,$DB,$05
                    db $C4,$05,$C5,$05,$D8,$05,$F9,$05
                    db $E6,$05,$EB,$05,$F6,$05,$F7,$05
                    db $E8,$05,$E9,$05,$F4,$05,$F5,$05
                    db $C4,$05,$C9,$05,$D8,$05,$D9,$05
                    db $CA,$05,$CB,$05,$DA,$05,$D7,$05
                    db $C4,$05,$C9,$05,$D4,$05,$F8,$05
                    db $CA,$05,$CB,$05,$DA,$05,$DB,$05

DATA_13A9C9:        db $E5,$05,$C4,$05,$E5,$05,$C4,$05
                    db $C4,$05,$CF,$05,$C4,$05,$CF,$05
                    db $C6,$05,$C7,$05,$E5,$05,$C4,$05
                    db $C7,$05,$C7,$05,$C4,$05,$C4,$05
                    db $E4,$05,$C6,$05,$F4,$05,$E5,$05
                    db $C7,$05,$E4,$05,$C4,$05,$F4,$05
                    db $D5,$05,$D6,$05,$C4,$05,$C4,$05
                    db $D7,$05,$E5,$05,$C4,$05,$E5,$05
                    db $C4,$05,$C4,$05,$C4,$05,$C4,$05
                    db $C4,$05,$CA,$05,$C4,$05,$DA,$05
                    db $CB,$05,$D4,$05,$DB,$05,$D4,$05
                    db $E5,$05,$C4,$05,$D5,$05,$D6,$05
                    db $C4,$05,$C4,$05,$D6,$05,$D6,$05
                    db $F4,$05,$E5,$05,$D7,$05,$D5,$05
                    db $C4,$05,$F4,$05,$D6,$05,$D7,$05
                    db $C4,$05,$D5,$05,$C4,$05,$C6,$05
                    db $D6,$05,$D6,$05,$C7,$05,$C7,$05
                    db $D6,$05,$CA,$05,$C7,$05,$DA,$05
                    db $D6,$05,$D7,$05,$C7,$05,$E4,$05
                    db $C4,$05,$C4,$05,$C6,$05,$C7,$05
                    db $D5,$05,$D6,$05,$C6,$05,$C7,$05
                    db $C3,$05,$C0,$05,$D3,$05,$D0,$05
                    db $C0,$05,$C0,$05,$D0,$05,$D0,$05
                    db $C0,$05,$C2,$05,$D0,$05,$D2,$05
                    db $D4,$05,$D4,$05,$D1,$05,$C5,$05
                    db $D4,$05,$D4,$05,$C5,$05,$C5,$05
                    db $D4,$05,$D4,$05,$C5,$05,$C1,$05
                    db $D4,$05,$CC,$05,$C5,$05,$DC,$05
                    db $CD,$05,$D4,$05,$DD,$05,$D4,$05
                    db $E6,$05,$E7,$05,$C5,$05,$CE,$05
                    db $F6,$05,$F7,$05,$CF,$05,$DE,$05
                    db $D4,$05,$D4,$05,$DF,$05,$85,$05
                    db $D4,$45,$D4,$05,$C5,$45,$C5,$05
                    db $D4,$45,$D4,$05,$C5,$45,$B0,$05
                    db $A0,$05,$A1,$05,$B1,$05,$B2,$05
                    db $A2,$05,$A3,$05,$B3,$05,$84,$05
                    db $D4,$05,$D4,$05,$C5,$05,$D1,$05
                    db $D4,$05,$C4,$05,$D4,$05,$C4,$05
                    db $E0,$05,$E1,$05,$C4,$05,$F0,$05
                    db $E2,$05,$E3,$05,$F1,$05,$F2,$05
                    db $C4,$05,$C4,$05,$C4,$05,$90,$05
                    db $80,$05,$81,$05,$91,$05,$92,$05
                    db $82,$05,$83,$05,$93,$05,$F5,$05
                    db $F5,$05,$C4,$45,$C4,$05,$C4,$45
                    db $94,$05,$95,$05,$94,$05,$95,$05
                    db $C4,$05,$E5,$05,$C4,$05,$E5,$05
                    db $D4,$05,$C4,$05,$D4,$05,$D6,$05
                    db $C4,$05,$C8,$05,$D6,$05,$D8,$05
                    db $C9,$05,$D4,$05,$D9,$05,$D4,$05
                    db $F5,$05,$C4,$45,$C4,$05,$C4,$05
                    db $C4,$05,$E5,$05,$C4,$05,$D5,$05
                    db $D4,$05,$C7,$05,$D4,$05,$C4,$05
                    db $C4,$05,$CA,$05,$C6,$05,$DA,$05
                    db $C4,$05,$C4,$05,$C7,$05,$E4,$05
                    db $C4,$05,$C6,$05,$C4,$05,$E5,$05
                    db $E8,$05,$E9,$05,$F8,$05,$F9,$05
                    db $EA,$05,$EB,$05,$FA,$05,$FB,$05
                    db $D4,$05,$CC,$05,$D1,$05,$DC,$05
                    db $F5,$05,$C4,$45,$E5,$05,$C4,$45
                    db $D6,$05,$D6,$05,$E4,$05,$C6,$05
                    db $D6,$05,$D7,$05,$C7,$05,$C7,$05
                    db $D5,$05,$CA,$05,$C7,$05,$DA,$05
                    db $D5,$05,$D6,$05,$C4,$05,$C6,$05
                    db $F4,$05,$E5,$05,$F4,$05,$E5,$05
                    db $C4,$05,$C8,$05,$C4,$05,$D8,$05
                    db $D6,$05,$D6,$05,$C4,$05,$C6,$05
                    db $D6,$05,$D6,$05,$C7,$05,$E4,$05
                    db $F4,$05,$D5,$05,$F4,$05,$C6,$05
                    db $D6,$05,$D7,$05,$C4,$05,$C4,$05
                    db $D4,$05,$D4,$05,$D1,$05,$C1,$05
                    db $D4,$05,$CC,$05,$C5,$05,$DC,$05
                    db $EC,$05,$ED,$05,$FC,$05,$FD,$05
                    db $EE,$05,$EF,$05,$FE,$05,$FF,$05
                    db $CD,$05,$D4,$05,$DD,$05,$D4,$05
                    db $D4,$05,$D4,$05,$D1,$05,$D1,$05
                    db $E5,$05,$F4,$05,$E5,$05,$F4,$05
                    db $E5,$05,$E5,$05,$E5,$05,$E5,$05
                    db $E5,$05,$E5,$05,$E5,$05,$D5,$05
                    db $D6,$05,$D6,$05,$C6,$05,$C7,$05
                    db $C4,$05,$C4,$05,$C7,$05,$C7,$05
                    db $D6,$05,$D6,$05,$C4,$05,$C4,$05
                    db $D5,$05,$D6,$05,$C7,$05,$E4,$05
                    db $C7,$05,$CA,$05,$C4,$05,$DA,$05
                    db $C4,$05,$CA,$05,$D6,$05,$DA,$05
                    db $C6,$05,$CA,$05,$E5,$05,$DA,$05
                    db $E5,$05,$C8,$05,$D5,$05,$D8,$05
                    db $F5,$05,$E4,$05,$C4,$05,$F4,$05
                    db $F5,$05,$C4,$05,$D5,$05,$D6,$05
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $B4,$05,$B5,$05,$B4,$05,$B5,$05
                    db $C4,$05,$A7,$05,$C4,$05,$A7,$05
                    db $C7,$05,$E4,$05,$D6,$05,$D7,$05
                    db $C6,$05,$C7,$05,$D5,$05,$D6,$05
                    db $D4,$05,$C7,$05,$D4,$05,$D6,$05
                    db $C6,$05,$CA,$05,$D5,$05,$DA,$05
                    db $C7,$05,$A7,$05,$D6,$05,$AB,$05
                    db $D4,$05,$E4,$05,$D4,$05,$D7,$05
                    db $C7,$05,$CA,$05,$D6,$05,$DA,$05
                    db $C6,$05,$A7,$05,$D5,$05,$A7,$05
                    db $B8,$05,$B9,$05,$A8,$05,$A9,$05
                    db $D4,$05,$D4,$05,$D4,$05,$C5,$05
                    db $CA,$05,$CB,$05,$A4,$05,$A5,$05
                    db $D4,$05,$D4,$05,$D4,$05,$B0,$05
                    db $D4,$05,$B6,$05,$C5,$05,$A6,$05
                    db $88,$05,$89,$05,$98,$05,$99,$05
                    db $8F,$05,$81,$05,$91,$05,$92,$05
                    db $8C,$05,$8D,$05,$9C,$05,$9D,$05
                    db $8E,$05,$C4,$05,$9E,$05,$C4,$05
                    db $C4,$05,$8C,$05,$C4,$05,$9C,$05
                    db $8D,$05,$8E,$05,$9D,$05,$9E,$05
                    db $C4,$05,$A7,$05,$C4,$05,$B7,$05
                    db $D4,$05,$F4,$05,$D4,$05,$F4,$05
                    db $A8,$05,$A9,$05,$88,$05,$89,$05
                    db $B4,$05,$B5,$05,$86,$05,$87,$05
                    db $F5,$05,$C4,$05,$C4,$05,$C4,$05
                    db $88,$05,$89,$05,$88,$05,$89,$05
                    db $96,$05,$97,$05,$B4,$05,$B5,$05
                    db $8A,$05,$AA,$05,$9A,$05,$BA,$05
                    db $8B,$05,$8B,$05,$9B,$05,$9B,$05
                    db $8B,$05,$8A,$05,$9B,$05,$9A,$05
                    db $B6,$05,$B6,$05,$A6,$05,$A6,$05
                    db $A7,$05,$A7,$05,$B7,$05,$B7,$05
                    db $A7,$05,$A7,$05,$A7,$05,$A7,$05
                    db $A7,$05,$AB,$05,$A7,$05,$A7,$05
                    db $D4,$05,$8C,$05,$D4,$05,$9C,$05
                    db $C6,$05,$A7,$05,$D5,$05,$AB,$05
                    db $C7,$05,$A7,$05,$D6,$05,$A7,$05
                    db $D4,$05,$B6,$05,$C5,$05,$C5,$05
                    db $8E,$05,$F4,$05,$9E,$05,$F4,$05
                    db $C4,$05,$C4,$05,$BB,$05,$C4,$05
                    db $E8,$05,$AC,$05,$F8,$05,$BC,$05
                    db $AD,$05,$EB,$05,$BD,$05,$FB,$05
                    db $EC,$05,$AE,$05,$FC,$05,$BE,$05
                    db $AF,$05,$EF,$05,$BF,$05,$FF,$05
                    db $A7,$05,$A7,$05,$B7,$05,$AB,$05
                    db $C4,$45,$CA,$05,$C4,$05,$DA,$05

DATA_13AE41:        db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$8F,$09,$9E,$09,$9F,$09
                    db $BE,$00,$BE,$00,$BE,$00,$BE,$00
                    db $80,$1D,$81,$1D,$90,$1D,$91,$1D
                    db $82,$1D,$84,$1D,$92,$1D,$94,$1D
                    db $85,$1D,$81,$1D,$95,$1D,$91,$1D
                    db $83,$1D,$BF,$00,$93,$1D,$BF,$00
                    db $BF,$00,$68,$05,$68,$05,$69,$05
                    db $6A,$05,$BF,$00,$6B,$05,$6A,$05
                    db $40,$1D,$41,$1D,$50,$1D,$51,$1D
                    db $BF,$00,$BF,$00,$52,$1D,$53,$1D
                    db $BF,$00,$45,$1D,$54,$1D,$55,$1D
                    db $46,$1D,$47,$1D,$56,$1D,$57,$1D
                    db $BF,$00,$87,$1D,$88,$1D,$97,$1D
                    db $A5,$1D,$A1,$1D,$B5,$1D,$B1,$1D
                    db $A2,$1D,$A4,$1D,$B2,$1D,$B4,$1D
                    db $A2,$1D,$86,$1D,$B2,$1D,$96,$1D
                    db $BF,$00,$BF,$00,$4A,$1D,$4B,$1D
                    db $BF,$00,$BF,$00,$48,$1D,$49,$1D
                    db $BF,$00,$BF,$00,$4C,$1D,$4D,$1D
                    db $BF,$00,$68,$05,$78,$05,$79,$05
                    db $69,$05,$6C,$05,$7A,$05,$7A,$05
                    db $6D,$05,$6B,$05,$7B,$05,$7B,$05
                    db $6A,$05,$BF,$00,$7C,$05,$7D,$05
                    db $60,$1D,$71,$1D,$70,$1D,$71,$1D
                    db $62,$1D,$63,$1D,$71,$1D,$73,$1D
                    db $70,$1D,$65,$1D,$71,$1D,$75,$1D
                    db $66,$1D,$67,$1D,$76,$1D,$77,$1D
                    db $98,$1D,$89,$1D,$71,$1D,$99,$1D
                    db $8A,$1D,$8B,$1D,$9A,$1D,$9B,$1D
                    db $A6,$1D,$A7,$1D,$B6,$1D,$B7,$1D
                    db $A8,$1D,$A9,$1D,$B8,$1D,$B9,$1D
                    db $AA,$1D,$AB,$1D,$BA,$1D,$BB,$1D
                    db $AC,$1D,$AD,$1D,$BC,$1D,$BD,$1D
                    db $AB,$1D,$AE,$1D,$B8,$1D,$BE,$1D
                    db $AF,$1D,$AB,$1D,$BF,$1D,$BB,$1D
                    db $8C,$1D,$8D,$1D,$9C,$1D,$9D,$1D
                    db $5A,$1D,$5B,$1D,$71,$1D,$70,$1D
                    db $58,$1D,$59,$1D,$71,$1D,$70,$1D
                    db $5C,$1D,$5D,$1D,$71,$1D,$70,$1D
                    db $5E,$1D,$5F,$1D,$71,$1D,$70,$1D
                    db $70,$1D,$71,$1D,$71,$1D,$70,$1D
                    db $BF,$00,$BF,$00,$BF,$00,$8E,$05
                    db $BF,$00,$BF,$00,$8E,$05,$BF,$00
                    db $61,$05,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$72,$05,$BF,$00
                    db $BF,$00,$BF,$00,$72,$45,$BF,$00
                    db $8E,$05,$BF,$00,$BF,$00,$8E,$05
                    db $BF,$00,$61,$05,$BF,$00,$BF,$00
                    db $72,$05,$BF,$00,$BF,$00,$BF,$00
                    db $8E,$05,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$8E,$05,$BF,$00,$BF,$00
                    db $BF,$00,$72,$05,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$61,$05
                    db $BF,$00,$8E,$05,$61,$05,$BF,$00
                    db $69,$05,$6C,$05,$6C,$05,$69,$05
                    db $6D,$05,$6B,$05,$6B,$05,$6D,$05
                    db $5E,$1D,$6E,$1D,$71,$1D,$70,$1D
                    db $BF,$00,$45,$1D,$74,$1D,$55,$1D
                    db $BF,$00,$BF,$00,$BF,$00,$64,$1D
                    db $AE,$18,$AF,$18,$AE,$18,$AF,$18

DATA_13B029:        db $E8,$05,$E9,$05,$F8,$05,$F9,$05
                    db $EA,$05,$EB,$05,$FA,$05,$FB,$05
                    db $C0,$05,$C1,$05,$D0,$05,$D1,$05
                    db $F6,$05,$F7,$05,$D2,$05,$D3,$05
                    db $F4,$05,$F5,$05,$D0,$05,$D1,$05
                    db $C2,$05,$E7,$05,$D2,$05,$CB,$05
                    db $CC,$05,$C1,$05,$DC,$05,$D1,$05
                    db $E0,$05,$E1,$05,$F0,$05,$F1,$05
                    db $E2,$05,$E3,$05,$F2,$05,$F3,$05
                    db $E2,$05,$E3,$05,$F2,$05,$DB,$05
                    db $CD,$05,$E1,$05,$DD,$05,$F1,$05
                    db $C8,$05,$C9,$05,$D8,$05,$D9,$05
                    db $C4,$05,$C5,$05,$D4,$05,$D5,$05
                    db $C6,$05,$C7,$05,$D6,$05,$D7,$05
                    db $C0,$1D,$C1,$1D,$D0,$1D,$D1,$1D
                    db $C2,$1D,$C3,$1D,$D2,$1D,$D3,$1D
                    db $CE,$05,$C5,$05,$DE,$05,$D5,$05
                    db $E4,$05,$E5,$05,$C8,$05,$C9,$05
                    db $E5,$05,$E5,$05,$C9,$05,$C9,$05
                    db $C4,$1D,$C5,$1D,$D4,$1D,$D5,$1D
                    db $C6,$1D,$C7,$1D,$D6,$1D,$D7,$1D
                    db $E0,$1D,$E1,$1D,$F0,$1D,$F1,$1D
                    db $E2,$1D,$E3,$1D,$F2,$1D,$F3,$1D
                    db $D8,$05,$D9,$05,$D8,$05,$D9,$05
                    db $D9,$05,$D9,$05,$D9,$05,$D9,$05
                    db $C9,$05,$C9,$05,$D9,$05,$D9,$05
                    db $C9,$05,$CA,$05,$D9,$05,$DA,$05
                    db $E0,$1D,$E1,$05,$F0,$1D,$F1,$1D
                    db $E5,$05,$E6,$05,$C9,$05,$CA,$05
                    db $C6,$1D,$C7,$1D,$D6,$1D,$D7,$1D
                    db $D9,$05,$DA,$05,$D9,$05,$DA,$05
                    db $C6,$1D,$C7,$1D,$C6,$1D,$D7,$1D
                    db $BF,$00,$68,$05,$68,$05,$69,$05
                    db $6A,$05,$BF,$00,$6B,$05,$6A,$05
                    db $69,$05,$6C,$05,$6C,$05,$6C,$05
                    db $6D,$05,$6B,$05,$7B,$05,$7B,$05
                    db $C2,$1D,$E7,$1D,$D2,$1D,$CB,$1D
                    db $7B,$05,$7B,$05,$7B,$05,$7B,$05
                    db $7D,$05,$BF,$00,$7C,$05,$7D,$05
                    db $BF,$00,$68,$05,$78,$05,$79,$05
                    db $6C,$05,$6C,$05,$7A,$05,$7A,$05
                    db $C6,$1D,$E3,$1D,$D6,$1D,$DB,$1D
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $6C,$05,$6C,$05,$7A,$05,$7A,$05
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $E0,$1D,$E1,$1D,$F0,$1D,$F1,$1D
                    db $E2,$1D,$E3,$1D,$F2,$1D,$F3,$1D
                    db $C4,$1D,$C5,$1D,$D4,$1D,$D5,$1D
                    db $C6,$1D,$C7,$1D,$D6,$1D,$D7,$1D
                    db $EC,$1D,$ED,$1D,$FC,$1D,$FD,$1D
                    db $EE,$05,$EF,$05,$FE,$05,$FF,$05
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $CF,$05,$E1,$05,$DF,$05,$F1,$05
                    db $CF,$05,$C5,$05,$DF,$05,$D5,$05

DATA_13B201:        db $88,$1D,$89,$1D,$98,$1D,$99,$1D
                    db $8A,$1D,$8B,$1D,$9A,$1D,$9B,$1D
                    db $48,$1D,$49,$1D,$58,$1D,$59,$1D
                    db $4A,$1D,$4B,$1D,$5A,$1D,$5B,$1D
                    db $84,$1D,$85,$1D,$84,$1D,$95,$1D
                    db $68,$1D,$69,$1D,$78,$1D,$79,$1D
                    db $6A,$1D,$6B,$1D,$7A,$1D,$7B,$1D
                    db $87,$1D,$8B,$1D,$97,$1D,$9B,$1D
                    db $88,$1D,$8C,$1D,$98,$1D,$9C,$1D
                    db $49,$1D,$4A,$1D,$59,$1D,$5A,$1D
                    db $4B,$1D,$84,$1D,$5B,$1D,$84,$1D
                    db $A8,$1D,$A9,$1D,$B8,$1D,$B9,$1D
                    db $AA,$1D,$AB,$1D,$BA,$1D,$BB,$1D
                    db $4C,$1D,$4D,$1D,$5C,$1D,$5D,$1D
                    db $4E,$1D,$4F,$1D,$5E,$1D,$5F,$1D
                    db $84,$1D,$86,$1D,$84,$1D,$96,$1D
                    db $6C,$1D,$6D,$1D,$7C,$1D,$7D,$1D
                    db $6E,$1D,$6F,$1D,$7E,$1D,$7F,$1D
                    db $A4,$1D,$AB,$1D,$B4,$1D,$BB,$1D
                    db $A8,$1D,$8D,$1D,$B8,$1D,$9D,$1D
                    db $4D,$1D,$4E,$1D,$5D,$1D,$5E,$1D
                    db $4F,$1D,$84,$1D,$5F,$1D,$84,$1D
                    db $80,$1D,$81,$1D,$90,$1D,$91,$1D
                    db $82,$1D,$83,$1D,$92,$1D,$93,$1D
                    db $84,$1D,$A5,$1D,$84,$1D,$B5,$1D
                    db $A0,$1D,$A1,$1D,$B0,$1D,$B1,$1D
                    db $A2,$1D,$A3,$1D,$B2,$1D,$B3,$1D
                    db $A6,$1D,$8B,$1D,$B6,$1D,$9B,$1D
                    db $88,$1D,$80,$1D,$98,$1D,$90,$1D
                    db $81,$1D,$82,$1D,$91,$1D,$92,$1D
                    db $83,$1D,$84,$1D,$93,$1D,$84,$1D
                    db $40,$1D,$41,$1D,$50,$1D,$51,$1D
                    db $42,$1D,$43,$1D,$52,$1D,$53,$1D
                    db $40,$1D,$41,$1D,$46,$1D,$47,$1D
                    db $44,$1D,$45,$1D,$54,$1D,$55,$1D
                    db $60,$1D,$61,$1D,$70,$1D,$71,$1D
                    db $62,$1D,$63,$1D,$72,$1D,$73,$1D
                    db $60,$1D,$61,$1D,$66,$1D,$67,$1D
                    db $64,$1D,$65,$1D,$74,$1D,$75,$1D
                    db $56,$1D,$57,$1D,$70,$1D,$71,$1D
                    db $76,$1D,$77,$1D,$50,$1D,$51,$1D
                    db $8E,$1D,$8F,$1D,$9E,$1D,$9F,$1D

DATA_13B351:        db $40,$05,$41,$05,$50,$05,$51,$05
                    db $42,$05,$43,$05,$52,$05,$53,$05
                    db $60,$05,$61,$05,$70,$05,$71,$05
                    db $62,$05,$63,$05,$72,$05,$73,$05
                    db $44,$05,$45,$05,$54,$05,$55,$05
                    db $46,$05,$47,$05,$56,$05,$57,$05
                    db $64,$05,$65,$05,$74,$05,$75,$05
                    db $66,$05,$67,$05,$76,$05,$77,$05
                    db $6C,$05,$6D,$05,$7C,$05,$7D,$05
                    db $6E,$05,$6F,$05,$7E,$05,$7F,$05
                    db $68,$05,$69,$05,$78,$05,$79,$05
                    db $6A,$05,$6B,$05,$7A,$05,$7B,$05
                    db $48,$05,$49,$05,$58,$05,$59,$05
                    db $4A,$05,$4B,$05,$5A,$05,$5B,$05
                    db $4C,$05,$4D,$05,$5C,$05,$5D,$05
                    db $4E,$05,$4F,$05,$5E,$05,$5F,$05

DATA_13B3D1:        db $80,$1D,$81,$1D,$90,$1D,$91,$1D
                    db $82,$1D,$83,$1D,$92,$1D,$93,$1D
                    db $84,$1D,$85,$1D,$94,$1D,$95,$1D
                    db $86,$1D,$87,$1D,$96,$1D,$97,$1D
                    db $A0,$1D,$A1,$1D,$B0,$1D,$B1,$1D
                    db $A2,$1D,$A3,$1D,$B2,$1D,$B3,$1D
                    db $A4,$1D,$A5,$1D,$B4,$1D,$B5,$1D
                    db $A6,$1D,$A7,$1D,$B6,$1D,$B7,$1D
                    db $BF,$00,$BF,$00,$BF,$00,$41,$1D
                    db $BF,$00,$73,$1D,$42,$1D,$43,$1D
                    db $88,$1D,$89,$1D,$44,$1D,$44,$1D
                    db $8A,$1D,$8B,$1D,$44,$1D,$44,$1D
                    db $8C,$1D,$8D,$1D,$59,$1D,$5A,$1D
                    db $8E,$1D,$8F,$1D,$59,$1D,$5A,$1D
                    db $73,$5D,$BF,$00,$45,$1D,$46,$1D
                    db $BF,$00,$BF,$00,$47,$1D,$BF,$00
                    db $50,$1D,$51,$1D,$60,$1D,$61,$1D
                    db $52,$1D,$53,$1D,$62,$1D,$64,$1D
                    db $53,$1D,$54,$1D,$63,$1D,$64,$1D
                    db $55,$1D,$56,$1D,$65,$1D,$66,$1D
                    db $57,$1D,$58,$1D,$67,$1D,$68,$1D
                    db $BF,$00,$6A,$1D,$42,$1D,$43,$1D
                    db $6A,$5D,$BF,$00,$45,$1D,$46,$1D
                    db $70,$1D,$71,$1D,$49,$1D,$4A,$1D
                    db $72,$1D,$71,$1D,$4B,$1D,$4A,$1D
                    db $75,$1D,$76,$1D,$4C,$1D,$4D,$1D
                    db $77,$1D,$78,$1D,$4E,$1D,$4F,$1D
                    db $49,$1D,$71,$1D,$49,$1D,$4A,$1D
                    db $4C,$1D,$4D,$1D,$4C,$1D,$4D,$1D
                    db $4E,$1D,$4F,$1D,$4E,$1D,$4F,$1D
                    db $BF,$00,$69,$1D,$BF,$00,$5C,$1D
                    db $83,$1D,$84,$1D,$5D,$1D,$5E,$1D
                    db $69,$5D,$BF,$00,$5F,$1D,$BF,$00
                    db $BF,$00,$6C,$1D,$BF,$00,$7C,$1D
                    db $6D,$1D,$6E,$1D,$7D,$1D,$7E,$1D
                    db $6F,$1D,$BF,$00,$7F,$1D,$BF,$00
                    db $6B,$1D,$6B,$5D,$44,$1D,$44,$1D
                    db $BF,$00,$79,$1D,$42,$1D,$43,$1D
                    db $8B,$1D,$8C,$1D,$44,$1D,$59,$1D
                    db $7A,$1D,$BF,$00,$5A,$1D,$46,$1D
                    db $98,$0D,$99,$0D,$A8,$0D,$A9,$0D
                    db $9A,$0D,$9B,$0D,$AA,$0D,$AB,$0D
                    db $B2,$0C,$B3,$0C,$BF,$00,$BF,$00
                    db $B4,$0C,$B6,$0C,$B5,$0C,$B7,$0C
                    db $B8,$0C,$BF,$00,$B9,$0C,$BF,$00
                    db $BF,$00,$C1,$1D,$D0,$1D,$D1,$1D
                    db $C2,$1D,$C3,$1D,$E5,$1D,$D3,$1D
                    db $C4,$1D,$C5,$1D,$D4,$1D,$D5,$1D
                    db $C6,$1D,$BF,$00,$D6,$1D,$D7,$1D
                    db $E0,$1D,$D3,$1D,$F0,$1D,$D5,$1D
                    db $D4,$1D,$D5,$1D,$E4,$1D,$E5,$1D
                    db $E4,$1D,$E5,$1D,$D3,$1D,$D4,$1D
                    db $E6,$1D,$E7,$1D,$D5,$1D,$F7,$1D
                    db $BF,$00,$C1,$05,$D0,$05,$D1,$05
                    db $C2,$05,$C3,$05,$E5,$05,$D3,$05
                    db $C8,$05,$C9,$05,$D4,$05,$D5,$05
                    db $CA,$05,$D4,$1D,$DA,$05,$DB,$05
                    db $D5,$1D,$E4,$1D,$E5,$1D,$D3,$1D
                    db $E5,$1D,$E3,$1D,$D4,$1D,$F3,$1D
                    db $E1,$1D,$E5,$1D,$F1,$1D,$D4,$1D
                    db $D3,$1D,$D4,$1D,$D5,$1D,$E4,$1D
                    db $D5,$1D,$F8,$05,$FB,$05,$FC,$05
                    db $F9,$05,$FA,$05,$E5,$05,$D3,$05
                    db $C4,$05,$C5,$05,$D4,$05,$D5,$05
                    db $C6,$05,$BF,$00,$D6,$05,$D7,$05
                    db $E0,$05,$D3,$05,$F0,$05,$D5,$05
                    db $D4,$05,$D5,$05,$E4,$05,$E5,$05
                    db $E4,$05,$E5,$05,$D3,$05,$D4,$05
                    db $E6,$05,$EB,$05,$D5,$05,$CB,$05
                    db $EC,$05,$D5,$1D,$D8,$1D,$E5,$1D
                    db $E4,$1D,$F4,$1D,$D3,$1D,$F5,$1D
                    db $D2,$1D,$E4,$1D,$E2,$1D,$D3,$1D
                    db $E5,$1D,$D3,$1D,$D4,$1D,$D5,$1D
                    db $EA,$05,$D3,$05,$C7,$05,$D5,$05
                    db $E6,$05,$E7,$05,$D5,$05,$F7,$05
                    db $E1,$05,$E5,$05,$F1,$05,$D4,$05
                    db $D3,$05,$D4,$05,$D5,$05,$E4,$05
                    db $D5,$05,$E4,$05,$E5,$05,$D3,$05
                    db $E5,$05,$E3,$05,$D4,$05,$F3,$05
                    db $E8,$1D,$D4,$1D,$D9,$1D,$E4,$1D
                    db $D5,$1D,$F6,$1D,$E5,$1D,$E3,$1D
                    db $F2,$1D,$D5,$1D,$E1,$1D,$E5,$1D
                    db $D2,$05,$E4,$05,$E2,$05,$D3,$05
                    db $E5,$05,$D3,$05,$D4,$05,$D5,$05
                    db $E4,$05,$F4,$05,$D3,$05,$F5,$05
                    db $E9,$1D,$D3,$1D,$CC,$1D,$D5,$1D
                    db $D4,$1D,$F3,$1D,$E4,$1D,$F4,$1D
                    db $F1,$1D,$D4,$1D,$D2,$1D,$E4,$1D
                    db $C0,$1D,$C5,$1D,$CC,$1D,$D5,$1D
                    db $F2,$05,$D5,$05,$E1,$05,$E5,$05
                    db $D5,$05,$F6,$05,$E5,$05,$E3,$05
                    db $DC,$1D,$E5,$1D,$E8,$1D,$D4,$1D
                    db $D3,$1D,$F5,$1D,$D5,$1D,$F6,$1D
                    db $E2,$1D,$D3,$1D,$F2,$1D,$D5,$1D
                    db $BF,$00,$C1,$11,$D0,$11,$D1,$11
                    db $C2,$11,$C3,$11,$E5,$11,$D3,$11
                    db $C4,$11,$C5,$11,$D4,$11,$D5,$11
                    db $C6,$11,$BF,$00,$D6,$11,$D7,$11
                    db $F1,$05,$D4,$05,$D2,$05,$E4,$05
                    db $D4,$05,$F3,$05,$E4,$05,$F4,$05
                    db $D9,$1D,$E4,$1D,$E9,$1D,$D3,$1D
                    db $E0,$11,$D3,$11,$F0,$11,$D5,$11
                    db $D4,$11,$D5,$11,$E4,$11,$E5,$11
                    db $E4,$11,$E5,$11,$D3,$11,$D4,$11
                    db $E6,$11,$E7,$11,$D5,$11,$F7,$11
                    db $E2,$05,$D3,$05,$F2,$05,$D5,$05
                    db $D3,$05,$F5,$05,$D5,$05,$F6,$05
                    db $CC,$1D,$D5,$1D,$DC,$1D,$E5,$1D
                    db $E1,$11,$E5,$11,$F1,$11,$D4,$11
                    db $D3,$11,$D4,$11,$D5,$11,$E4,$11
                    db $D5,$11,$E4,$11,$E5,$11,$D3,$11
                    db $E5,$11,$E3,$11,$D4,$11,$F3,$11
                    db $D2,$11,$E4,$11,$E2,$11,$D3,$11
                    db $E5,$11,$D3,$11,$D4,$11,$D5,$11
                    db $E4,$11,$F4,$11,$D3,$11,$F5,$11
                    db $F2,$11,$D5,$11,$E1,$11,$E5,$11
                    db $D5,$11,$F6,$11,$E5,$11,$E3,$11
                    db $F1,$11,$D4,$11,$D2,$11,$E4,$11
                    db $D4,$11,$F3,$11,$E4,$11,$F4,$11
                    db $D3,$1D,$D4,$1D,$D5,$1D,$F8,$05
                    db $D5,$1D,$F6,$1D,$F9,$05,$FA,$05
                    db $BF,$00,$BF,$00,$C4,$05,$C5,$05
                    db $BF,$00,$BF,$00,$C6,$05,$BF,$00
                    db $FB,$05,$FC,$05,$EA,$05,$D3,$05
                    db $D6,$05,$D7,$05,$E6,$05,$E7,$05
                    db $C7,$05,$D5,$05,$E1,$05,$E5,$05
                    db $D5,$05,$F7,$05,$E5,$05,$E3,$05

DATA_13B7C9:        db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$8F,$09,$9E,$09,$9F,$09
                    db $BF,$00,$BF,$00,$D0,$1D,$D1,$1D
                    db $C0,$1D,$C1,$1D,$D2,$1D,$D3,$1D
                    db $C2,$1D,$C3,$1D,$F3,$1D,$E0,$1D
                    db $BF,$00,$BF,$00,$E1,$1D,$E2,$1D
                    db $BF,$00,$BF,$00,$E4,$1D,$E5,$1D
                    db $C6,$1D,$C7,$1D,$E6,$1D,$F9,$1D
                    db $C8,$1D,$C9,$1D,$D9,$1D,$D5,$1D
                    db $BF,$00,$BF,$00,$D7,$1D,$D8,$1D
                    db $BF,$00,$BF,$00,$C0,$1D,$C1,$1D
                    db $BF,$00,$BF,$00,$C2,$1D,$C3,$1D
                    db $D0,$1D,$D1,$1D,$D2,$1D,$F3,$1D
                    db $D2,$1D,$F3,$1D,$F3,$1D,$E3,$1D
                    db $F3,$1D,$F3,$1D,$F3,$1D,$F3,$1D
                    db $E3,$1D,$F3,$1D,$F3,$1D,$F3,$1D
                    db $F0,$1D,$F1,$1D,$F3,$1D,$F0,$1D
                    db $E7,$1D,$E8,$1D,$F2,$1D,$F1,$1D
                    db $E9,$1D,$D9,$1D,$E7,$1D,$E8,$1D
                    db $D9,$1D,$F9,$1D,$E9,$1D,$D9,$1D
                    db $D5,$1D,$D6,$1D,$D9,$1D,$D5,$1D
                    db $D7,$1D,$D8,$1D,$F4,$1D,$F5,$1D
                    db $D2,$1D,$D3,$1D,$F3,$1D,$F3,$1D
                    db $F3,$1D,$E0,$1D,$F3,$1D,$F3,$1D
                    db $E1,$1D,$E2,$1D,$F0,$1D,$F1,$1D
                    db $E1,$1D,$E2,$1D,$F2,$1D,$F1,$1D
                    db $D0,$1D,$D1,$1D,$F6,$1D,$F7,$1D
                    db $D2,$1D,$F3,$1D,$F8,$1D,$F3,$1D
                    db $F3,$1D,$D3,$1D,$F3,$1D,$F3,$1D
                    db $F3,$1D,$F3,$1D,$F3,$1D,$E3,$1D
                    db $F3,$1D,$F3,$1D,$D3,$1D,$F3,$1D
                    db $F0,$1D,$F2,$1D,$F3,$1D,$F0,$1D
                    db $F2,$1D,$F1,$1D,$F2,$1D,$F2,$1D
                    db $D4,$1D,$C5,$1D,$F6,$1D,$F7,$1D
                    db $D2,$1D,$F3,$1D,$F8,$1D,$E3,$1D
                    db $E4,$1D,$E5,$1D,$E6,$1D,$D9,$1D
                    db $E6,$1D,$D9,$1D,$F9,$1D,$D9,$1D
                    db $D9,$1D,$D9,$1D,$D9,$1D,$D9,$1D
                    db $D9,$1D,$F9,$1D,$D9,$1D,$D9,$1D
                    db $D2,$1D,$F3,$1D,$F3,$1D,$D3,$1D
                    db $F3,$1D,$E3,$1D,$F3,$1D,$F3,$1D
                    db $F3,$1D,$F0,$1D,$F3,$1D,$F3,$1D
                    db $BF,$00,$BF,$00,$BF,$00,$8E,$05
                    db $BF,$00,$BF,$00,$8E,$05,$BF,$00
                    db $61,$05,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$72,$05,$BF,$00
                    db $BF,$00,$BF,$00,$72,$45,$BF,$00
                    db $8E,$05,$BF,$00,$BF,$00,$8E,$05
                    db $BF,$00,$61,$05,$BF,$00,$BF,$00
                    db $72,$05,$BF,$00,$BF,$00,$BF,$00
                    db $8E,$05,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$8E,$05,$BF,$00,$BF,$00
                    db $BF,$00,$72,$05,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$61,$05
                    db $BF,$00,$8E,$05,$61,$05,$BF,$00
                    db $F2,$1D,$F1,$1D,$F0,$1D,$F2,$1D
                    db $F2,$1D,$F2,$1D,$F0,$1D,$F2,$1D
                    db $F6,$1D,$F7,$1D,$F2,$1D,$F1,$1D
                    db $F8,$1D,$F3,$1D,$F6,$1D,$F7,$1D
                    db $F3,$1D,$F3,$1D,$F8,$1D,$F3,$1D
                    db $F2,$1D,$F2,$1D,$F2,$1D,$F2,$1D
                    db $D9,$1D,$D9,$1D,$E9,$1D,$D9,$1D
                    db $F9,$1D,$D9,$1D,$D9,$1D,$D9,$1D
                    db $D9,$1D,$D9,$1D,$C4,$1D,$C5,$1D
                    db $C4,$1D,$C5,$1D,$D2,$1D,$F3,$1D
                    db $D2,$1D,$F3,$1D,$F3,$1D,$F3,$1D
                    db $D3,$1D,$F3,$1D,$F3,$1D,$F3,$1D

DATA_13B9E1:        db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $00,$1D,$01,$1D,$10,$1D,$C2,$1D
                    db $C7,$1D,$C8,$1D,$C2,$1D,$C2,$1D
                    db $C9,$1D,$CA,$1D,$C2,$1D,$CB,$1D
                    db $20,$1D,$C2,$1D,$30,$1D,$31,$1D
                    db $C2,$1D,$C2,$1D,$32,$1D,$33,$1D
                    db $C2,$1D,$CC,$1D,$CE,$1D,$CD,$1D
                    db $C3,$1D,$C2,$1D,$C2,$1D,$C2,$1D
                    db $C2,$1D,$C0,$1D,$C2,$1D,$C2,$1D
                    db $C2,$1D,$C2,$1D,$C4,$1D,$C2,$1D
                    db $C2,$1D,$C2,$1D,$C2,$1D,$C1,$1D
                    db $CF,$1D,$D0,$1D,$D1,$1D,$C2,$1D
                    db $08,$1D,$09,$1D,$C2,$1D,$C2,$1D
                    db $0A,$1D,$C5,$1D,$C2,$1D,$C6,$1D
                    db $26,$1D,$C2,$1D,$36,$1D,$37,$1D
                    db $C2,$1D,$C2,$1D,$38,$1D,$39,$1D
                    db $C2,$1D,$2B,$1D,$3A,$1D,$3B,$1D
                    db $14,$1D,$C2,$1D,$24,$1D,$C2,$1D
                    db $C2,$1D,$17,$1D,$C2,$1D,$27,$1D
                    db $18,$1D,$C2,$1D,$28,$1D,$C2,$1D
                    db $C2,$1D,$19,$1D,$C2,$1D,$29,$1D
                    db $C2,$1D,$C2,$1D,$C2,$1D,$C2,$1D
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$41,$1D
                    db $BF,$00,$41,$1D,$42,$1D,$43,$1D
                    db $42,$1D,$42,$5D,$44,$1D,$44,$5D
                    db $41,$5D,$BF,$00,$43,$5D,$42,$5D
                    db $BF,$00,$BF,$00,$41,$5D,$BF,$00
                    db $42,$1D,$43,$1D,$44,$1D,$45,$1D
                    db $44,$1D,$45,$1D,$40,$1D,$40,$1D
                    db $46,$1D,$47,$1D,$56,$1D,$57,$1D
                    db $45,$5D,$44,$5D,$40,$1D,$40,$5D
                    db $43,$5D,$42,$5D,$45,$5D,$44,$5D
                    db $BF,$00,$41,$1D,$50,$1D,$51,$1D
                    db $42,$1D,$43,$1D,$52,$1D,$53,$1D
                    db $44,$1D,$45,$1D,$54,$1D,$54,$1D
                    db $5E,$1D,$5E,$1D,$54,$1D,$54,$1D
                    db $5E,$1D,$5E,$1D,$54,$5D,$54,$5D
                    db $45,$5D,$44,$5D,$54,$5D,$54,$5D
                    db $43,$5D,$42,$5D,$53,$5D,$52,$5D
                    db $41,$5D,$BF,$00,$51,$5D,$50,$5D
                    db $48,$1D,$49,$1D,$BF,$00,$4C,$1D
                    db $4A,$1D,$4B,$1D,$4D,$1D,$BF,$00
                    db $BF,$00,$48,$1D,$BF,$00,$BF,$00
                    db $49,$1D,$4A,$1D,$4C,$1D,$4D,$1D
                    db $4B,$1D,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$66,$5D,$BF,$00,$BF,$00
                    db $64,$1D,$65,$1D,$73,$1D,$74,$1D
                    db $B7,$1D,$C2,$1D,$C2,$1D,$C2,$1D
                    db $BF,$00,$5C,$1D,$BF,$00,$5C,$1D
                    db $5D,$1D,$65,$1D,$5D,$1D,$74,$1D
                    db $66,$1D,$BF,$00,$BF,$00,$BF,$00
                    db $5C,$1D,$5D,$1D,$5C,$1D,$5D,$1D
                    db $65,$1D,$66,$1D,$74,$1D,$BF,$00
                    db $73,$1D,$74,$1D,$73,$1D,$74,$1D
                    db $5D,$1D,$74,$1D,$5D,$1D,$74,$1D
                    db $74,$1D,$BF,$00,$74,$1D,$BF,$00
                    db $C7,$1D,$5C,$1D,$C2,$1D,$5C,$1D
                    db $A8,$05,$A9,$05,$B8,$05,$B9,$05
                    db $C9,$1D,$80,$1D,$C2,$1D,$90,$1D
                    db $74,$1D,$BF,$00,$74,$1D,$BF,$00
                    db $C2,$1D,$5C,$1D,$C2,$1D,$5C,$1D
                    db $A0,$05,$A1,$05,$B0,$05,$B1,$05
                    db $5B,$05,$5A,$05,$4E,$05,$4F,$05
                    db $A2,$05,$A3,$05,$B2,$05,$B3,$05
                    db $A4,$05,$A5,$05,$B4,$05,$B5,$05
                    db $81,$1D,$74,$1D,$C2,$1D,$92,$1D
                    db $91,$1D,$94,$1D,$C2,$1D,$C2,$1D
                    db $99,$1D,$CA,$1D,$C2,$1D,$CB,$1D
                    db $BF,$00,$5C,$1D,$BF,$00,$58,$1D
                    db $5D,$1D,$74,$1D,$59,$1D,$74,$1D
                    db $7D,$05,$7E,$05,$6F,$05,$7F,$05
                    db $4F,$05,$4E,$05,$4E,$05,$4F,$05
                    db $83,$05,$84,$05,$93,$05,$C2,$1D
                    db $85,$05,$86,$05,$C2,$1D,$C2,$1D
                    db $87,$05,$88,$05,$C2,$1D,$98,$05
                    db $A6,$05,$4E,$05,$B6,$05,$4F,$05
                    db $8B,$05,$8C,$05,$C2,$1D,$C2,$1D
                    db $89,$05,$8A,$05,$C2,$1D,$9A,$05
                    db $95,$05,$96,$05,$97,$05,$C2,$1D
                    db $AE,$05,$AF,$05,$BE,$05,$BF,$05
                    db $9B,$05,$9C,$05,$C2,$1D,$C2,$1D
                    db $02,$1D,$03,$1D,$C2,$1D,$75,$1D
                    db $04,$1D,$AC,$1D,$76,$1D,$43,$1D
                    db $C2,$1D,$C0,$1D,$C2,$1D,$75,$1D
                    db $C3,$1D,$75,$1D,$76,$1D,$43,$1D
                    db $76,$1D,$43,$1D,$44,$1D,$45,$1D
                    db $C2,$1D,$75,$1D,$55,$1D,$51,$1D
                    db $76,$1D,$43,$1D,$52,$1D,$53,$1D
                    db $82,$1D,$49,$1D,$C2,$1D,$4C,$1D
                    db $4A,$1D,$68,$1D,$4D,$1D,$70,$1D
                    db $5F,$1D,$5F,$1D,$40,$1D,$40,$1D
                    db $67,$1D,$49,$1D,$40,$1D,$4C,$1D
                    db $5D,$1D,$70,$1D,$5D,$1D,$70,$1D
                    db $40,$1D,$40,$1D,$40,$1D,$40,$1D
                    db $40,$1D,$AA,$1D,$40,$1D,$BA,$1D
                    db $AB,$1D,$AB,$5D,$BB,$1D,$BC,$1D
                    db $AD,$1D,$40,$1D,$BD,$1D,$40,$1D
                    db $40,$1D,$5C,$1D,$40,$1D,$5C,$1D
                    db $5D,$1D,$BF,$00,$5D,$1D,$BF,$00
                    db $5B,$05,$5C,$1D,$4E,$05,$5C,$1D
                    db $40,$1D,$61,$1D,$40,$1D,$61,$1D
                    db $62,$1D,$79,$1D,$72,$1D,$7B,$1D
                    db $7A,$1D,$40,$1D,$7C,$1D,$40,$1D
                    db $4F,$05,$5C,$1D,$4E,$05,$58,$1D
                    db $8D,$1D,$8E,$1D,$9D,$1D,$C2,$1D
                    db $77,$1D,$78,$1D,$C2,$1D,$C2,$1D
                    db $9E,$1D,$8F,$1D,$C2,$1D,$9F,$1D
                    db $6A,$1D,$6A,$1D,$6A,$1D,$6A,$1D
                    db $6B,$1D,$6E,$1D,$6A,$1D,$6D,$1D
                    db $40,$1D,$40,$1D,$6E,$1D,$40,$1D
                    db $40,$1D,$5C,$1D,$40,$1D,$58,$1D
                    db $5D,$1D,$BF,$00,$59,$1D,$BF,$00

DATA_13BDB1:        db $6E,$05,$6F,$05,$46,$05,$46,$05
                    db $7E,$05,$7F,$05,$8E,$05,$8F,$05
                    db $6E,$05,$6F,$05,$47,$05,$46,$05
                    db $46,$05,$46,$05,$56,$05,$89,$05
                    db $46,$05,$46,$05,$56,$05,$56,$05
                    db $44,$05,$45,$05,$54,$05,$55,$05
                    db $47,$05,$46,$05,$47,$05,$46,$05
                    db $46,$05,$46,$05,$46,$05,$46,$05
                    db $47,$05,$46,$05,$57,$05,$89,$05
                    db $66,$05,$67,$05,$76,$05,$76,$05
                    db $47,$05,$46,$05,$57,$05,$56,$05
                    db $87,$05,$88,$05,$97,$05,$98,$05
                    db $88,$45,$87,$45,$98,$45,$97,$45
                    db $66,$05,$66,$05,$77,$05,$76,$05
                    db $66,$05,$66,$05,$76,$05,$76,$05
                    db $76,$05,$76,$05,$76,$05,$76,$05
                    db $76,$05,$76,$05,$BB,$05,$BC,$05
                    db $60,$05,$61,$05,$70,$05,$71,$05
                    db $62,$05,$63,$05,$72,$05,$73,$05
                    db $63,$45,$62,$45,$73,$45,$72,$45
                    db $61,$45,$60,$45,$71,$45,$70,$45
                    db $77,$05,$76,$05,$77,$05,$76,$05
                    db $8B,$05,$8C,$05,$9B,$05,$9C,$05
                    db $8D,$05,$76,$05,$76,$05,$76,$05
                    db $80,$05,$81,$05,$90,$05,$91,$05
                    db $82,$05,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$82,$45,$BF,$00,$BF,$00
                    db $81,$45,$80,$45,$91,$45,$90,$45
                    db $64,$05,$65,$05,$74,$05,$75,$05
                    db $99,$05,$9A,$05,$A9,$05,$AA,$05
                    db $A0,$05,$A1,$05,$B0,$05,$B1,$05
                    db $A1,$45,$A0,$45,$B1,$45,$B0,$45
                    db $86,$05,$65,$05,$96,$05,$75,$05
                    db $74,$05,$75,$05,$6C,$05,$6D,$05
                    db $B9,$05,$BA,$05,$7C,$05,$7D,$05
                    db $A2,$05,$A3,$05,$B2,$05,$B3,$05
                    db $A3,$45,$A2,$45,$B3,$45,$B2,$05
                    db $A6,$05,$75,$05,$86,$05,$6D,$05
                    db $4C,$1D,$4D,$1D,$5C,$1D,$5D,$1D
                    db $4E,$1D,$4F,$1D,$5E,$1D,$5F,$1D
                    db $43,$1D,$53,$1D,$53,$1D,$51,$1D
                    db $48,$1D,$49,$1D,$78,$1D,$79,$1D
                    db $4A,$1D,$4B,$1D,$7A,$1D,$7B,$1D
                    db $43,$1D,$53,$1D,$52,$1D,$51,$1D
                    db $43,$1D,$53,$1D,$50,$1D,$51,$1D
                    db $43,$1D,$53,$1D,$50,$1D,$43,$1D
                    db $43,$1D,$53,$1D,$50,$1D,$40,$1D
                    db $43,$1D,$53,$1D,$41,$1D,$51,$1D
                    db $40,$1D,$41,$1D,$50,$1D,$51,$1D
                    db $68,$1D,$69,$1D,$58,$1D,$59,$1D
                    db $6A,$1D,$6B,$1D,$5A,$1D,$5B,$1D
                    db $42,$1D,$41,$1D,$52,$1D,$51,$1D
                    db $40,$1D,$41,$1D,$41,$1D,$40,$1D
                    db $40,$1D,$41,$1D,$53,$1D,$43,$1D
                    db $40,$1D,$41,$1D,$53,$1D,$51,$1D
                    db $40,$1D,$41,$1D,$50,$1D,$50,$1D
                    db $40,$1D,$41,$1D,$50,$1D,$43,$1D
                    db $40,$1D,$41,$1D,$50,$1D,$40,$1D
                    db $40,$1D,$41,$1D,$41,$1D,$43,$1D
                    db $40,$1D,$41,$1D,$41,$1D,$51,$1D
                    db $51,$1D,$50,$1D,$53,$1D,$51,$1D
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $68,$1D,$69,$1D,$78,$1D,$79,$1D
                    db $6A,$1D,$6B,$1D,$7A,$1D,$7B,$1D
                    db $40,$1D,$41,$1D,$50,$1D,$E4,$1D
                    db $40,$1D,$41,$1D,$E5,$1D,$D4,$1D
                    db $43,$1D,$53,$1D,$D5,$1D,$51,$1D
                    db $C4,$1D,$F4,$1D,$D0,$1D,$EA,$1D
                    db $C7,$1D,$C7,$5D,$FA,$1D,$FB,$1D
                    db $F4,$5D,$C5,$1D,$EA,$5D,$F0,$1D
                    db $40,$1D,$41,$1D,$C8,$1D,$C9,$1D
                    db $42,$1D,$41,$1D,$52,$1D,$E7,$1D
                    db $43,$1D,$53,$1D,$E6,$1D,$E7,$1D
                    db $40,$1D,$41,$1D,$C8,$1D,$F8,$1D
                    db $C0,$1D,$EA,$1D,$D0,$1D,$EA,$1D
                    db $C7,$1D,$C7,$5D,$C7,$1D,$C7,$5D
                    db $EA,$5D,$E0,$1D,$EA,$5D,$F0,$1D
                    db $D8,$1D,$D9,$1D,$E8,$1D,$E9,$1D
                    db $68,$1D,$69,$1D,$78,$1D,$79,$1D
                    db $6A,$1D,$6B,$1D,$7A,$1D,$7B,$1D
                    db $F6,$1D,$F7,$1D,$52,$1D,$51,$1D
                    db $F6,$1D,$F7,$1D,$41,$1D,$51,$1D
                    db $D8,$1D,$F9,$1D,$E8,$1D,$E9,$1D
                    db $40,$1D,$C1,$1D,$41,$1D,$D1,$1D
                    db $C2,$1D,$C3,$1D,$D2,$1D,$D3,$1D
                    db $C7,$1D,$C7,$5D,$D3,$1D,$D3,$5D
                    db $C3,$5D,$F5,$1D,$D3,$5D,$D2,$5D
                    db $C1,$5D,$41,$1D,$D1,$5D,$51,$1D
                    db $C6,$1D,$C6,$1D,$D6,$1D,$D7,$1D
                    db $CA,$1D,$79,$1D,$DA,$1D,$79,$1D
                    db $7A,$1D,$7B,$1D,$7A,$1D,$7B,$1D
                    db $CB,$1D,$C6,$1D,$DB,$1D,$D6,$1D
                    db $C6,$1D,$C6,$1D,$D7,$1D,$D6,$1D
                    db $C6,$1D,$E1,$1D,$D7,$1D,$F1,$1D
                    db $E2,$1D,$E3,$1D,$F2,$1D,$F3,$1D
                    db $E3,$1D,$E3,$5D,$F3,$1D,$F3,$5D
                    db $E3,$5D,$E2,$5D,$F3,$5D,$F2,$5D
                    db $E1,$5D,$C6,$1D,$F1,$5D,$D7,$1D
                    db $43,$1D,$53,$1D,$50,$1D,$9E,$1D
                    db $AE,$1D,$AF,$1D,$9F,$1D,$43,$1D
                    db $42,$1D,$41,$1D,$52,$1D,$43,$1D
                    db $40,$1D,$41,$1D,$43,$1D,$9E,$1D
                    db $9E,$1D,$9F,$1D,$9F,$1D,$43,$1D
                    db $51,$1D,$50,$1D,$50,$1D,$43,$1D
                    db $40,$1D,$41,$1D,$53,$1D,$9E,$1D
                    db $51,$1D,$50,$1D,$50,$1D,$40,$1D
                    db $40,$1D,$41,$1D,$50,$1D,$9E,$1D
                    db $43,$1D,$53,$1D,$53,$1D,$43,$1D
                    db $40,$1D,$50,$1D,$53,$1D,$51,$1D
                    db $51,$1D,$41,$1D,$50,$1D,$51,$1D
                    db $51,$1D,$41,$1D,$53,$1D,$43,$1D
                    db $68,$1D,$79,$1D,$78,$1D,$79,$1D
                    db $42,$1D,$41,$1D,$52,$1D,$9E,$1D
                    db $51,$1D,$50,$1D,$50,$1D,$51,$1D

DATA_13C151:        db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$8F,$09,$9E,$09,$9F,$09
                    db $40,$1D,$41,$1D,$50,$1D,$51,$1D
                    db $42,$1D,$43,$1D,$52,$1D,$53,$1D
                    db $44,$1D,$45,$1D,$54,$1D,$55,$1D
                    db $46,$1D,$47,$1D,$56,$1D,$57,$1D
                    db $4A,$1D,$4B,$1D,$5A,$1D,$5B,$1D
                    db $6C,$1D,$6D,$1D,$7C,$1D,$7D,$1D
                    db $6E,$1D,$6F,$1D,$7E,$1D,$7F,$1D
                    db $6C,$1D,$BF,$00,$7C,$1D,$BF,$00
                    db $4C,$1D,$4D,$1D,$5C,$1D,$5D,$1D
                    db $BF,$00,$6D,$1D,$60,$1D,$7D,$1D
                    db $6E,$1D,$6F,$1D,$7E,$1D,$62,$1D
                    db $4E,$1D,$4F,$1D,$74,$1D,$75,$1D
                    db $5E,$1D,$5F,$1D,$76,$1D,$77,$1D
                    db $58,$1D,$59,$1D,$76,$1D,$77,$1D
                    db $48,$1D,$49,$1D,$74,$1D,$75,$1D
                    db $66,$1D,$67,$1D,$76,$1D,$77,$1D
                    db $64,$1D,$65,$1D,$74,$1D,$75,$1D
                    db $8D,$1D,$9D,$1D,$74,$1D,$75,$1D
                    db $AD,$1D,$BD,$1D,$76,$1D,$77,$1D
                    db $8D,$1D,$4F,$1D,$74,$1D,$75,$1D
                    db $70,$1D,$9D,$1D,$74,$1D,$75,$1D
                    db $AD,$1D,$71,$1D,$76,$1D,$77,$1D
                    db $68,$1D,$69,$1D,$78,$1D,$79,$1D
                    db $6A,$1D,$6B,$1D,$7A,$1D,$7B,$1D
                    db $AE,$1D,$AF,$1D,$BE,$1D,$BF,$1D
                    db $BF,$1D,$BE,$1D,$BE,$1D,$BF,$1D
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$8E,$05
                    db $BF,$00,$BF,$00,$8E,$05,$BF,$00
                    db $61,$05,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$72,$05,$BF,$00
                    db $BF,$00,$BF,$00,$72,$45,$BF,$00
                    db $8E,$05,$BF,$00,$BF,$00,$8E,$05
                    db $BF,$00,$61,$05,$BF,$00,$BF,$00
                    db $72,$05,$BF,$00,$BF,$00,$BF,$00
                    db $8E,$05,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$8E,$05,$BF,$00,$BF,$00
                    db $BF,$00,$72,$05,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BF,$00,$61,$05
                    db $BF,$00,$8E,$05,$61,$05,$BF,$00

DATA_13C309:        db $8C,$1D,$8D,$1D,$9C,$1D,$9D,$1D
                    db $AC,$1D,$AD,$1D,$BC,$1D,$BD,$1D
                    db $AE,$1D,$AF,$1D,$BE,$1D,$BF,$1D
                    db $CC,$1D,$CD,$1D,$CC,$1D,$CD,$1D
                    db $CE,$1D,$CF,$1D,$CE,$1D,$CF,$1D
                    db $DC,$1D,$DD,$1D,$DC,$1D,$DD,$1D
                    db $DE,$1D,$DF,$1D,$DE,$1D,$DF,$1D
                    db $EC,$1D,$ED,$1D,$EC,$1D,$ED,$1D
                    db $ED,$5D,$EC,$5D,$ED,$5D,$EC,$5D
                    db $DF,$5D,$DE,$5D,$DF,$5D,$DE,$5D
                    db $DD,$5D,$DC,$5D,$DD,$5D,$DC,$5D
                    db $CF,$5D,$CE,$5D,$CF,$5D,$CE,$5D
                    db $CD,$5D,$CC,$5D,$CD,$5D,$CC,$5D
                    db $AF,$5D,$AE,$5D,$BF,$5D,$BE,$5D
                    db $AD,$5D,$AC,$5D,$BD,$5D,$BC,$5D
                    db $8D,$5D,$8C,$5D,$9D,$5D,$9C,$5D
                    db $8E,$1D,$8F,$1D,$9E,$1D,$9F,$1D
                    db $8F,$5D,$8E,$5D,$9F,$5D,$9E,$5D
                    db $90,$1D,$91,$1D,$A0,$1D,$A1,$1D
                    db $91,$5D,$90,$5D,$A1,$5D,$A0,$5D
                    db $92,$1D,$93,$1D,$A2,$1D,$A3,$1D
                    db $93,$5D,$92,$5D,$A3,$5D,$A2,$5D
                    db $B0,$1D,$B1,$1D,$B2,$1D,$B3,$1D
                    db $B1,$5D,$B0,$5D,$B3,$5D,$B2,$5D
                    db $DE,$1D,$FE,$1D,$FC,$1D,$FD,$1D
                    db $FE,$5D,$DE,$5D,$FD,$5D,$FC,$5D
                    db $EC,$1D,$FF,$1D,$EC,$1D,$ED,$1D
                    db $FF,$5D,$EC,$5D,$ED,$5D,$EC,$5D

DATA_13C3E9:        db $8E,$1D,$8F,$1D,$95,$9D,$96,$9D
                    db $88,$1D,$89,$1D,$83,$9D,$84,$9D
                    db $BB,$1D,$86,$1D,$85,$1D,$76,$9D
                    db $87,$1D,$85,$1D,$77,$9D,$BB,$1D
                    db $BB,$1D,$85,$1D,$85,$1D,$BB,$1D
                    db $95,$1D,$96,$1D,$8E,$1D,$8F,$1D
                    db $83,$1D,$84,$1D,$88,$1D,$89,$1D
                    db $BB,$1D,$76,$1D,$BF,$00,$86,$1D
                    db $77,$1D,$85,$1D,$87,$1D,$BF,$00
                    db $BB,$1D,$85,$1D,$BF,$00,$BB,$1D
                    db $BF,$00,$BF,$00,$85,$1D,$BB,$1D
                    db $BB,$1D,$85,$1D,$85,$1D,$BF,$00
                    db $77,$1D,$85,$1D,$87,$1D,$BB,$1D
                    db $8E,$1D,$8F,$1D,$8E,$1D,$8F,$1D
                    db $88,$1D,$89,$1D,$88,$1D,$89,$1D
                    db $BB,$1D,$86,$1D,$BF,$00,$86,$1D
                    db $87,$1D,$BF,$00,$87,$1D,$85,$1D
                    db $BF,$00,$BF,$00,$85,$1D,$BF,$00
                    db $BB,$1D,$85,$1D,$BF,$00,$BF,$00
                    db $87,$1D,$BF,$00,$87,$1D,$BB,$1D
                    db $BF,$00,$86,$1D,$BF,$00,$86,$1D
                    db $BF,$00,$BF,$00,$BF,$00,$51,$1D
                    db $42,$1D,$43,$1D,$52,$1D,$53,$1D
                    db $44,$1D,$45,$1D,$54,$1D,$55,$1D
                    db $46,$1D,$47,$1D,$56,$1D,$57,$1D
                    db $48,$1D,$49,$1D,$58,$1D,$59,$1D
                    db $BF,$00,$BF,$00,$5A,$1D,$BF,$00
                    db $87,$1D,$BF,$00,$87,$1D,$BF,$00
                    db $BF,$00,$86,$1D,$85,$1D,$86,$1D
                    db $60,$1D,$61,$1D,$70,$1D,$71,$1D
                    db $62,$1D,$63,$1D,$72,$1D,$73,$1D
                    db $64,$1D,$65,$1D,$74,$1D,$75,$1D
                    db $66,$1D,$67,$1D,$66,$1D,$67,$1D
                    db $68,$1D,$69,$1D,$78,$1D,$79,$1D
                    db $6A,$1D,$6B,$1D,$7A,$1D,$7B,$1D
                    db $80,$1D,$81,$1D,$90,$1D,$91,$1D
                    db $82,$1D,$74,$1D,$92,$1D,$93,$1D
                    db $74,$1D,$75,$1D,$94,$1D,$75,$1D
                    db $66,$1D,$67,$1D,$66,$1D,$97,$1D
                    db $78,$1D,$78,$1D,$98,$1D,$99,$1D
                    db $8A,$1D,$8B,$1D,$9A,$1D,$9B,$1D
                    db $87,$1D,$85,$1D,$87,$1D,$BF,$00
                    db $A0,$1D,$A1,$1D,$A0,$1D,$B1,$1D
                    db $A2,$1D,$A3,$1D,$B2,$1D,$B3,$1D
                    db $A4,$1D,$A5,$1D,$B4,$1D,$B5,$1D
                    db $A6,$1D,$A7,$1D,$B6,$1D,$B7,$1D
                    db $A8,$1D,$A9,$1D,$B8,$1D,$B9,$1D
                    db $AA,$1D,$AB,$1D,$BA,$1D,$AB,$1D
                    db $4C,$1D,$4D,$1D,$5C,$1D,$5D,$1D
                    db $4E,$1D,$4F,$1D,$5E,$1D,$5F,$1D
                    db $74,$1D,$8D,$1D,$9C,$1D,$9D,$1D
                    db $66,$1D,$67,$1D,$9E,$1D,$9F,$1D
                    db $78,$1D,$C1,$1D,$D0,$1D,$D1,$1D
                    db $C2,$1D,$C3,$1D,$D2,$1D,$D3,$1D
                    db $6C,$1D,$6D,$1D,$7C,$1D,$7D,$1D
                    db $6E,$1D,$6F,$1D,$7E,$1D,$7F,$1D
                    db $6F,$1D,$E1,$1D,$F0,$1D,$F1,$1D
                    db $E2,$1D,$E3,$1D,$F2,$1D,$F3,$1D
                    db $87,$1D,$BB,$1D,$87,$1D,$BF,$00
                    db $85,$1D,$41,$1D,$BF,$00,$BF,$00
                    db $40,$1D,$B0,$1D,$50,$1D,$8C,$1D
                    db $AC,$1D,$BD,$1D,$BC,$1D,$BC,$1D
                    db $AE,$1D,$AF,$1D,$BE,$1D,$BF,$1D
                    db $C0,$1D,$4B,$1D,$E0,$1D,$5B,$1D
                    db $4A,$1D,$BF,$00,$BF,$00,$BF,$00
                    db $85,$1D,$86,$1D,$BF,$00,$86,$1D
                    db $87,$1D,$BB,$1D,$87,$1D,$85,$1D
                    db $85,$1D,$BF,$00,$BF,$00,$BF,$00
                    db $BF,$00,$BF,$00,$BB,$1D,$85,$1D
                    db $BF,$00,$BB,$1D,$BB,$1D,$85,$1D
                    db $85,$1D,$86,$1D,$BB,$1D,$76,$9D
                    db $87,$1D,$BB,$1D,$77,$9D,$85,$1D
                    db $85,$1D,$BF,$00,$BB,$1D,$85,$1D
                    db $85,$1D,$BB,$1D,$BB,$1D,$85,$1D
                    db $87,$1D,$BF,$00,$77,$9D,$85,$1D
                    db $85,$1D,$76,$1D,$BB,$1D,$86,$1D
                    db $77,$1D,$BB,$1D,$87,$1D,$85,$1D
                    db $BF,$00,$BF,$00,$BF,$00,$BF,$00
                    db $6F,$1D,$6F,$1D,$6F,$1D,$6F,$1D
          
PNTR_13C661:        dw DATA_13C6AF
                    dw DATA_13C6BE
                    dw DATA_13C6DF
                    dw DATA_13C700
                    dw DATA_13C711
                    dw DATA_13C732
                    dw DATA_13C74B
                    dw DATA_13C84C
                    dw DATA_13C865
                    dw DATA_13C886
                    dw DATA_13C8A7
                    dw DATA_13C8C0
                    dw DATA_13C9C1
                    dw DATA_13CAC2
                    dw DATA_13CB23
                    dw DATA_13CB84
                    dw DATA_13CB91
                    dw DATA_13CBAA
                    dw DATA_13CBB3
                    dw DATA_13CBBA
                    dw DATA_13CBBA
                    dw DATA_13CBEB
                    dw DATA_13CCEC
                    dw DATA_13CD0D
                    dw DATA_13CD2E
                    dw DATA_13CDBF
                    dw DATA_13CDD0
                    dw DATA_13CDE9
                    dw DATA_13CDF8
                    dw DATA_13CE13
                    dw DATA_13CF14
                    dw DATA_13CF35
                    dw DATA_13CF56
                    dw DATA_13D057
                    dw DATA_13D158
                    dw DATA_13D259
                    dw DATA_13D35A
                    dw DATA_13D43C
                    dw DATA_13D45D

DATA_13C6AF:        db $91,$28,$2E,$31,$34,$35,$34,$35
                    db $29,$2F,$32,$35,$34,$35,$34
 
DATA_13C6BE:        db $01,$00,$02,$00,$02,$00,$02,$00
                    db $02,$00,$02,$00,$02,$00,$02,$00
                    db $02,$01,$03,$01,$03,$01,$03,$01
                    db $03,$01,$03,$01,$03,$01,$03,$01
                    db $03

DATA_13C6DF:        db $01,$08,$08,$62,$63,$08,$08,$08
                    db $08,$08,$62,$63,$08,$08,$08,$08
                    db $08,$08,$08,$63,$62,$08,$08,$08
                    db $08,$08,$63,$62,$08,$08,$08,$08
                    db $08

DATA_13C700:        db $81,$12,$26,$29,$29,$29,$29,$29
                    db $29,$11,$25,$29,$29,$29,$29,$29
                    db $29

DATA_13C711:        db $01,$00,$0B,$00,$0B,$00,$0B,$00
                    db $0B,$00,$0B,$00,$1F,$23,$1F,$23
                    db $1F,$01,$0C,$01,$0C,$01,$0C,$01
                    db $0C,$01,$0C,$01,$20,$24,$20,$24
                    db $20

DATA_13C732:        db $41,$28,$2E,$31,$16,$18,$44,$46
                    db $44,$46,$44,$46,$44,$29,$2F,$32
                    db $17,$19,$45,$47,$45,$47,$45,$47
                    db $45

DATA_13C74B:        db $0F,$00,$02,$04,$0E,$02,$0D,$03
                    db $05,$07,$00,$02,$04,$01,$03,$05
                    db $07,$01,$08,$02,$0D,$03,$05,$00
                    db $02,$04,$01,$03,$0C,$02,$04,$06
                    db $06,$07,$01,$03,$05,$00,$02,$0D
                    db $03,$0C,$02,$04,$01,$03,$05,$07
                    db $07,$00,$02,$04,$06,$01,$08,$02
                    db $04,$01,$03,$05,$07,$00,$02,$04
                    db $06,$01,$03,$0C,$02,$04,$01,$03
                    db $0C,$02,$04,$06,$06,$01,$03,$05
                    db $07,$06,$0E,$09,$03,$0C,$02,$04
                    db $01,$03,$0C,$02,$04,$06,$0E,$02
                    db $04,$07,$0F,$03,$05,$0F,$03,$05
                    db $07,$00,$09,$03,$05,$07,$0F,$03
                    db $05,$08,$02,$04,$0E,$02,$04,$06
                    db $06,$01,$03,$05,$00,$02,$04,$06
                    db $06,$0D,$03,$0C,$09,$03,$05,$07
                    db $00,$02,$04,$06,$01,$03,$05,$07
                    db $07,$06,$06,$01,$03,$05,$00,$02
                    db $0D,$03,$0C,$02,$04,$0E,$02,$04
                    db $06,$00,$02,$04,$0E,$02,$0D,$03
                    db $05,$00,$09,$03,$05,$0F,$03,$05
                    db $07,$01,$08,$02,$0D,$08,$02,$04
                    db $06,$01,$03,$0C,$02,$04,$0E,$02
                    db $04,$07,$0F,$08,$02,$0D,$03,$05
                    db $00,$02,$04,$01,$03,$05,$0F,$03
                    db $05,$00,$02,$0D,$03,$05,$07,$00
                    db $09,$03,$05,$07,$00,$02,$04,$06
                    db $06,$01,$03,$05,$07,$00,$02,$01
                    db $03,$05,$00,$02,$0D,$03,$05,$07
                    db $07,$06,$06,$06,$06,$01,$08,$02
                    db $04,$06,$01,$03,$05,$00,$02,$04
                    db $06

DATA_13C84C:        db $41,$15,$15,$15,$15,$15,$3E,$2E
                    db $31,$34,$35,$34,$35,$15,$15,$15
                    db $15,$15,$3F,$2F,$32,$35,$34,$35
                    db $34

DATA_13C865:        db $01,$44,$46,$44,$46,$44,$46,$44
                    db $46,$44,$46,$44,$46,$44,$46,$44
                    db $46,$45,$47,$45,$47,$45,$47,$45
                    db $47,$45,$47,$45,$47,$45,$47,$45
                    db $47
              
DATA_13C886:        db $01,$08,$08,$08,$08,$05,$0E,$04
                    db $0D,$08,$08,$05,$0E,$04,$0D,$08
                    db $08,$08,$08,$08,$08,$02,$0B,$03
                    db $0C,$08,$08,$02,$0B,$03,$0C,$08
                    db $08

DATA_13C8A7:        db $41,$01,$04,$07,$0C,$0C,$0C,$36
                    db $37,$37,$37,$37,$37,$00,$03,$08
                    db $0D,$0D,$0D,$36,$37,$37,$37,$37
                    db $37

DATA_13C8C0:        db $0F,$00,$03,$09,$0F,$0F,$1C,$21
                    db $26,$28,$30,$30,$36,$30,$30,$30
                    db $30,$00,$04,$09,$0F,$0F,$1C,$21
                    db $27,$29,$31,$29,$31,$29,$31,$29
                    db $31,$00,$03,$09,$0F,$0F,$1C,$21
                    db $26,$2A,$32,$2A,$32,$2A,$32,$2A
                    db $32,$00,$04,$09,$0F,$0F,$1C,$21
                    db $27,$2B,$33,$33,$33,$33,$33,$33
                    db $33,$00,$03,$09,$0F,$0F,$1C,$21
                    db $26,$2C,$34,$38,$2C,$30,$38,$2C
                    db $30,$00,$04,$09,$10,$16,$1D,$22
                    db $27,$2D,$2C,$36,$30,$2C,$36,$30
                    db $2C,$00,$03,$09,$0F,$0F,$1C,$21
                    db $26,$2B,$30,$2D,$30,$30,$2D,$30
                    db $30,$00,$04,$09,$0F,$0F,$1C,$21
                    db $27,$2C,$30,$36,$30,$30,$36,$38
                    db $30,$00,$03,$09,$0F,$0F,$1C,$21
                    db $26,$2C,$34,$38,$2C,$38,$2C,$3C
                    db $30,$00,$04,$09,$0F,$0F,$1C,$21
                    db $27,$2E,$30,$36,$30,$36,$30,$30
                    db $30,$00,$03,$09,$0F,$0F,$1C,$21
                    db $26,$2F,$2D,$39,$30,$2C,$2D,$30
                    db $2D,$00,$04,$09,$0F,$0F,$1C,$21
                    db $27,$2C,$35,$3A,$30,$30,$36,$30
                    db $3C,$00,$03,$09,$0F,$0F,$1C,$21
                    db $26,$2D,$36,$35,$2C,$30,$39,$2C
                    db $2C,$00,$04,$09,$10,$16,$1D,$22
                    db $27,$28,$37,$36,$30,$2C,$3B,$30
                    db $30,$00,$03,$09,$0F,$0F,$1C,$21
                    db $26,$2C,$30,$2C,$30,$30,$38,$2C
                    db $30,$00,$04,$09,$0F,$0F,$1C,$21
                    db $27,$2D,$30,$30,$2D,$30,$36,$30
                    db $2C

DATA_13C9C1:        db $0F,$26,$28,$30,$30,$36,$48,$4F
                    db $5A,$26,$28,$30,$30,$36,$30,$30
                    db $30,$27,$29,$40,$40,$31,$29,$50
                    db $5B,$27,$29,$40,$40,$31,$29,$50
                    db $71,$26,$2A,$41,$41,$32,$2A,$51
                    db $5C,$26,$2A,$41,$41,$32,$2A,$51
                    db $5C,$27,$2B,$33,$33,$33,$49,$52
                    db $5D,$27,$2B,$66,$33,$33,$33,$33
                    db $72,$26,$2C,$34,$38,$2C,$48,$4F
                    db $5E,$26,$2C,$36,$38,$2C,$30,$64
                    db $68,$27,$2D,$2C,$36,$30,$4A,$53
                    db $5E,$27,$2D,$2C,$36,$30,$64,$68
                    db $28,$26,$28,$30,$2D,$30,$48,$4F
                    db $5E,$26,$28,$30,$2D,$6C,$68,$28
                    db $73,$27,$2C,$30,$36,$30,$4A,$53
                    db $5E,$27,$2C,$30,$6A,$68,$28,$69
                    db $30,$26,$2C,$3A,$38,$2C,$48,$4F
                    db $5E,$26,$2C,$67,$68,$6D,$6F,$70
                    db $30,$27,$2E,$36,$36,$30,$4A,$53
                    db $5E,$27,$64,$68,$28,$6E,$30,$36
                    db $30,$26,$2F,$2D,$39,$30,$4B,$54
                    db $5E,$26,$65,$28,$6B,$30,$2C,$30
                    db $2D,$27,$2C,$36,$3B,$30,$2F,$55
                    db $5F,$27,$28,$69,$3A,$30,$30,$30
                    db $3C,$26,$2D,$3A,$42,$45,$4C,$56
                    db $60,$26,$2D,$36,$35,$2C,$30,$2C
                    db $2C,$27,$28,$36,$43,$46,$4D,$57
                    db $61,$27,$28,$30,$36,$30,$2C,$30
                    db $30,$26,$2C,$30,$44,$47,$4E,$58
                    db $62,$26,$2C,$30,$2C,$30,$30,$2C
                    db $30,$27,$2D,$30,$30,$2D,$30,$59
                    db $63,$27,$2D,$30,$30,$2D,$30,$30
                    db $2C

DATA_13CAC2:        db $AF,$00,$00,$19,$38,$29,$00,$00
                    db $00,$1A,$20,$38,$00,$00,$02,$1B
                    db $39,$3C,$00,$00,$0C,$1C,$3A,$20
                    db $00,$02,$0D,$0E,$3B,$39,$00,$03
                    db $0E,$1D,$0E,$3A,$00,$04,$0F,$0E
                    db $0E,$3B,$00,$05,$10,$1E,$0E,$0E
                    db $00,$06,$11,$1F,$0E,$0E,$00,$07
                    db $12,$20,$1F,$0E,$00,$08,$13,$11
                    db $3C,$1F,$00,$09,$14,$21,$20,$3C
                    db $00,$00,$15,$22,$39,$3C,$00,$00
                    db $03,$0E,$3A,$20,$00,$00,$04,$0F
                    db $3B,$39,$00,$00,$05,$10,$0E,$3A
                    db $00

DATA_13CB23:        db $AF,$00,$00,$19,$1F,$3B,$00,$00
                    db $00,$05,$20,$1F,$00,$00,$00,$06
                    db $11,$3C,$00,$00,$00,$23,$12,$20
                    db $00,$00,$06,$24,$3D,$11,$00,$00
                    db $07,$25,$3E,$21,$00,$00,$08,$26
                    db $3F,$1B,$00,$00,$09,$14,$40,$0E
                    db $00,$00,$00,$15,$41,$0E,$00,$00
                    db $00,$0C,$1E,$0E,$00,$00,$02,$27
                    db $0E,$0E,$00,$00,$0C,$28,$0E,$0E
                    db $00,$0A,$16,$0E,$28,$0E,$00,$0B
                    db $17,$0E,$0E,$0E,$00,$00,$18,$29
                    db $42,$0E,$00,$00,$05,$37,$29,$0E
                    db $00

DATA_13CB84:        db $A1,$07,$13,$18,$1A,$1B,$1B,$08
                    db $14,$19,$1A,$1B,$1B

DATA_13CB91:        db $41,$28,$2E,$31,$34,$34,$34,$34
                    db $34,$34,$34,$34,$34,$29,$2F,$32
                    db $35,$35,$35,$35,$35,$35,$35,$35
                    db $35

DATA_13CBAA:        db $C1,$10,$18,$1B,$1B,$0F,$19,$1B
                    db $1B

DATA_13CBB3:        db $A0,$48,$51,$15,$15,$15,$15

DATA_13CBBA:        db $02,$08,$08,$08,$08,$03,$0C,$03
                    db $0C,$08,$08,$03,$0C,$03,$0C,$08
                    db $08,$08,$08,$08,$08,$05,$0E,$04
                    db $0D,$08,$08,$05,$0E,$04,$0D,$08
                    db $08,$08,$08,$08,$08,$02,$0B,$03
                    db $0C,$08,$08,$02,$0B,$03,$0C,$08
                    db $08

DATA_13CBEB:        db $0F,$00,$0B,$00,$0B,$00,$0B,$00
                    db $0B,$00,$0B,$00,$0B,$00,$0B,$29
                    db $29,$01,$0C,$01,$0C,$01,$0C,$01
                    db $0C,$01,$0C,$01,$0C,$01,$0C,$29
                    db $29,$1C,$13,$08,$13,$08,$13,$08
                    db $13,$08,$13,$08,$13,$08,$1C,$29
                    db $29,$1D,$14,$09,$14,$09,$14,$09
                    db $14,$09,$14,$09,$14,$09,$1D,$29
                    db $29,$1E,$15,$0A,$15,$0A,$15,$0A
                    db $15,$0A,$15,$0A,$15,$0A,$1E,$29
                    db $29,$07,$0C,$01,$0C,$01,$0C,$01
                    db $0C,$01,$0C,$01,$0C,$01,$07,$29
                    db $29,$00,$0B,$00,$0B,$00,$0B,$00
                    db $0B,$00,$0B,$00,$0B,$00,$0B,$29
                    db $29,$01,$0C,$01,$0C,$01,$0C,$01
                    db $0C,$01,$0C,$01,$0C,$01,$0C,$29
                    db $29,$00,$0B,$00,$0B,$00,$0B,$00
                    db $0B,$00,$0B,$00,$0B,$00,$0B,$29
                    db $29,$01,$0C,$01,$0C,$01,$0C,$01
                    db $0C,$01,$0C,$01,$0C,$01,$0C,$29
                    db $29,$1C,$13,$08,$13,$08,$13,$08
                    db $13,$08,$13,$08,$13,$08,$1C,$29
                    db $29,$1D,$14,$09,$14,$09,$14,$09
                    db $14,$09,$14,$09,$14,$09,$1D,$29
                    db $29,$1E,$15,$0A,$15,$0A,$15,$0A
                    db $15,$0A,$15,$0A,$15,$0A,$1E,$29
                    db $29,$07,$0C,$01,$0C,$01,$0C,$01
                    db $0C,$01,$0C,$01,$0C,$01,$07,$29
                    db $29,$00,$0B,$00,$0B,$00,$0B,$00
                    db $0B,$00,$0B,$00,$0B,$00,$0B,$29
                    db $29,$01,$0C,$01,$0C,$01,$0C,$01
                    db $0C,$01,$0C,$01,$0C,$01,$0C,$29
                    db $29

DATA_13CCEC:        db $01,$01,$0C,$01,$0C,$01,$0C,$01
                    db $0C,$01,$0C,$01,$0C,$01,$1F,$23
                    db $1F,$00,$0B,$00,$0B,$00,$0B,$00
                    db $0B,$00,$0B,$00,$0B,$00,$20,$24
                    db $20
      
DATA_13CD0D:        db $01,$1F,$23,$1F,$23,$1F,$23,$1F
                    db $23,$1F,$23,$1F,$23,$1F,$23,$1F
                    db $23,$20,$24,$20,$24,$20,$24,$20
                    db $24,$20,$24,$20,$24,$20,$24,$20
                    db $24

DATA_13CD2E:        db $7F,$00,$00,$00,$07,$13,$18,$1A
                    db $1B,$1B,$00,$00,$00,$0C,$17,$19
                    db $1A,$1B,$1B,$00,$00,$00,$02,$12
                    db $18,$1A,$1B,$1B,$00,$02,$04,$06
                    db $11,$19,$1A,$1B,$1B,$00,$03,$05
                    db $05,$10,$18,$1A,$1B,$1B,$00,$00
                    db $00,$00,$0E,$19,$1A,$1B,$1B,$00
                    db $00,$00,$0B,$16,$18,$1A,$1B,$1B
                    db $00,$00,$00,$08,$14,$19,$1A,$1B
                    db $1B,$00,$00,$00,$07,$13,$18,$1A
                    db $1B,$1B,$00,$00,$00,$08,$14,$19
                    db $1A,$1B,$1B,$00,$00,$02,$04,$12
                    db $18,$1A,$1B,$1B,$02,$04,$06,$05
                    db $11,$19,$1A,$1B,$1B,$03,$0A,$04
                    db $04,$12,$18,$1A,$1B,$1B,$00,$03
                    db $05,$05,$11,$19,$1A,$1B,$1B,$00
                    db $00,$00,$00,$0D,$18,$1A,$1B,$1B
                    db $00,$00,$02,$04,$0F,$19,$1A,$1B
                    db $1B

DATA_13CDBF:        db $00,$1B,$1B,$1B,$1B,$1B,$1B,$1B
                    db $1B,$1B,$1B,$1B,$1B,$1B,$1B,$1B
                    db $1B

DATA_13CDD0:        db $41,$00,$03,$08,$0D,$0D,$0D,$36
                    db $37,$37,$30,$30,$30,$01,$04,$07
                    db $0C,$0C,$0C,$36,$37,$37,$30,$30
                    db $30

DATA_13CDE9:        db $91,$28,$2E,$31,$34,$48,$4A,$4C
                    db $29,$2F,$32,$35,$49,$4B,$4C

DATA_13CDF8:        db $31,$00,$04,$09,$0F,$0F,$0F,$1C
                    db $21,$30,$30,$30,$30,$30,$00,$03
                    db $09,$0F,$0F,$0F,$1C,$21,$30,$30
                    db $30,$30,$30
  
DATA_13CE13:        db $0F,$16,$0D,$02,$0D,$02,$0D,$02
                    db $0D,$02,$0D,$02,$0D,$02,$16,$29
                    db $29,$17,$0E,$03,$0E,$03,$0E,$03
                    db $0E,$03,$0E,$03,$0E,$03,$17,$29
                    db $29,$18,$0F,$04,$0F,$04,$0F,$04
                    db $0F,$04,$0F,$04,$0F,$04,$18,$29
                    db $29,$01,$0C,$01,$0C,$01,$0C,$01
                    db $0C,$01,$0C,$01,$0C,$01,$0C,$29
                    db $29,$00,$0B,$00,$0B,$00,$0B,$00
                    db $0B,$00,$0B,$00,$0B,$00,$0B,$29
                    db $29,$01,$0C,$01,$0C,$01,$0C,$01
                    db $0C,$01,$0C,$01,$0C,$01,$0C,$29
                    db $29,$00,$0B,$00,$0B,$00,$0B,$00
                    db $0B,$00,$0B,$00,$0B,$00,$0B,$29
                    db $29,$19,$10,$05,$10,$05,$10,$05
                    db $10,$05,$10,$05,$10,$05,$19,$29
                    db $29,$1A,$11,$06,$11,$06,$11,$06
                    db $11,$06,$11,$06,$11,$06,$1A,$29
                    db $29,$1B,$12,$07,$12,$07,$12,$07
                    db $12,$07,$12,$07,$12,$07,$1B,$29
                    db $29,$00,$0B,$00,$0B,$00,$0B,$00
                    db $0B,$00,$0B,$00,$0B,$00,$0B,$29
                    db $29,$01,$0C,$01,$0C,$01,$0C,$01
                    db $0C,$01,$0C,$01,$0C,$01,$0C,$29
                    db $29,$00,$0B,$00,$0B,$00,$0B,$00
                    db $0B,$00,$0B,$00,$0B,$00,$0B,$29
                    db $29,$01,$0C,$01,$0C,$01,$0C,$01
                    db $0C,$01,$0C,$01,$0C,$01,$0C,$29
                    db $29,$16,$0D,$02,$0D,$02,$0D,$02
                    db $0D,$02,$0D,$02,$0D,$02,$16,$29
                    db $29,$17,$0E,$03,$0E,$03,$0E,$03
                    db $0E,$03,$0E,$03,$0E,$03,$17,$29
                    db $29

DATA_13CF14:        db $01,$00,$0B,$00,$0B,$00,$0B,$00
                    db $0B,$00,$0B,$00,$0B,$00,$0B,$00
                    db $0B,$01,$0C,$01,$0C,$01,$0C,$01
                    db $0C,$01,$0C,$01,$0C,$01,$0C,$01
                    db $0C

DATA_13CF35:        db $01,$0B,$00,$0B,$00,$0B,$00,$0B
                    db $00,$0B,$00,$0B,$00,$0B,$00,$0B
                    db $00,$0C,$01,$0C,$01,$0C,$01,$0C
                    db $01,$0C,$01,$0C,$01,$0C,$01,$0C
                    db $01

DATA_13CF56:        db $0F,$00,$10,$00,$10,$00,$10,$00
                    db $10,$00,$10,$00,$10,$00,$10,$00
                    db $10,$01,$01,$01,$01,$01,$01,$01
                    db $01,$01,$01,$01,$01,$01,$01,$01
                    db $01,$02,$02,$02,$02,$02,$12,$02
                    db $02,$02,$02,$02,$12,$02,$02,$02
                    db $02,$03,$03,$03,$03,$03,$03,$03
                    db $03,$03,$03,$03,$03,$03,$03,$03
                    db $03,$14,$04,$04,$04,$04,$04,$04
                    db $04,$04,$14,$04,$04,$04,$04,$04
                    db $04,$05,$05,$05,$05,$05,$05,$05
                    db $05,$05,$05,$05,$05,$05,$05,$05
                    db $05,$06,$06,$06,$06,$06,$06,$06
                    db $06,$06,$06,$18,$06,$06,$06,$06
                    db $06,$07,$07,$07,$07,$07,$07,$07
                    db $1A,$07,$07,$07,$07,$07,$07,$1A
                    db $07,$08,$08,$08,$08,$08,$08,$08
                    db $1B,$08,$08,$08,$08,$08,$08,$08
                    db $08,$09,$09,$09,$19,$09,$09,$09
                    db $09,$09,$09,$09,$09,$09,$09,$09
                    db $09,$0A,$0A,$0A,$0A,$0A,$0A,$0A
                    db $0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A
                    db $0A,$0B,$0B,$0B,$0B,$0B,$0B,$15
                    db $0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B
                    db $0B,$0C,$0C,$0C,$0C,$0C,$0C,$0C
                    db $0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C
                    db $0C,$13,$0D,$0D,$0D,$0D,$0D,$0D
                    db $0D,$0D,$0D,$0D,$0D,$0D,$13,$0D
                    db $0D,$0E,$0E,$0E,$0E,$0E,$0E,$0E
                    db $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E
                    db $0E,$0F,$11,$0F,$11,$0F,$11,$0F
                    db $11,$0F,$11,$0F,$11,$0F,$11,$0F
                    db $11

DATA_13D057:        db $0F,$10,$00,$10,$00,$10,$00,$10
                    db $00,$10,$00,$10,$00,$10,$00,$10
                    db $00,$01,$01,$01,$01,$01,$01,$01
                    db $01,$01,$01,$01,$01,$01,$01,$01
                    db $01,$02,$02,$02,$02,$12,$02,$02
                    db $02,$02,$02,$02,$02,$02,$02,$02
                    db $02,$03,$03,$03,$03,$03,$03,$03
                    db $03,$03,$03,$03,$03,$03,$03,$03
                    db $03,$04,$04,$04,$04,$04,$04,$04
                    db $04,$04,$04,$14,$04,$04,$04,$04
                    db $04,$05,$05,$05,$05,$05,$05,$16
                    db $05,$05,$05,$05,$05,$05,$05,$05
                    db $05,$06,$06,$18,$06,$06,$06,$06
                    db $06,$06,$06,$06,$06,$06,$06,$06
                    db $06,$07,$07,$07,$07,$07,$07,$07
                    db $07,$07,$07,$07,$07,$07,$07,$07
                    db $07,$08,$08,$08,$08,$08,$08,$08
                    db $08,$08,$08,$08,$08,$1B,$08,$08
                    db $08,$09,$09,$09,$09,$09,$09,$09
                    db $09,$09,$19,$09,$09,$09,$09,$09
                    db $09,$0A,$0A,$0A,$0A,$0A,$0A,$0A
                    db $0A,$0A,$0A,$0A,$0A,$0A,$17,$0A
                    db $0A,$0B,$15,$0B,$0B,$0B,$0B,$0B
                    db $0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B
                    db $0B,$0C,$0C,$0C,$0C,$0C,$0C,$0C
                    db $0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C
                    db $0C,$0D,$0D,$0D,$0D,$0D,$0D,$0D
                    db $0D,$13,$0D,$0D,$0D,$0D,$0D,$0D
                    db $0D,$0E,$0E,$0E,$0E,$0E,$0E,$0E
                    db $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E
                    db $0E,$11,$0F,$11,$0F,$11,$0F,$11
                    db $0F,$11,$0F,$11,$0F,$11,$0F,$11
                    db $0F

DATA_13D158:        db $0F,$27,$2C,$30,$36,$30,$30,$30
                    db $30,$48,$4F,$27,$2C,$30,$36,$30
                    db $30,$26,$2D,$30,$30,$30,$2D,$30
                    db $30,$4A,$53,$26,$2D,$30,$30,$30
                    db $2D,$27,$28,$30,$30,$30,$36,$30
                    db $30,$48,$4F,$27,$28,$30,$30,$30
                    db $36,$26,$2C,$30,$30,$30,$30,$30
                    db $30,$4A,$53,$26,$2C,$30,$30,$30
                    db $30,$27,$2C,$34,$34,$38,$2C,$34
                    db $38,$48,$4F,$27,$2C,$34,$34,$38
                    db $2C,$26,$2D,$2C,$2C,$36,$30,$2C
                    db $36,$4A,$53,$26,$2D,$2C,$2C,$36
                    db $30,$27,$28,$30,$30,$2D,$30,$30
                    db $2D,$48,$4F,$27,$28,$30,$30,$2D
                    db $30,$26,$2C,$30,$30,$36,$30,$30
                    db $36,$4A,$53,$26,$2C,$30,$30,$36
                    db $30,$27,$2C,$30,$3A,$38,$2C,$3A
                    db $38,$48,$4F,$27,$2C,$3A,$30,$38
                    db $2C,$26,$2E,$30,$36,$36,$30,$36
                    db $36,$4A,$53,$26,$2E,$36,$2C,$36
                    db $30,$27,$2F,$2D,$30,$30,$30,$2D
                    db $30,$48,$4F,$27,$2F,$2D,$30,$30
                    db $30,$26,$2C,$36,$30,$30,$30,$36
                    db $30,$4A,$53,$26,$2C,$36,$30,$30
                    db $30,$27,$2D,$30,$3A,$30,$2C,$3A
                    db $30,$48,$4F,$27,$2D,$3A,$30,$30
                    db $30,$26,$28,$30,$36,$30,$2C,$36
                    db $30,$4A,$53,$26,$28,$36,$2C,$30
                    db $30,$27,$2C,$30,$30,$30,$2C,$30
                    db $30,$48,$4F,$27,$2C,$30,$30,$30
                    db $30,$26,$2D,$30,$30,$3A,$2C,$30
                    db $30,$4A,$53,$26,$2D,$30,$30,$30
                    db $2D

DATA_13D259:        db $0F,$27,$28,$30,$30,$36,$2C,$30
                    db $30,$48,$4F,$27,$28,$30,$30,$30
                    db $36,$26,$2D,$30,$2C,$30,$30,$30
                    db $30,$4A,$53,$26,$2C,$30,$2C,$30
                    db $30,$27,$28,$30,$30,$2C,$30,$2C
                    db $30,$4B,$54,$27,$2C,$30,$30,$30
                    db $2D,$26,$29,$29,$40,$40,$40,$50
                    db $29,$29,$50,$40,$40,$31,$29,$29
                    db $31,$27,$2A,$2A,$41,$41,$41,$41
                    db $2A,$2A,$41,$41,$41,$32,$2A,$2A
                    db $32,$26,$2B,$33,$33,$33,$33,$5D
                    db $26,$2B,$33,$33,$33,$33,$33,$33
                    db $33,$27,$2C,$30,$30,$2F,$55,$5F
                    db $27,$2C,$30,$2D,$30,$30,$30,$2D
                    db $30,$26,$2C,$42,$45,$4C,$56,$60
                    db $26,$2D,$30,$36,$30,$30,$30,$36
                    db $2C,$27,$2E,$43,$46,$4D,$57,$61
                    db $27,$28,$30,$2C,$30,$2D,$30,$30
                    db $70,$26,$2C,$44,$47,$4E,$58,$62
                    db $26,$2C,$30,$30,$30,$36,$30,$30
                    db $30,$27,$2E,$30,$30,$30,$59,$63
                    db $27,$2C,$3A,$2C,$30,$30,$30,$2C
                    db $30,$26,$2F,$30,$30,$2F,$30,$5E
                    db $26,$2C,$36,$3A,$69,$3A,$30,$30
                    db $30,$27,$29,$29,$40,$40,$40,$50
                    db $29,$29,$50,$40,$40,$31,$29,$29
                    db $31,$26,$2A,$2A,$41,$41,$41,$41
                    db $2A,$2A,$41,$41,$41,$32,$2A,$2A
                    db $32,$27,$28,$33,$33,$33,$33,$33
                    db $33,$49,$52,$26,$28,$33,$33,$33
                    db $33,$26,$2C,$30,$2D,$30,$30,$30
                    db $30,$48,$4F,$27,$2C,$30,$2D,$30
                    db $30

DATA_13D35A:        db $1E

                    db $4D,$4D,$4D,$4D,$4D,$4D,$4D,$4D
                    db $4D,$4D,$4D,$4D,$4D,$4D,$4D,$00
                    db $05,$0D,$0D,$0D,$0D,$0D,$0D,$0D
                    db $0D,$0D,$00,$05,$4D,$4D,$01,$06
                    db $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E
                    db $0E,$01,$06,$4D,$4D,$02,$07,$0F
                    db $14,$1C,$14,$0F,$14,$14,$14,$41
                    db $46,$4B,$4D,$4D,$03,$08,$10,$10
                    db $1B,$1B,$1B,$10,$1B,$3A,$42,$47
                    db $4C,$4D,$4D,$04,$09,$09,$15,$1D
                    db $23,$2A,$30,$36,$3B,$43,$48,$49
                    db $4D,$4D,$04,$04,$11,$16,$1E,$24
                    db $2B,$31,$37,$3C,$44,$45,$49,$4D
                    db $4D,$04,$04,$12,$17,$1F,$25,$2C
                    db $32,$4E,$3D,$4D,$49,$49,$4D,$4D
                    db $04,$0A,$4D,$18,$20,$26,$2D,$33
                    db $4E,$3E,$44,$48,$49,$4D,$4D,$04
                    db $04,$09,$19,$21,$27,$2E,$34,$38
                    db $3F,$4D,$45,$49,$4D,$4D,$04,$0B
                    db $11,$1A,$22,$28,$2F,$35,$39,$40
                    db $45,$49,$49,$4D,$4D,$02,$07,$0F
                    db $14,$0F,$14,$14,$0F,$14,$14,$41
                    db $46,$4B,$4D,$4D,$03,$0C,$13,$1B
                    db $1B,$29,$13,$1B,$1B,$1B,$10,$4A
                    db $4C,$4D,$4D,$01,$06,$0E,$0E,$0E
                    db $0E,$0E,$0E,$0E,$0E,$0E,$01,$06
                    db $4D,$4D,$00,$05,$0D,$0D,$0D,$0D
                    db $0D,$0D,$0D,$0D,$0D,$00,$05,$4D
                    db $4D

DATA_13D43C:        db $01,$44,$46,$44,$46,$44,$46,$44
                    db $46,$44,$46,$44,$46,$44,$46,$44
                    db $46,$45,$47,$45,$47,$45,$47,$45
                    db $47,$45,$47,$45,$47,$45,$47,$45

                    db $47

DATA_13D45D:        db $A0,$36,$37,$37,$37,$37,$37

DATA_13D464:        db $26,$38

DATA_13D466:        db $2C,$01

DATA_13D468:        db $1A,$24,$25

DATA_13D46B:        db $0A,$09,$71,$72,$73,$74

DATA_13D471:        db $51,$52,$53,$54,$55,$56

DATA_13D477:        db $06,$10,$0B,$16,$0C,$17,$09,$15
                    db $00,$0D,$00,$0E

DATA_13D483:        db $13,$1B,$50,$59

DATA_13D487:        db $23,$2A,$24,$2B,$04,$06,$05,$07
                    db $00,$0D,$00,$0E,$49,$51,$4A,$55

DATA_13D497:        db $1C,$1D,$21,$22,$5E

DATA_13D49C:        db $04,$06,$08,$07,$09,$03,$0A,$02
                    db $0B,$06,$05,$07,$37,$47,$38,$48
                    db $25,$25,$89,$8B,$8A,$8C,$25,$25
                    db $01,$04,$02,$05,$03,$06
    
DATA_13D4BA:        db $02,$02,$02,$02,$08,$08,$08,$08
                    db $08,$08

DATA_13D4C4:        db $01,$02,$03,$04,$02,$03,$04,$05
                    db $06,$08

DATA_13D4CE:        db $01,$03,$0B,$62,$63,$0C,$02

DATA_13D4D5:        db $76,$33,$2E,$67,$64,$2E,$33

DATA_13D4DC:        db $20,$25,$21,$26,$2C,$30,$33,$22
                    db $27,$2D

DATA_13D4E6:        db $15,$16,$17,$18,$19,$27,$28,$29
                    db $2A,$2B,$2C,$2D,$2E,$2F,$30,$31
                    db $32,$33,$35,$36,$37,$39,$3A,$3B
                    db $3C,$3D,$3E,$3F,$45,$46,$47,$4D
                    db $4E,$57,$58,$5B,$5C,$5D,$5F,$60
                    db $61,$62,$63,$64,$65,$66,$67,$68
                    db $69,$6A,$6B,$6C

PNTR_13D51A:        dw DATA_13D582
                    dw DATA_13D582
                    dw DATA_13D582
                    dw DATA_13D582
                    dw DATA_13D582
                    dw DATA_13D582
                    dw DATA_13D5A1
                    dw DATA_13D5AA
                    dw DATA_13D5B7
                    dw DATA_13D5BE
                    dw DATA_13D5C5
                    dw DATA_13D5D1
                    dw DATA_13D5D5
                    dw DATA_13D5E2
                    dw DATA_13D5E7
                    dw DATA_13D5F4
                    dw DATA_13D5F9
                    dw DATA_13D5FD
                    dw DATA_13D605
                    dw DATA_13D60E
                    dw DATA_13D630
                    dw DATA_13D646
                    dw DATA_13D64D
                    dw DATA_13D654
                    dw DATA_13D661
                    dw DATA_13D668
                    dw DATA_13D66C
                    dw DATA_13D685
                    dw DATA_13D692
                    dw DATA_13D69C
                    dw DATA_13D6A9
                    dw DATA_13D6BC
                    dw DATA_13D6C3
                    dw DATA_13D6F5
                    dw DATA_13D714
                    dw DATA_13D79C
                    dw DATA_13D7AC
                    dw DATA_13D81D
                    dw DATA_13D864
                    dw DATA_13D873
                    dw DATA_13D873
                    dw DATA_13D892
                    dw DATA_13D8AC
                    dw DATA_13D8B6
                    dw DATA_13D8B6
                    dw DATA_13D8B6
                    dw DATA_13D8B6
                    dw DATA_13D8D1
                    dw DATA_13D8F9
                    dw DATA_13D93A
                    dw DATA_13D96B
                    dw DATA_13D9B9

DATA_13D582:        db $E1,$40,$09,$65,$68,$17,$1B,$09
                    db $40,$09,$65,$68,$17,$1B,$09,$09
                    db $30,$0A,$0A,$0A,$15,$1C,$0A,$30
                    db $0A,$0A,$0A,$15,$1C,$0A,$0A

DATA_13D5A1:        db $31,$60,$60,$60,$60,$25,$25,$64
                    db $67

DATA_13D5AA:        db $51,$6A,$6F,$77,$7A,$7A,$7A,$6B
                    db $25,$25,$25,$67,$64

DATA_13D5B7:        db $21,$6A,$6F,$77,$6B,$25,$25

DATA_13D5BE:        db $21,$6A,$7A,$6F,$6B,$25,$25

DATA_13D5C5:        db $A0,$61,$61,$66,$69,$16,$6E,$75
                    db $61,$61,$66,$69

DATA_13D5D1:        db $20,$7F,$80,$81

DATA_13D5D5:        db $51,$6A,$6F,$77,$7A,$7A,$7A,$6B
                    db $83,$25,$25,$64,$67

DATA_13D5E2:        db $30,$86,$2C,$2C,$08

DATA_13D5E7:        db $51,$7F,$80,$81,$81,$8D,$81,$19
                    db $73,$88,$08,$63,$62

DATA_13D5F4:        db $30,$75,$61,$84,$85

DATA_13D5F9:        db $02,$7C,$7D,$7E

DATA_13D5FD:        db $06,$7D,$7D,$7D,$7D,$7D,$7D,$7E

DATA_13D605:        db $13,$0B,$1A,$0C,$1B,$09,$18,$0A
                    db $19

DATA_13D60E:        db $2A,$00,$0D,$1C,$03,$0E,$1D,$04
                    db $0F,$1E,$05,$0E,$1F,$04,$0F,$20
                    db $05,$0E,$21,$04,$0F,$1E,$05,$0E
                    db $1F,$04,$0F,$20,$05,$0E,$21,$06
                    db $10,$24

DATA_13D630:        db $26,$00,$0D,$1C,$03,$0E,$1D,$04
                    db $0F,$1E,$05,$0E,$1F,$04,$0F,$20
                    db $05,$0E,$21,$06,$10,$24

DATA_13D646:        db $50,$2A,$02,$07,$0C,$0C,$0C

DATA_13D64D:        db $50,$2A,$05,$09,$0D,$0D,$0D

DATA_13D654:        db $51
                    db $2A,$2A,$2A,$0E,$32,$34,$2A,$2A
                    db $2A,$0F,$33,$35

DATA_13D661:        db $50,$2A,$06,$0A
                    db $10,$10,$10

DATA_13D668:        db $20,$24,$29,$29

DATA_13D66C:        db $35
                    db $07,$11,$17,$17,$0B,$12,$18,$18
                    db $19,$12,$18,$18,$1A,$12,$18,$18
                    db $39,$1C,$1E,$1E,$08,$3A,$3A,$3A

DATA_13D685:        db $51,$01,$04,$07,$0C,$0C,$0C,$00
                    db $03,$08,$0D,$0D,$0D

DATA_13D692:        db $22,$1E,$21
                    db $25,$1F,$22,$26,$20,$23,$27

DATA_13D69C:        db $23
                    db $00,$04,$0A,$01,$05,$0B,$02,$06
                    db $0C,$03,$07,$0D

DATA_13D6A9:        db $25,$00,$04,$0A
                    db $01,$05,$0B,$02,$06,$0C,$01,$05
                    db $0B,$02,$06,$0C,$03,$07,$0D

DATA_13D6BC:        db $21
                    db $37,$43,$4D,$38,$44,$4E

DATA_13D6C3:        db $66,$01
                    db $05,$05,$05,$05,$05,$05,$02,$06
                    db $0A,$11,$18,$1E,$23,$00,$07,$0B
                    db $12,$19,$3D,$3D,$00,$07,$0C,$13
                    db $1A,$3D,$3D,$00,$07,$04,$14,$1B
                    db $1F,$24,$01,$05,$05,$05,$05,$05
                    db $05,$02,$08,$0D,$15,$15,$20,$25

DATA_13D6F5:        db $29,$51,$56,$15,$52,$07,$15,$53
                    db $15,$15,$54,$08,$15,$51,$57,$08
                    db $51,$58,$15,$51,$56,$15,$51,$57
                    db $08,$51,$59,$5A,$51,$58,$15

DATA_13D714:        db $8E
                    db $03,$08,$15,$15,$0A,$08,$15,$15
                    db $15,$00,$03,$08,$0A,$06,$03,$08
                    db $15,$15,$00,$00,$03,$06,$00,$00
                    db $02,$15,$15,$00,$00,$00,$2A,$00
                    db $00,$03,$08,$15,$00,$00,$20,$2B
                    db $32,$3A,$3A,$44,$08,$00,$00,$21
                    db $2C,$33,$3B,$40,$40,$4B,$00,$20
                    db $25,$2D,$00,$3C,$00,$00,$00,$00
                    db $21,$26,$2D,$34,$00,$00,$00,$0B
                    db $00,$22,$27,$2E,$35,$3D,$3D,$3D
                    db $4C,$00,$23,$28,$2E,$36,$3E,$41
                    db $45,$4D,$00,$24,$29,$2E,$00,$00
                    db $00,$00,$00,$00,$00,$23,$2F,$32
                    db $3A,$3A,$3A,$4E,$00,$00,$24,$30
                    db $33,$3B,$40,$40,$4F,$00,$00,$00
                    db $31,$00,$3C,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00

DATA_13D79C:        db $24
                    db $00,$00,$00,$00,$00,$37,$00,$00
                    db $38,$00,$00,$3C,$00,$00,$00

DATA_13D7AC:        db $7D
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$37,$00
                    db $00,$00,$00,$00,$00,$00,$38,$3F
                    db $00,$00,$00,$00,$00,$00,$3C,$00
                    db $00,$00,$00,$00,$00,$37,$00,$00
                    db $00,$00,$00,$00,$00,$38,$3F,$3F
                    db $00,$00,$00,$00,$00,$3C,$00,$00
                    db $00,$00,$00,$00,$00,$37,$00,$00
                    db $00,$00,$00,$00,$00,$38,$3F,$3F
                    db $00,$00,$00,$00,$00,$3C,$00,$00
                    db $00,$00,$00,$00,$00,$2A,$00,$00

DATA_13D81D:        db $69,$00,$20,$2B,$32,$3A,$6D,$71
                    db $00,$21,$2C,$63,$66,$66,$72,$20
                    db $25,$2D,$64,$67,$67,$73,$21,$26
                    db $2D,$64,$68,$6E,$74,$22,$27,$2E
                    db $64,$69,$6F,$75,$23,$28,$2E,$64
                    db $6A,$70,$76,$24,$29,$2E,$64,$67
                    db $67,$77,$00,$23,$2F,$65,$6B,$6B
                    db $78,$00,$24,$30,$33,$6C,$6C,$79
                    db $00,$00,$31,$00,$00,$00,$00

DATA_13D864:        db $61
                    db $2F,$33,$39,$45,$4F,$55,$5B,$30
                    db $34,$3A,$46,$50,$56,$5C

DATA_13D873:        db $E1,$46
                    db $09,$17,$1B,$54,$55,$52,$53,$17
                    db $46,$54,$55,$52,$53,$17,$49,$0A
                    db $15,$1C,$0A,$30,$0A,$0A,$15,$1C
                    db $0A,$30,$0A,$0A,$15

DATA_13D892:        db $44,$20,$08
                    db $28,$29,$2A,$19,$28,$29,$2A,$31
                    db $21,$29,$2A,$31,$2C,$22,$2A,$57
                    db $08,$2C,$23,$56,$0E,$36,$32

DATA_13D8AC:        db $22
                    db $1D,$02,$0B,$1E,$26,$0E,$1F,$27
                    db $26

DATA_13D8B6:        db $C1,$03,$0E,$03,$0E,$03,$0E
                    db $03,$0E,$03,$0E,$03,$0E,$17,$04
                    db $0F,$04,$0F,$04,$0F,$04,$0F,$04
                    db $0F,$04,$0F,$18

DATA_13D8D1:        db $C2,$08,$13,$08
                    db $13,$08,$13,$08,$13,$08,$13,$08
                    db $13,$1C,$09,$14,$09,$14,$09,$14
                    db $09,$14,$09,$14,$09,$14,$1D,$0A
                    db $15,$0A,$15,$0A,$15,$0A,$15,$0A
                    db $15,$0A,$15,$1E

DATA_13D8F9:        db $3F,$00,$00,$3B
                    db $39,$00,$00,$3A,$1A,$00,$00,$0C
                    db $1B,$00,$00,$09,$18,$00,$00,$0A
                    db $19,$00,$00,$12,$26,$00,$00,$11
                    db $25,$00,$00,$13,$27,$00,$00,$14
                    db $28,$00,$07,$15,$28,$07,$37,$15
                    db $28,$08,$38,$16,$28,$00,$08,$38
                    db $28,$00,$00,$08,$28,$00,$00,$3B
                    db $28,$00,$00,$3A,$28

DATA_13D93A:        db $2F,$30,$30
                    db $30,$30,$39,$2C,$2C,$3B,$30,$30
                    db $38,$2C,$2C,$36,$30,$30,$38,$2C
                    db $30,$36,$38,$38,$2C,$3C,$36,$30
                    db $30,$2D,$2D,$30,$35,$36,$30,$36
                    db $39,$2C,$37,$3B,$30,$30,$38,$2C
                    db $30,$36,$30,$30,$2C,$30

DATA_13D96B:        db $A6,$01
                    db $05,$05,$05,$05,$05,$05,$05,$05
                    db $05,$05,$02,$0A,$11,$18,$1E,$23
                    db $02,$06,$06,$06,$06,$00,$0B,$12
                    db $19,$3D,$3D,$00,$07,$07,$07,$07
                    db $00,$0C,$13,$1A,$3D,$3D,$00,$07
                    db $07,$07,$07,$00,$04,$14,$1B,$1F
                    db $24,$00,$07,$07,$07,$07,$01,$05
                    db $05,$05,$05,$05,$05,$05,$05,$05
                    db $05,$02,$0A,$09,$0F,$0F,$0F,$1C
                    db $21,$30,$36,$30

DATA_13D9B9:        db $30,$10,$16,$1D,$22

DATA_13D9BE:        db $02,$03,$04,$05,$06,$07,$08,$09
                    db $0A,$07

DATA_13D9C8:        db $0D,$0E,$0F,$10,$11,$12,$13,$14
                    db $15,$12

DATA_13D9D2:        db $16,$17,$18,$19,$1A,$1B,$1C,$1D
                    db $1E,$1B

DATA_13D9DC:        db $03,$06,$0A

DATA_13D9DF:        db $17,$16,$16,$15

DATA_13D9E3:        db $19
                        
DATA_13D9E4:        db $00,$01,$6C,$6D,$22,$23

DATA_13D9EA:        db $18,$1A,$6C,$6D,$22,$23

DATA_13D9F0:        db $01,$02,$03,$06,$06,$03,$02

DATA_13D9F7:        db $1D,$1E,$26,$1F,$27,$26,$6C,$60
                    db $78,$7B,$60,$60,$6D,$70,$2A,$25
                    db $64,$67,$22,$2A,$79,$23,$31

PNTR_13DA0E:        dw DATA_13DA16
                    dw DATA_13DA16
                    dw DATA_13DA16
                    dw DATA_13DA16

DATA_13DA16:        db $60,$30,$B2,$2C,$83,$2E,$14,$33
                    db $54,$2F,$C4,$36,$25,$30,$97,$35
                    db $D8,$2C,$59,$31,$2A,$2B,$6C,$33
                    db $EC,$36,$0D,$2E,$BD,$2B,$8E,$31
                    db $4F,$2C,$F0,$61,$30,$B3,$2C,$84
                    db $2E,$15,$33,$55,$2F,$C5,$36,$26
                    db $30,$98,$35,$D9,$2C,$5A,$31,$2B
                    db $2B,$6D,$33,$ED,$36,$0E,$2E,$BE
                    db $2B,$8F,$31,$F0,$60,$30,$B2,$2C
                    db $83,$2E,$14,$33,$54,$2F,$C4,$36
                    db $25,$30,$97,$35,$D8,$2C,$59,$31
                    db $2A,$2B,$6C,$33,$EC,$36,$0D,$2E
                    db $BD,$2B,$8E,$31,$4F,$2C,$F0,$40
                    db $2C,$42,$2F,$03,$31,$16,$30,$59
                    db $30,$2A,$2B,$4D,$2D,$1E,$35,$FF

DATA_13DA8E:        db $07,$14,$27,$20,$27

DATA_13DA93:        db $37,$15,$28,$22,$28

DATA_13DA98:        db $38,$16,$28,$23,$25

DATA_13DA9D:        db $08,$08,$39,$21,$26

DATA_13DAA2:        db $13

DATA_13DAA3:        db $3B

DATA_13DAA4:        db $3A

DATA_13DAA5:        db $05,$08,$04,$0A

DATA_13DAA9:        db $08,$15,$24,$16,$0F

DATA_13DAAE:        db $10,$11,$12,$13,$14

DATA_13DAB3:        db $17,$18,$18,$19,$1A

DATA_13DAB8:        db $1B,$18,$18,$1C,$1D

DATA_13DABD:        db $35,$36,$3F,$40,$5E,$5F,$60,$61
                    db $2D,$2E,$2F,$30,$77,$78,$79,$7A

DATA_13DACD:        db $41,$42,$43,$4A,$65,$66,$67,$68
                    db $31,$32,$33,$34,$7B,$53,$42,$7C

DATA_13DADD:        db $4B,$4C,$4D,$4E,$6C,$6D,$6E,$6F
                    db $3B,$3C,$39,$3A,$7D,$43,$4C,$7E
                    db $52,$53,$42,$54,$70,$71,$66,$72
                    db $47,$48,$32,$46,$62,$4D,$53,$63
                    db $59,$43,$4C,$5A,$73,$67,$6D,$74
                    db $51,$33,$3C,$50,$69,$42,$43,$6A
                    db $62,$4D,$53,$63,$75,$6E,$71,$76
                    db $57,$39,$48,$56,$4B,$4C,$4D,$4E
                    db $69,$42,$43,$6A,$00,$00,$00,$00
                    db $5D,$32,$33,$5C,$52,$53,$42,$54

DATA_13DB2D:        db $39,$3A,$32,$3B,$3C,$48

DATA_13DB33:        db $3D,$3E
                    db $49,$37,$38,$44

DATA_13DB39:        db $2F,$33,$39,$32
                    db $3C,$48

DATA_13DB3F:        db $58,$5B,$64,$6B,$4F,$55

DATA_13DB45:        db $02,$03

DATA_13DB47:        db $04,$05

DATA_13DB49:        db $04,$05

DATA_13DB4B:        db $06,$0A

DATA_13DB4D:        db $13,$14,$14,$13

DATA_13DB51:        db $12,$0F,$11,$10

DATA_13DB55:        db $10,$11,$12,$0F

DATA_13DB59:        db $12,$0F,$10,$11

DATA_13DB5D:        db $43

DATA_13DB5E:        db $47

DATA_13DB5F:        db $50

DATA_13DB60:        db $4D,$5F,$64,$65,$66,$27,$61

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
                    db $FF                                  ; /

CODE_13DC00:        REP   #$30                  
                    LDA.w $0533                 
                    AND.w #$00FF                
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    TAX                         
                    LDY.w #$0000                
CODE_13DC11:        LDA.l DATA_14B65C,x             
                    STA.w $0CA0,y               
                    INX                         
                    INX                         
                    INY                         
                    INY                         
                    CPY.w #$0020                
                    BNE   CODE_13DC11           
                    SEP   #$30                  
                    LDX.w $0533                 
                    LDA.l DATA_11D098,x             
                    CLC                         
                    ADC.w $0534                 
                    LDX.b #$06                  
CODE_13DC30:        CMP   DATA_138779,x             
                    BEQ   CODE_13DC3C           
                    DEX                         
                    BPL   CODE_13DC30           
                    BRL   CODE_13DEDC           

CODE_13DC3C:        REP   #$20                  
                    TXA                         
                    AND.w #$00FF                
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    TAX                         
                    LDY.b #$00                  
CODE_13DC4A:        LDA.l DATA_14B8DC,x             
                    STA.w $0CA0,y               
                    INX                         
                    INX                         
                    INY                         
                    INY                         
                    CPY.b #$20                  
                    BNE   CODE_13DC4A           
                    SEP   #$20                  
                    BRL   CODE_13DEDC           

CODE_13DC5E:        REP   #$20                  
                    LDX.b #$00                  
CODE_13DC62:        LDA.l DATA_15E715,x             
                    STA.w $0B00,x               
                    LDA.l DATA_15E735,x             
                    STA.w $0B20,x               
                    LDA.l DATA_15E775,x             
                    STA.w $0B60,x               
                    LDA.l DATA_15E795,x             
                    STA.w $0B80,x               
                    LDA.l DATA_15E7B5,x             
                    STA.w $0BA0,x               
                    LDA.l DATA_15E7D5,x             
                    STA.w $0BC0,x               
                    LDA.l DATA_15E7F5,x             
                    STA.w $0BE0,x               
                    INX                         
                    INX                         
                    CPX.b #$20                  
                    BNE   CODE_13DC62           
                    LDX.b #$00                  
CODE_13DC9B:        LDA.l DATA_15E815,x             
                    STA.w $0B40,x               
                    INX                         
                    INX                         
                    CPX.b #$20                  
                    BNE   CODE_13DC9B           
                    SEP   #$20                  
                    BRL   CODE_13DEDC           

                    REP   #$20                  
                    LDX.b #$00                  
CODE_13DCB1:        LDA.w DATA_11C9EC,x               
                    STA.w $0B00,x               
                    INX                         
                    INX                         
                    CPX.b #$08                  
                    BCC   CODE_13DCB1           
                    SEP   #$20                  
                    BRL   CODE_13DEDC           

CODE_13DCC2:        PHX                         
                    REP   #$20                  
                    LDX.b #$00                  
CODE_13DCC7:        LDA.l DATA_14BAE0,x             
                    STA.w $0CA0,x               
                    INX                         
                    INX                         
                    CPX.b #$20                  
                    BNE   CODE_13DCC7           
                    SEP   #$20                  
                    PLX                         
                    BRL   CODE_13DEDC           

DATA_13DCDA:        db $00,$00,$00,$00,$00,$00,$60,$00
                    db $00,$00,$00,$00,$C0,$00

DATA_13DCE8:        db $51,$7F,$40,$49,$51,$7F,$F5,$7E
                    db $51,$7F,$40,$49,$F5,$7E

CODE_13DCF6:        REP   #$30                ; Accumulator and Index = 16-bit.
                    LDA.w $0635               ; \ Get world number * 2 into index.
                    AND.w #$000F              ;  |
                    ASL   A                   ;  |
                    TAX                       ; /
                    LDA.l DATA_13DCE8,x         ; \ Get BG colour for the 'World x-x' screen.  
                    STA.w $0B00               ; /
                    LDA.l DATA_13DCDA,x         ; \ Get index for different palette set.     
                    TAX                       ; /
                    LDY.w #$0000              ; \ Y = #$0000.
CODE_13DD0F:        LDA.l DATA_15F555,x         ;  | Load colours into palette 1.
                    STA.w $0B20,y             ;  |
                    LDA.l DATA_15F575,x         ;  | Load colours into palette 2. 
                    STA.w $0B40,y             ;  |
                    LDA.l DATA_15F595,x         ;  | Load colours into palette 7. 
                    STA.w $0BE0,y             ; /
                    INX                       ; \ Get to next colours.
                    INX                       ;  |
                    INY                       ;  |
                    INY                       ;  |
                    CPY.w #$0020              ;  | Check if full palette has been uploaded.
                    BNE   CODE_13DD0F         ; / If not, loop.
                    LDA.w #$7FFF              ; \ Palette 3 colours D-F = white.
                    STA.w $0B7A               ;  |
                    STA.w $0B7C               ;  |
                    STA.w $0B7E               ; /
                    LDA.w #$2896              ; \ Palette 5 colour 9-B = pink-ish colours.
                    STA.w $0BB2               ;  |
                    LDA.w #$495F              ;  |
                    STA.w $0BB4               ;  |
                    LDA.w #$6E9F              ;  |
                    STA.w $0BB6               ; /
                    SEP   #$30                ; Accumulator and Index = 8-bit.
                    BRL   CODE_13DEDC           

CODE_13DD50:        LDA.w $0533                 
                    CMP.b #$11                  
                    BNE   CODE_13DD62           
                    LDA.w $0534                 
                    CMP.b #$03                  
                    BEQ   CODE_13DD8D           
                    CMP.b #$04                  
                    BEQ   CODE_13DD8D           
CODE_13DD62:        LDA.w $0533                 
                    CMP.b #$13                  
                    BNE   CODE_13DD70           
                    LDA.w $0534                 
                    CMP.b #$05                  
                    BEQ   CODE_13DD8D           
CODE_13DD70:        REP   #$20                  
                    LDX.b #$00                  
CODE_13DD74:        LDA.l DATA_14B9BC,x             
                    STA.w $0B00,x               
                    LDA.l DATA_14B9CC,x             
                    STA.w $0B10,x               
                    INX                         
                    INX                         
                    CPX.b #$10                  
                    BNE   CODE_13DD74           
                    SEP   #$20                  
                    BRL   CODE_13DEDC           

CODE_13DD8D:        RTL                         

CODE_13DD8E:        REP   #$20                  
                    LDX.b #$00                  
CODE_13DD92:        LDA.l DATA_14BB00,x             
                    STA.w $0B00,x               
                    LDA.l DATA_14BB20,x             
                    STA.w $0B20,x               
                    LDA.l DATA_14BB40,x             
                    STA.w $0B40,x               
                    LDA.l DATA_14BB60,x             
                    STA.w $0B60,x               
                    LDA.l DATA_14BB80,x             
                    STA.w $0B80,x               
                    LDA.l DATA_14BBA0,x             
                    STA.w $0BA0,x               
                    LDA.l DATA_14BBC0,x             
                    STA.w $0BC0,x               
                    LDA.l DATA_14BBE0,x             
                    STA.w $0BE0,x               
                    LDA.l DATA_14BC00,x             
                    STA.w $0C00,x               
                    LDA.l DATA_14BC20,x             
                    STA.w $0C20,x               
                    LDA.l DATA_14BC40,x             
                    STA.w $0C40,x               
                    LDA.l DATA_14BC60,x             
                    STA.w $0C60,x               
                    LDA.l DATA_14BC80,x             
                    STA.w $0C80,x               
                    LDA.l DATA_14BCA0,x             
                    STA.w $0CA0,x               
                    LDA.l DATA_14BCC0,x             
                    STA.w $0CC0,x               
                    LDA.l DATA_14BCE0,x             
                    STA.w $0CE0,x               
                    INX                         
                    INX                         
                    CPX.b #$20                  
                    BNE   CODE_13DD92           
                    SEP   #$20                  
                    BRL   CODE_13DEDC           

CODE_13DE0D:        REP   #$20                  
                    LDX.b #$00                  
CODE_13DE11:        LDA.l DATA_14BD00,x             
                    STA.w $0B00,x               
                    LDA.l DATA_14BD20,x             
                    STA.w $0B20,x               
                    LDA.l DATA_14BD40,x             
                    STA.w $0B40,x               
                    LDA.l DATA_14BD60,x             
                    STA.w $0B60,x               
                    LDA.l DATA_14BD80,x             
                    STA.w $0B80,x               
                    LDA.l DATA_14BDA0,x             
                    STA.w $0BA0,x               
                    LDA.l DATA_14BDC0,x             
                    STA.w $0BC0,x               
                    LDA.l DATA_14BDE0,x             
                    STA.w $0BE0,x               
                    LDA.l DATA_14BE00,x             
                    STA.w $0C00,x               
                    LDA.l DATA_14BE20,x             
                    STA.w $0C20,x               
                    LDA.l DATA_14BE40,x             
                    STA.w $0C40,x               
                    LDA.l DATA_14BE60,x             
                    STA.w $0C60,x               
                    LDA.l DATA_14BE80,x             
                    STA.w $0C80,x               
                    LDA.l DATA_14BEA0,x             
                    STA.w $0CA0,x               
                    LDA.l DATA_14BEC0,x             
                    STA.w $0CC0,x               
                    LDA.l DATA_14BEE0,x             
                    STA.w $0CE0,x               
                    INX                         
                    INX                         
                    CPX.b #$20                  
                    BNE   CODE_13DE11           
                    SEP   #$20                  
                    BRL   CODE_13DEDC           

CODE_13DE8C:        REP   #$20                  
                    LDX.b #$00                  
CODE_13DE90:        LDA.l DATA_15E715,x             
                    STA.w $0B00,x               
                    LDA.l DATA_15E735,x             
                    STA.w $0B20,x               
                    LDA.l DATA_15E755,x             
                    STA.w $0B40,x               
                    LDA.l DATA_15E775,x             
                    STA.w $0B60,x               
                    LDA.l DATA_15E795,x             
                    STA.w $0B80,x               
                    LDA.l DATA_15E7B5,x             
                    STA.w $0BA0,x               
                    LDA.l DATA_15E7D5,x             
                    STA.w $0BC0,x               
                    LDA.l DATA_15E7F5,x             
                    STA.w $0BE0,x               
                    INX                         
                    INX                         
                    CPX.b #$20                  
                    BNE   CODE_13DE90           
                    LDX.b #$7E                  
CODE_13DED0:        LDA.w DATA_11BB1C,x               
                    STA.w $0C20,x               
                    DEX                         
                    DEX                         
                    BPL   CODE_13DED0           
                    SEP   #$20                  
CODE_13DEDC:        LDA.b #$01                  
                    STA.w $02A9                 
                    RTL                         

CODE_13DEE2:        LDA.b #$81                  
                    STA.w $0239                 
                    LDA.b #$38                  
                    STA.w $023D                 
                    LDA.b #$52                  
                    STA.w $023E                 
                    LDA.b #$80                  
                    STA.w $023F                 
                    REP   #$20                  
                    LDA.w #$3D25                
                    STA.w $0B00                 
                    SEP   #$20                  
                    BRA   CODE_13DEDC           

PNTR_13DF02:        dl $0012D0
                    dl DATA_13DF0E
                    dl DATA_13DF2E
                    dl DATA_13DF4E

DATA_13DF0E:        db $BC,$45,$D6,$5A,$4A,$29,$FF,$3A
                    db $D8,$01,$3F,$02,$BF,$3A,$9C,$2D
                    db $00,$00,$2F,$15,$5A,$7F,$06,$33
                    db $8A,$43,$3F,$02,$D8,$01,$18,$7F

DATA_13DF2E:        db $BC,$45,$FF,$7F,$A5,$14,$92,$00
                    db $98,$00,$9F,$00,$9C,$2D,$BF,$3A
                    db $00,$00,$2F,$15,$95,$2C,$3A,$41
                    db $DF,$55,$AF,$76,$4A,$66,$A6,$51

DATA_13DF4E:        db $BC,$45,$D6,$5A,$4A,$29,$FF,$3A
                    db $3A,$41,$DF,$55,$BF,$3A,$9C,$2D
                    db $00,$00,$2F,$15,$5A,$7F,$D9,$14
                    db $7F,$21,$1F,$03,$7A,$02,$18,$7F

CODE_13DF6E:        REP   #$20                  
                    LDY.w $04E1                 
                    LDA.b $50                   
                    AND.w #$00FF                
                    CMP.w #$0008                
                    BNE   CODE_13DF7F           
                    LDY.b $82                   
CODE_13DF7F:        LDA.b $10                   
                    LSR   A                     
                    LSR   A                     
                    CPY.b #$18                  
                    BCS   CODE_13DF8F                   
                    CPY.b #$01                  
                    BNE   CODE_13DF8E           
                    LDA.w #$0000                
CODE_13DF8E:        LSR   A                     
CODE_13DF8F:        AND.w #$0003                
                    STA.b $00                   
                    ASL   A                     
                    CLC                         
                    ADC.b $00                   
                    TAX                         
                    LDA   PNTR_13DF02,x             
                    STA.b $00                   
                    LDA   PNTR_13DF02+2,x             
                    STA.b $02                   
                    LDY.b #$00                  
CODE_13DFA7:        LDA.b [$00],y               
                    STA.w $0C00,y               
                    INY                         
                    INY                         
                    CPY.b #$20                  
                    BNE   CODE_13DFA7           
                    SEP   #$20                  
                    BRL   CODE_13DEDC           

PNTR_13DFB7:        dl $0012D0
                    dl DATA_13DFE7
                    dl DATA_13E007
                    dl DATA_13DFE7
                    dl $0012D0
                    dl DATA_13E0A7
                    dl DATA_13E0C7
                    dl DATA_13E0A7
                    dl $0012D0
                    dl DATA_13E067
                    dl DATA_13E087
                    dl DATA_13E067
                    dl $0012D0
                    dl DATA_13E027
                    dl DATA_13E047
                    dl DATA_13E027

DATA_13DFE7:        db $BC,$45,$FF,$7F,$6B,$2D,$18,$23
                    db $DA,$11,$3E,$1B,$9C,$2D,$BF,$3A
                    db $00,$00,$D4,$29,$EC,$56,$C6,$45
                    db $EC,$56,$DC,$14,$96,$10,$1A,$15

DATA_13E007:        db $BC,$45,$FF,$7F,$10,$42,$FF,$3F
                    db $DA,$11,$3E,$1B,$9C,$2D,$BF,$3A
                    db $00,$00,$79,$3E,$91,$6B,$C6,$45
                    db $EC,$56,$DC,$14,$96,$10,$BF,$29

DATA_13E027:        db $24,$49,$FF,$7F,$6B,$2D,$18,$23
                    db $DA,$11,$3E,$1B,$9C,$2D,$BF,$3A
                    db $00,$00,$D4,$29,$35,$66,$6F,$6D
                    db $56,$7E,$92,$5B,$AB,$42,$30,$4F

DATA_13E047:        db $24,$49,$FF,$7F,$10,$42,$FF,$3F
                    db $DA,$11,$3E,$1B,$9C,$2D,$BF,$3A
                    db $00,$00,$79,$3E,$FB,$7E,$6F,$6D
                    db $56,$7E,$92,$5B,$AB,$42,$F6,$67

DATA_13E067:        db $BC,$45,$FF,$7F,$CE,$39,$8D,$62
                    db $E8,$69,$CF,$7E,$9C,$2D,$BF,$3A
                    db $00,$00,$D4,$29,$B9,$36,$7B,$2A
                    db $5F,$4B,$1F,$19,$D9,$18,$BC,$29

DATA_13E087:        db $BC,$45,$FF,$7F,$94,$52,$74,$7F
                    db $E8,$69,$CF,$7E,$9C,$2D,$BF,$3A
                    db $00,$00,$79,$3E,$7F,$4F,$7B,$2A
                    db $5F,$4B,$1F,$19,$D9,$18,$7F,$42

DATA_13E0A7:        db $24,$49,$FF,$7F,$6B,$2D,$3F,$12
                    db $DA,$11,$3E,$1B,$9C,$2D,$BF,$3A
                    db $00,$00,$57,$0C,$BA,$02,$59,$02
                    db $1F,$1F,$9F,$6E,$5F,$49,$D9,$51

DATA_13E0C7:        db $24,$49,$FF,$7F,$10,$42,$9F,$2F
                    db $DA,$11,$3E,$1B,$9C,$2D,$BF,$3A
                    db $00,$00,$57,$0C,$FF,$5B,$59,$02
                    db $1F,$1F,$9F,$6E,$5F,$49,$BF,$6E

CODE_13E0E7:        LDA.w $04CB                 
                    CMP.b #$3C                  
                    BCS   CODE_13E0FB                   
                    LDA.w $0D0A                 
                    BEQ   CODE_13E0FA           
                    STZ.w $0D0A                 
                    STZ.b $0C                   
                    BRA   CODE_13E107           

CODE_13E0FA:        RTL                         

CODE_13E0FB:        LDA.b #$01                  
                    STA.w $0D0A                 
                    LDA.b $10                   
                    AND.b #$06                  
                    LSR   A                     
                    STA.b $0C                   
CODE_13E107:        LDA.b $8F                   
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.b $0C                   
                    STA.b $0C                   
                    ASL   A                     
                    CLC                         
                    ADC.b $0C                   
                    TAX                         
                    LDA   PNTR_13DFB7+2,x             
                    STA.b $0E                   
                    REP   #$20                  
                    LDA   PNTR_13DFB7,x             
                    STA.b $0C                   
                    LDY.b #$00                  
CODE_13E125:        LDA.b [$0C],y               
                    STA.w $0C00,y               
                    INY                         
                    INY                         
                    CPY.b #$20                  
                    BNE   CODE_13E125           
                    SEP   #$20                  
                    BRL   CODE_13DEDC           

DATA_13E135:        db $9C,$01,$18,$01,$D5,$00,$92,$00

DATA_13E13D:        db $1F,$33,$9B,$22,$17,$12,$93,$01

DATA_13E145:        db $1C,$00,$18,$00,$14,$00,$10,$00

DATA_13E14D:        db $00,$01,$03,$02,$01,$02,$03,$01
    
CODE_13E155:        LDA.w $077C
                    BEQ   CODE_13E192
                    INC.w $077D                 
                    LDA.w $077D                 
                    CMP.b #$04                  
                    BCC   CODE_13E16A           
                    STZ.w $077D                 
                    INC.w $077E                 
CODE_13E16A:        LDA.w $077E                 
                    AND.b #$07                  
                    TAX                         
                    LDA.l DATA_13E14D,x             
                    ASL   A                     
                    TAX                         
                    REP   #$20                  
                    LDA.l DATA_13E135,x             
                    STA.w $0B2C                 
                    LDA.l DATA_13E13D,x             
                    STA.w $0B2E                 
                    LDA.l DATA_13E145,x             
                    STA.w $0B38                 
                    SEP   #$20                  
                    BRL   CODE_13DEDC           

CODE_13E192:        RTL                         

DATA_13E193:        db $35,$08

DATA_13E195:        db $AC,$04

DATA_13E197:        db $49,$04,$BF,$10,$37,$08,$B0,$04
                    db $DF,$39,$BF,$10,$37,$08,$3F,$67
                    db $DF,$39,$BF,$10,$61,$04,$61,$04
                    db $61,$04

DATA_13E1B1:        db $1A,$07,$06,$07,$14,$07,$06,$07

CODE_13E1B9:        LDA.w $077F
                    BNE   CODE_13E1C2
                    STZ.w $0780                 
                    RTL                         

CODE_13E1C2:        LDA.b $9C                   
                    BEQ   CODE_13E20E           
                    LDX.w $042D                 
                    LDA.b $90,x                 
                    CMP.b #$3D                  
                    BNE   CODE_13E20E           
                    INC.w $0781                 
                    LDA.w $0780                 
                    AND.b #$07                  
                    TAX                         
                    LDA.l DATA_13E1B1,x             
                    CMP.w $0781                 
                    BNE   CODE_13E1F5           
                    INC.w $0780                 
                    LDA.w $0780                 
                    AND.b #$07                  
                    CMP.b #$01                  
                    BNE   CODE_13E1F2           
                    LDA.b #$42                  
                    STA.w $1DE3                 
CODE_13E1F2:        STZ.w $0781                 
CODE_13E1F5:        LDA.w $0780                 
                    AND.b #$07                  
                    BEQ   CODE_13E23D           
                    DEC   A                     
                    CMP.b #$04                  
                    BCC   CODE_13E204           
                    EOR.b #$07                  
                    DEC   A                     
CODE_13E204:        ASL   A                     
                    STA.b $00                   
                    ASL   A                     
                    CLC                         
                    ADC.b $00                   
                    TAX                         
                    BRA   CODE_13E23F           

CODE_13E20E:        LDA.w $0780                 
                    AND.b #$07                  
                    BEQ   CODE_13E238           
                    INC.w $0781                 
                    TAX                         
                    LDA.l DATA_13E1B1,x             
                    CMP.w $0781                 
                    BNE   CODE_13E1F5           
                    STZ.w $0781                 
                    LDA.w $0780                 
                    AND.b #$07                  
                    CMP.b #$04                  
                    BCS   CODE_13E233                   
                    DEC.w $0780                 
                    BRA   CODE_13E1F5           

CODE_13E233:        INC.w $0780                 
                    BRA   CODE_13E1F5           

CODE_13E238:        LDA.b #$FF                  
                    STA.w $0781                 
CODE_13E23D:        LDX.b #$18                  
CODE_13E23F:        REP   #$20                  
                    LDA.l DATA_13E193,x             
                    STA.w $0BE6                 
                    LDA.l DATA_13E195,x             
                    STA.w $0BE8                 
                    LDA.l DATA_13E197,x             
                    STA.w $0BEA                 
                    SEP   #$20                  
                    BRL   CODE_13DEDC           

CODE_13E25B:        REP   #$20                  
                    STZ.w $0B00                 
                    LDX.b #$00                  
CODE_13E262:        LDA.l DATA_14BFA0,x             
                    STA.w $0B20,x               
                    LDA.l DATA_14BFC0,x             
                    STA.w $0B80,x               
                    LDA.l DATA_14BFE0,x             
                    STA.w $0BE0,x               
                    INX                         
                    INX                         
                    CPX.b #$20                  
                    BNE   CODE_13E262           
                    SEP   #$20                  
                    BRL   CODE_13DEDC           

DATA_13E282:        db $FA,$7F,$F8,$7F,$D7,$7F,$D7,$7F
                    db $B5,$7F,$95,$7F,$53,$7F,$32,$7F
                    db $53,$7F,$95,$7F,$CF,$72,$AE,$6E
                    db $CF,$72,$F0,$76,$11,$7B,$FA,$7F
                    db $F9,$7F,$F7,$7F,$D7,$7F,$B5,$7F
                    db $B6,$7F,$95,$7F,$53,$7F,$32,$7F
                    db $53,$7F,$F0,$76,$CF,$72,$AE,$6E
                    db $CF,$72,$F0,$76,$FB,$7F,$FA,$7F
                    db $F8,$7F,$D7,$7F,$B5,$7F,$D6,$7F
                    db $B5,$7F,$74,$7F,$52,$7F,$52,$7F
                    db $11,$7B,$F0,$76,$CF,$72,$AE,$6E
                    db $CF,$72,$FB,$7F,$FA,$7F,$F8,$7F
                    db $D7,$7F,$B5,$7F,$D7,$7F,$B6,$7F
                    db $95,$7F,$53,$7F,$32,$7F,$11,$7F
                    db $11,$77,$F0,$72,$CF,$6E,$AE,$72
                    db $FB,$7F,$FA,$7F,$F8,$7F,$D7,$7F
                    db $B5,$7F,$D7,$7F,$B6,$7F,$95,$7F
                    db $53,$7F,$32,$7F,$32,$7F,$11,$7B
                    db $F0,$76,$CF,$72,$AE,$6E,$FB,$7F
                    db $FA,$7F,$F8,$7F,$D7,$7F,$B5,$7F
                    db $D7,$7F,$B6,$7F,$95,$7F,$53,$7F
                    db $32,$7F,$32,$7F,$11,$7B,$F0,$76
                    db $CF,$72,$AE,$6E,$FA,$7F,$FB,$7F
                    db $FA,$7F,$F8,$7F,$B5,$7F,$D7,$7F
                    db $B6,$7F,$95,$7F,$53,$7F,$32,$7F
                    db $32,$7F,$11,$7B,$F0,$76,$CF,$72
                    db $AE,$6E,$F8,$7F,$FA,$7F,$FB,$7F
                    db $FA,$7F,$B5,$7F,$B6,$7F,$D7,$7F
                    db $B6,$7F,$95,$7F,$53,$7F,$32,$7F
                    db $11,$7B,$F0,$76,$CF,$72,$AE,$6E
                    db $D7,$7F,$F8,$7F,$FA,$7F,$FB,$7F
                    db $B5,$7F,$95,$7F,$B6,$7F,$D7,$7F
                    db $B6,$7F,$95,$7F,$11,$7B,$32,$7F
                    db $11,$7B,$F0,$76,$CF,$72,$D7,$7F
                    db $D7,$7F,$F8,$7F,$FA,$7F,$B5,$7F
                    db $53,$7F,$95,$7F,$B6,$7F,$D7,$7F
                    db $B6,$7F,$F0,$76,$11,$7B,$32,$7F
                    db $11,$7B,$F0,$76,$D7,$7F,$D7,$7F
                    db $D7,$7F,$F8,$7F,$B5,$7F,$32,$7F
                    db $53,$7F,$95,$7F,$B6,$7F,$D7,$7F
                    db $CF,$72,$F0,$76,$11,$7B,$32,$7F
                    db $11,$7B,$F8,$7F,$D7,$7F,$D7,$7F
                    db $D7,$7F,$B5,$7F,$53,$7F,$32,$7F
                    db $53,$7F,$95,$7F,$B6,$7F,$AE,$6E
                    db $CF,$72,$F0,$76,$11,$7B,$32,$7F
   
DATA_13E3EA:        db $00,$00,$1E,$00,$3C,$00,$5A,$00
                    db $78,$00,$96,$00,$B4,$00,$D2,$00
                    db $F0,$00,$0E,$01,$2C,$01,$4A,$01      

CODE_13E402:        LDA.w $0784       
                    BEQ   CODE_13E448           
                    INC.w $0785                 
                    LDA.w $0785                 
                    CMP.b #$06                  
                    BCC   CODE_13E421           
                    STZ.w $0785                 
                    INC.w $0786                 
                    LDA.w $0786                 
                    CMP.b #$0C                  
                    BNE   CODE_13E421           
                    STZ.w $0786                 
CODE_13E421:        REP   #$30                  
                    LDA.w $0786                 
                    AND.w #$00FF                
                    ASL   A                     
                    TAX                         
                    LDA.l DATA_13E3EA,x             
                    TAX                         
                    LDY.w #$0000                
CODE_13E433:        LDA.l DATA_13E282,x             
                    STA.w $0B22,y               
                    INX                         
                    INX                         
                    INY                         
                    INY                         
                    CPY.w #$001E                
                    BNE   CODE_13E433           
                    SEP   #$30                  
                    BRL   CODE_13DEDC           

CODE_13E448:        RTL                         

DATA_13E449:        db $04,$0F,$11,$11,$0F,$04,$05

DATA_13E450:        db $01,$00,$03,$04,$06,$04,$04

CODE_13E457:        LDX.b #$06                  
CODE_13E459:        LDA.w $0533                 
                    CMP   DATA_13E449,x             
                    BNE   CODE_13E46B           
                    LDA.w $0534                 
                    CMP   DATA_13E450,x             
                    BEQ   CODE_13E485           
CODE_13E46B:        DEX                         
                    BPL   CODE_13E459           
                    LDA.w $0533                 
                    CMP.b #$0F                  
                    BNE   CODE_13E484           
                    LDA.w $0534                 
                    CMP.b #$04                  
                    BNE   CODE_13E484           
                    LDA.w $051B                 
                    BNE   CODE_13E484           
                    JSR.w CODE_13E49D           
CODE_13E484:        RTL                         

CODE_13E485:        JSR.w CODE_13E489           
                    RTL                         

CODE_13E489:        TXA                         
                    ASL   A                     
                    TAX                         
                    JMP.w (PNTR_13E48F,x)

PNTR_13E48F:        dw CODE_13E49D
                    dw CODE_13E49D
                    dw CODE_13E4B8
                    dw CODE_13E4B8
                    dw CODE_13E49D
                    dw CODE_13E49D
                    dw CODE_13E4CC
                    
CODE_13E49D:        REP   #$20           
                    LDX.b #$00
CODE_13E4A1:        LDA.l DATA_14BF00,x             
                    STA.w $0B20,x               
                    LDA.l DATA_14BF20,x             
                    STA.w $0BE0,x               
                    INX                         
                    INX                         
                    CPX.b #$20                  
                    BNE   CODE_13E4A1           
                    SEP   #$20                  
                    RTS                         

CODE_13E4B8:        REP   #$20                  
                    LDX.b #$00                  
CODE_13E4BC:        LDA.l DATA_14BF40,x             
                    STA.w $0BE0,x               
                    INX                         
                    INX                         
                    CPX.b #$20                  
                    BNE   CODE_13E4BC           
                    SEP   #$20                  
                    RTS                         

CODE_13E4CC:        REP   #$20                  
                    LDX.b #$00                  
CODE_13E4D0:        LDA.l DATA_14BF60,x             
                    STA.w $0BE0,x               
                    INX                         
                    INX                         
                    CPX.b #$20                  
                    BNE   CODE_13E4D0           
                    SEP   #$20                  
                    RTS                         

DATA_13E4E0:        db $7F,$77

DATA_13E4E2:        db $E7,$34

DATA_13E4E4:        db $E7,$34

DATA_13E4E6:        db $E7,$34,$97,$5E,$09,$25,$2E,$29
                    db $EF,$35,$AF,$49,$2B,$15,$75,$1D
                    db $F7,$32,$E7,$34,$97,$0A,$3C,$13
                    db $DF,$2F

CODE_13E500:        LDA.w $0791               
                    BNE   CODE_13E506           
                    RTL                         

CODE_13E506:        PHB                         
                    PHK                         
                    PLB                         
                    LDA.b $10                   
                    AND.b #$38                  
                    CMP.b #$20                  
                    BCC   CODE_13E515           
                    AND.b #$18                  
                    EOR.b #$18                  
CODE_13E515:        TAY                         
                    REP   #$20                  
                    LDA   DATA_13E4E0,y               
                    STA.w $0B38                 
                    LDA   DATA_13E4E2,y               
                    STA.w $0B3A                 
                    LDA   DATA_13E4E4,y               
                    STA.w $0B3C                 
                    LDA   DATA_13E4E6,y               
                    STA.w $0B3E                 
                    SEP   #$20                  
                    PLB                         
                    BRL   CODE_13DEDC           

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
                    db $FF,$FF                              ; /

CODE_13E700:        LDA.b #$80
                    BEQ   CODE_13E706           
CODE_13E704:        LDA.b #$0F                  
CODE_13E706:        STA.b $FE                   
CODE_13E708:        LDA.b $11                   
                    ASL   A                     
                    TAX                         
                    LDA.w PNTR_11BDA6,x               
                    STA.b $F0                   
                    LDA.w PNTR_11BDA6+1,x               
                    STA.b $F1                   
                    LDA.b #$11                  
                    STA.b $F2                   
                    STZ.w $0154                 
CODE_13E71D:        LDA.w $0154                 
                    BPL   CODE_13E71D           
                    JSL.l CODE_14FA99           
                    CLI                         
                    RTS                         

CODE_13E728:        LDA.b #$B0                  
                    BRA   CODE_13E72E           

                    LDA.b #$30                  
CODE_13E72E:        STA.b $FF                   
                    RTS                         

CODE_13E731:        JSR.w CODE_13E700           
                    JSL.l CODE_14F953           
                    LDA.b #$40                  
                    STA.w $0100                 
                    JSR.w CODE_13E728           
                    JSR.w CODE_13E708           
                    LDA.b #$01                  
                    STA.b $11                   
                    JSR.w CODE_13E708           
                    JSL.l CODE_13DE0D           
                    LDA.b #$10                  
                    STA.b $18                   
                    LDA.b #$04                  
                    STA.b $14                   
                    STZ.b $FE                   
                    STZ.b $17                   
                    STZ.b $15                   
                    LDA.b #$20                  
                    STA.w $0239                 
                    LDA.b #$70                  
                    STA.w $023A                 
                    LDA.b #$01                  
                    JSL.l CODE_14FAE8           
CODE_13E76C:        LDA.b #$0D                  
                    STA.b $16                   
                    STZ.b $15                   
                    JSL.l CODE_138CCE           
                    LDA.b #$01                  
                    STA.w $025E                 
CODE_13E77B:        LDY.b $15                   
                    LDA   DATA_11C1A3,y               
                    STA.w $0210                 
CODE_13E783:        DEC.b $18                   
                    BPL   CODE_13E78D           
                    LDA.b #$10                  
                    STA.b $18                   
                    INC.b $17                   
CODE_13E78D:        JSR.w CODE_13E8A4           
                    LDA.b $E6                   
                    CMP.b #$05                  
                    BEQ   CODE_13E79F           
                    JSL.l CODE_129539           
                    JSR.w CODE_13E708           
                    BRA   CODE_13E7A2           

CODE_13E79F:        JSR.w CODE_13E704           
CODE_13E7A2:        DEC.w $0210                 
                    BPL   CODE_13E783           
                    INC.b $15                   
                    DEC.b $16                   
                    BPL   CODE_13E77B           
                    DEC.b $14                   
                    BMI   CODE_13E7B4           
                    JMP.w CODE_13E76C           

CODE_13E7B4:        DEC.b $E6                   
                    LDA.b #$03                  
                    STA.b $11                   
                    JSL.l CODE_14F9F0         ; Clear all OAM.
                    JSR.w CODE_13E708           
                    LDA.b #$04                  
                    STA.b $11                   
                    JSR.w CODE_13E708           
                    LDA.b #$05                  
                    STA.b $11                   
                    JSR.w CODE_13E708           
                    LDA.b #$06                  
                    STA.b $11                   
                    JSR.w CODE_13E708           
                    LDA.b #$07                  
                    STA.b $11                   
                    JSR.w CODE_13E708           
                    LDA.b #$08                  
                    STA.b $11                   
                    REP   #$20                  
                    LDA.w #$4480                
                    STA.w $0C42                 
                    SEP   #$20                  
                    LDA.b #$01                  
                    STA.w $02A9                 
                    JSR.w CODE_13E708           
                    STZ.b $15                   
                    LDA.b #$06                  
                    STA.b $16                   
                    STZ.b $14                   
                    LDA.b #$02                  
                    STA.w $025E                 
                    JSL.l CODE_138CCE           
                    JSR.w CODE_13E704           
CODE_13E807:        LDY.b $15                   
                    LDA   DATA_11C1C6,y               
                    STA.w $06C3                 
                    CLC                         
                    ADC.b #$02                  
                    STA.w $06C4                 
                    LDA   DATA_11C1B1,y               
                    STA.b $10                   
CODE_13E81A:        JSR.w CODE_13E708           
                    DEC.b $10                   
                    BPL   CODE_13E81A           
                    INC.b $15                   
                    DEC.b $16                   
                    BPL   CODE_13E807           
                    LDA.b #$10                  
                    STA.b $18                   
                    LDA.b #$01                  
                    STA.b $14                   
CODE_13E82F:        STZ.b $15                   
                    LDA.b #$0D                  
                    STA.b $16                   
                    LDA.b #$01                  
                    STA.w $025E                 
                    JSL.l CODE_138CCE           
                    JSR.w CODE_13E704           
CODE_13E841:        LDY.b $15                   
                    LDA   DATA_11C1A3,y               
                    STA.b $10                   
CODE_13E848:        JSR.w CODE_13E708           
                    DEC.b $10                   
                    BPL   CODE_13E848           
                    INC.b $15                   
                    DEC.b $16                   
                    BPL   CODE_13E841           
                    DEC.b $14                   
                    BMI   CODE_13E85C           
                    JMP.w CODE_13E82F           

CODE_13E85C:        JSR.w CODE_13E94B           
                    JSR.w CODE_13E708           
                    STZ.w $079F                 
                    STZ.w $07A0                 
                    LDA.b #$B0                  
                    STA.w $07A1                 
CODE_13E86D:        STZ.b $15                   
                    LDA.b #$0D                  
                    STA.b $16                   
                    JSL.l CODE_138CCE           
                    JSR.w CODE_13E704           
CODE_13E87A:        LDY.b $15                   
                    LDA   DATA_11C1B8,y               
                    STA.w $06C3                 
                    CLC                         
                    ADC.b #$02                  
                    STA.w $06C4                 
                    LDA   DATA_11C1A3,y               
                    STA.b $10                   
CODE_13E88D:        JSR.w CODE_13E907           
                    JSR.w CODE_13E708           
                    JSL.l CODE_14DB62           
                    DEC.b $10                   
                    BPL   CODE_13E88D           
                    INC.b $15                   
                    DEC.b $16                   
                    BPL   CODE_13E87A           
                    JMP.w CODE_13E86D           

CODE_13E8A4:        LDY.b #$1F                  
                    LDA.b $17                   
                    AND.b #$01                  
                    BNE   CODE_13E8B7           
CODE_13E8AC:        LDA   DATA_11C133,y               
                    STA.w $0800,y               
                    DEY                         
                    BPL   CODE_13E8AC           
                    BRA   CODE_13E8C0           

CODE_13E8B7:        LDA   DATA_11C153,y               
                    STA.w $0800,y               
                    DEY                         
                    BPL   CODE_13E8B7           
CODE_13E8C0:        LDY.b #$17                  
                    LDA.b $17                   
                    AND.b #$01                  
                    BNE   CODE_13E8D3           
CODE_13E8C8:        LDA   DATA_11C173,y               
                    STA.w $0820,y               
                    DEY                         
                    BPL   CODE_13E8C8           
                    BRA   CODE_13E8DC           

CODE_13E8D3:        LDA   DATA_11C18B,y               
                    STA.w $0820,y               
                    DEY                         
                    BPL   CODE_13E8D3           
CODE_13E8DC:        STZ.w $0A20                 
                    STZ.w $0A21                 
                    STZ.w $0A22                 
                    STZ.w $0A23                 
                    STZ.w $0A24                 
                    STZ.w $0A25                 
                    STZ.w $0A26                 
                    STZ.w $0A27                 
                    STZ.w $0A28                 
                    STZ.w $0A29                 
                    STZ.w $0A2A                 
                    STZ.w $0A2B                 
                    STZ.w $0A2C                 
                    STZ.w $0A2D                 
                    RTS                         

CODE_13E907:        INC.b $2E                   
                    LDA.b $2E                   
                    AND.b #$01                  
                    BNE   CODE_13E915           
                    DEC.b $39                   
                    DEC.b $3A                   
                    DEC.b $3B                   
CODE_13E915:        LDA.b $29                   
                    JSL.l CODE_118776           

                    dw CODE_13E982
                    dw CODE_13E9BD
                    dw CODE_13E9CC
                    dw CODE_13E9FF
                    dw CODE_13ED40
                    dw CODE_13ED94
                    dw CODE_13EE41
                    dw CODE_13EE91
                    dw CODE_13EEBC
                    dw CODE_13EED7
                    dw CODE_13EEED
      
                    RTS                         

CODE_13E932:        PHX                         
                    LDX.b $2B                   
                    LDA.l DATA_14C5BD,x             
                    STA.b $2F                   
                    LDA.l DATA_14C5A0,x             
                    STA.b $30                   
                    LDA.l DATA_14C583,x             
                    STA.b $31                   
                    INC.b $2B                   
                    PLX                         
                    RTS                         

CODE_13E94B:        LDX.b #$0F                  
CODE_13E94D:        LDA.l DATA_14C564,x             
                    STA.w $0840,x               
                    DEX                         
                    BPL   CODE_13E94D           
                    LDA.b #$00                  
                    STA.w $0A30                 
                    STA.w $0A31                 
                    STA.w $0A32                 
                    STA.w $0A33                 
                    LDA.b #$02                  
                    STA.b $28                   
                    STZ.b $29                   
                    STZ.b $2A                   
                    LDY.b #$40                  
CODE_13E96F:        LDA.b #$27                  
                    STA.w $50,y               
                    DEY                         
                    BPL   CODE_13E96F           
                    RTS                         

DATA_13E978:        db $E0,$58,$40,$6D,$A0,$7D,$80,$7E
                    db $FF,$7F

CODE_13E982:        DEC.b $28
                    BPL   CODE_13E9BC           
                    LDA.b #$02                  
                    STA.b $28                   
                    INC.b $2A                   
                    LDA.b $2A                   
                    ASL   A                     
                    TAX                         
                    REP   #$20                  
                    LDA.l DATA_13E978,x             
                    STA.w $0C42                 
                    SEP   #$20                  
                    LDA.b #$01                  
                    STA.w $02A9                 
                    LDA.b $2A                   
                    CMP.b #$04                  
                    BNE   CODE_13E9BC           
                    INC.b $29                   
                    LDA.b #$80                  
                    STA.b $28                   
                    LDA.b #$60                  
                    STA.b $1F                   
                    LDA.b #$01                  
                    STA.b $35                   
                    STA.b $38                   
                    LDA.b #$00                  
                    STA.b $36                   
                    STA.b $37                   
CODE_13E9BC:        RTS                         

CODE_13E9BD:        DEC.b $28                   
                    BPL   CODE_13E9CB           
                    INC.b $29                   
                    STZ.b $2B                   
                    STZ.b $3F                   
                    LDA.b #$01                  
                    STA.b $3A                   
CODE_13E9CB:        RTS                         

CODE_13E9CC:        LDA.b $2E                   
                    AND.b #$01                  
                    BEQ   CODE_13E9FF           
                    LDA.b $1F                   
                    SEC                         
                    SBC.b #$01                  
                    STA.b $1F                   
                    STA.w $0841                 
                    STA.w $0845                 
                    STA.w $0849                 
                    STA.w $084D                 
                    LDA.b $1F                   
                    CMP.b #$10                  
                    BNE   CODE_13E9FF           
                    LDA.b #$F0                  
                    STA.w $0841                 
                    STA.w $0845                 
                    STA.w $0849                 
                    STA.w $084D                 
                    INC.b $29                   
                    STZ.b $38                   
                    STZ.b $35                   
CODE_13E9FF:        LDA.b $35                   
                    BNE   CODE_13EA6D           
                    LDA.b $39                   
                    BNE   CODE_13EA6D           
                    JSR.w CODE_13E932           
                    LDY.b #$2F                  
CODE_13EA0C:        LDA.b [$2F],y               
                    STA.w $0840,y               
                    LDA.b #$24                  
                    STA.w $0900,y               
                    DEY                         
                    LDA.b [$2F],y               
                    STA.w $0840,y               
                    LDA.b #$E9                  
                    STA.w $0900,y               
                    DEY                         
                    LDA.b [$2F],y               
                    STA.w $0840,y               
                    LDA.b #$F0                  
                    STA.w $0900,y               
                    DEY                         
                    LDA.b [$2F],y               
                    STA.w $0840,y               
                    DEY                         
                    BPL   CODE_13EA0C           
                    LDA.b #$02                  
                    STA.w $0A30                 
                    STA.w $0A31                 
                    STA.w $0A32                 
                    STA.w $0A33                 
                    LDA.b #$00                  
                    STA.w $0A34                 
                    STA.w $0A35                 
                    STA.w $0A36                 
                    STA.w $0A37                 
                    STA.w $0A38                 
                    STA.w $0A39                 
                    STA.w $0A3A                 
                    STA.w $0A3B                 
                    LDA.b #$01                  
                    STA.b $35                   
                    LDA.b #$C0                  
                    STA.b $1F                   
                    LDA.b #$D0                  
                    STA.b $20                   
                    LDA.b #$E8                  
                    STA.b $21                   
CODE_13EA6D:        LDA.b $36                   
                    BNE   CODE_13EABA           
                    LDA.b $3A                   
                    BNE   CODE_13EABA           
                    JSR.w CODE_13E932           
                    LDY.b #$2F                  
CODE_13EA7A:        LDA.b [$2F],y               
                    STA.w $0880,y               
                    DEY                         
                    BPL   CODE_13EA7A           
                    LDA.b #$02                  
                    STA.w $0A40                 
                    STA.w $0A41                 
                    STA.w $0A42                 
                    STA.w $0A43                 
                    LDA.b #$00                  
                    STA.w $0A44                 
                    STA.w $0A45                 
                    STA.w $0A46                 
                    STA.w $0A47                 
                    STA.w $0A48                 
                    STA.w $0A49                 
                    STA.w $0A4A                 
                    STA.w $0A4B                 
                    LDA.b #$01                  
                    STA.b $36                   
                    LDA.b #$C0                  
                    STA.b $22                   
                    LDA.b #$D0                  
                    STA.b $23                   
                    LDA.b #$E8                  
                    STA.b $24                   
CODE_13EABA:        LDA.b $37                   
                    BNE   CODE_13EB0F           
                    LDA.b $3B                   
                    BNE   CODE_13EB0F           
                    JSR.w CODE_13E932           
                    LDY.b #$2F                  
CODE_13EAC7:        LDA.b [$2F],y               
                    STA.w $08C0,y               
                    DEY                         
                    BPL   CODE_13EAC7           
                    LDA.b #$02                  
                    STA.w $0A50                 
                    STA.w $0A51                 
                    STA.w $0A52                 
                    STA.w $0A53                 
                    LDA.b #$00                  
                    STA.w $0A54                 
                    STA.w $0A55                 
                    STA.w $0A56                 
                    STA.w $0A57                 
                    STA.w $0A58                 
                    STA.w $0A59                 
                    STA.w $0A5A                 
                    STA.w $0A5B                 
                    LDA.b #$01                  
                    STA.b $37                   
                    LDA.b #$C0                  
                    STA.b $25                   
                    LDA.b #$D0                  
                    STA.b $26                   
                    LDY.b #$E8                  
                    LDA.b $2B                   
                    CMP.b #$1D                  
                    BNE   CODE_13EB0D           
                    LDY.b #$E0                  
CODE_13EB0D:        STY.b $27                   
CODE_13EB0F:        LDA.b $38                   
                    BEQ   CODE_13EB16           
                    JMP.w CODE_13EBC8           

CODE_13EB16:        LDA.b $2E                   
                    AND.b #$01                  
                    BNE   CODE_13EB1F           
                    JMP.w CODE_13EBC8           

CODE_13EB1F:        LDA.w $0901                 
                    CMP.b #$F0                  
                    BNE   CODE_13EB2D           
                    LDA.w $0841                 
                    CMP.b #$F0                  
                    BEQ   CODE_13EB4A           
CODE_13EB2D:        LDA.b $1F                   
                    SEC                         
                    SBC.b #$01                  
                    BNE   CODE_13EB36           
                    LDA.b #$F0                  
CODE_13EB36:        STA.b $1F                   
                    STA.w $0841                 
                    STA.w $0845                 
                    STA.w $0901                 
                    STA.w $0905                 
                    STA.w $0909                 
                    STA.w $090D                 
CODE_13EB4A:        LDA.w $0901                 
                    CMP.b #$F0                  
                    BNE   CODE_13EB58           
                    LDA.w $0849                 
                    CMP.b #$F0                  
                    BEQ   CODE_13EB84           
CODE_13EB58:        DEC.b $20                   
                    CMP.b #$F9                  
                    BNE   CODE_13EB64           
                    LDA.b $20                   
                    CMP.b #$C0                  
                    BNE   CODE_13EB84           
CODE_13EB64:        LDA.b $20                   
                    BNE   CODE_13EB72           
                    LDA.b $2B                   
                    CMP.b #$FF                  
                    BNE   CODE_13EB70           
                    INC.b $29                   
CODE_13EB70:        LDA.b #$F0                  
CODE_13EB72:        STA.w $0849                 
                    STA.w $084D                 
                    STA.w $0911                 
                    STA.w $0915                 
                    STA.w $0919                 
                    STA.w $091D                 
CODE_13EB84:        LDA.w $0851                 
                    CMP.b #$F0                  
                    BEQ   CODE_13EBC8           
                    DEC.b $21                   
                    CMP.b #$F9                  
                    BNE   CODE_13EB9E           
                    LDA.b $21                   
                    CMP.b #$C0                  
                    BNE   CODE_13EBC8           
                    LDY.b $2B                   
                    LDA.w $50,y               
                    STA.b $3A                   
CODE_13EB9E:        LDA.b $21                   
                    BNE   CODE_13EBB0           
                    STZ.b $35                   
                    LDA.b $2B                   
                    CMP.b #$FF                  
                    BNE   CODE_13EBAE           
                    LDA.b #$FF                  
                    STA.b $35                   
CODE_13EBAE:        LDA.b #$F0                  
CODE_13EBB0:        STA.w $0851                 
                    STA.w $0855                 
                    STA.w $0859                 
                    STA.w $085D                 
                    STA.w $0861                 
                    STA.w $0865                 
                    STA.w $0869                 
                    STA.w $086D                 
CODE_13EBC8:        LDA.b $2E                   
                    AND.b #$01                  
                    BNE   CODE_13EBD1           
                    JMP.w CODE_13EC4E           

CODE_13EBD1:        LDA.w $0881                 
                    CMP.b #$F0                  
                    BEQ   CODE_13EBE9           
                    LDA.b $22                   
                    SEC                         
                    SBC.b #$01                  
                    BNE   CODE_13EBE1           
                    LDA.b #$F0                  
CODE_13EBE1:        STA.b $22                   
                    STA.w $0881                 
                    STA.w $0885                 
CODE_13EBE9:        LDA.w $0889                 
                    CMP.b #$F0                  
                    BEQ   CODE_13EC08           
                    DEC.b $23                   
                    CMP.b #$F9                  
                    BNE   CODE_13EBFC           
                    LDA.b $23                   
                    CMP.b #$C0                  
                    BNE   CODE_13EC08           
CODE_13EBFC:        LDA.b $23                   
                    BNE   CODE_13EC02           
                    LDA.b #$F0                  
CODE_13EC02:        STA.w $0889                 
                    STA.w $088D                 
CODE_13EC08:        LDA.w $0891                 
                    CMP.b #$F0                  
                    BEQ   CODE_13EC4E           
                    DEC.b $24                   
                    CMP.b #$F9                  
                    BNE   CODE_13EC22           
                    LDA.b $24                   
                    CMP.b #$C0                  
                    BNE   CODE_13EC4E           
                    LDY.b $2B                   
                    LDA.w $50,y               
                    STA.b $3B                   
CODE_13EC22:        LDA.b $24                   
                    BNE   CODE_13EC36           
                    LDA.b #$00                  
                    STA.b $36                   
                    LDA.b $2B                   
                    CMP.b #$FF                  
                    BNE   CODE_13EC34           
                    LDA.b #$FF                  
                    STA.b $36                   
CODE_13EC34:        LDA.b #$F0                  
CODE_13EC36:        STA.w $0891                 
                    STA.w $0895                 
                    STA.w $0899                 
                    STA.w $089D                 
                    STA.w $08A1                 
                    STA.w $08A5                 
                    STA.w $08A9                 
                    STA.w $08AD                 
CODE_13EC4E:        LDA.b $2E                   
                    AND.b #$01                  
                    BNE   CODE_13EC57           
CODE_13EC54:        JMP.w CODE_13ED3F           

CODE_13EC57:        LDA.w $08C1                 
                    CMP.b #$F0                  
                    BEQ   CODE_13EC6F           
                    LDA.b $25                   
                    SEC                         
                    SBC.b #$01                  
                    BNE   CODE_13EC67           
                    LDA.b #$F0                  
CODE_13EC67:        STA.b $25                   
                    STA.w $08C1                 
                    STA.w $08C5                 
CODE_13EC6F:        LDA.w $08C9                 
                    CMP.b #$F0                  
                    BEQ   CODE_13EC8E           
                    DEC.b $26                   
                    CMP.b #$F9                  
                    BNE   CODE_13EC82           
                    LDA.b $26                   
                    CMP.b #$C0                  
                    BNE   CODE_13EC8E           
CODE_13EC82:        LDA.b $26                   
                    BNE   CODE_13EC88           
                    LDA.b #$F0                  
CODE_13EC88:        STA.w $08C9                 
                    STA.w $08CD                 
CODE_13EC8E:        LDA.w $08D1                 
                    CMP.b #$F0                  
                    BEQ   CODE_13EC54           
                    DEC.b $27                   
                    CMP.b #$F9                  
                    BNE   CODE_13ECAB           
                    LDA.b $27                   
                    CMP.b #$C0                  
                    BEQ   CODE_13ECA4           
                    BRL   CODE_13ED3F           

CODE_13ECA4:        LDY.b $2B                   
                    LDA.w $50,y               
                    STA.b $39                   
CODE_13ECAB:        LDA.b $2B                   
                    CMP.b #$1D                  
                    BNE   CODE_13ECC3           
                    LDA.b #$02                  
                    STA.w $0A54                 
                    STA.w $0A55                 
                    LDA.b $27                   
                    CMP.b #$A8                  
                    BNE   CODE_13ECC3           
                    LDA.b #$01                  
                    STA.b $3F                   
CODE_13ECC3:        LDA.b $27                   
                    BNE   CODE_13ECD5           
                    STZ.b $37                   
                    LDA.b $2B                   
                    CMP.b #$FF                  
                    BNE   CODE_13ECD3           
                    LDA.b #$FF                  
                    STA.b $37                   
CODE_13ECD3:        LDA.b #$F0                  
CODE_13ECD5:        STA.w $08D1                 
                    STA.w $08D5                 
                    STA.w $08D9                 
                    STA.w $08DD                 
                    STA.w $08E1                 
                    STA.w $08E5                 
                    STA.w $08E9                 
                    STA.w $08ED                 
                    LDA.b $3F                   
                    BEQ   CODE_13ED3F           
                    LDX.b #$1F                  
CODE_13ECF3:        LDA.l DATA_14CB4A,x             
                    STA.w $0900,x               
                    DEX                         
                    BPL   CODE_13ECF3           
                    LDA.b #$E9                  
                    STA.w $0842                 
                    STA.w $0846                 
                    STA.w $084A                 
                    STA.w $084E                 
                    LDA.b #$24                  
                    STA.w $0843                 
                    STA.w $0847                 
                    STA.w $084B                 
                    STA.w $084F                 
                    LDA.b #$00                  
                    STA.w $0A60                 
                    STA.w $0A61                 
                    STA.w $0A62                 
                    STA.w $0A63                 
                    STA.w $0A64                 
                    STA.w $0A65                 
                    STA.w $0A66                 
                    STA.w $0A67                 
                    LDA.b #$C0                  
                    STA.b $1F                   
                    STA.b $20                   
                    STZ.b $3F                   
                    LDA.b #$FF                  
                    STA.b $2B                   
CODE_13ED3F:        RTS                         

CODE_13ED40:        LDX.b #$43                  
CODE_13ED42:        LDA.l DATA_14CB6A,x             
                    STA.w $0840,x               
                    DEX                         
                    BPL   CODE_13ED42           
                    LDA.b #$02                  
                    STA.w $0A30                 
                    STA.w $0A31                 
                    STA.w $0A32                 
                    STA.w $0A33                 
                    STA.w $0A34                 
                    STA.w $0A35                 
                    STA.w $0A36                 
                    STA.w $0A37                 
                    STA.w $0A38                 
                    STZ.w $0A39                 
                    STZ.w $0A3A                 
                    STZ.w $0A3B                 
                    STZ.w $0A3C                 
                    STZ.w $0A3D                 
                    STZ.w $0A3E                 
                    STZ.w $0A3F                 
                    STZ.w $0A40                 
                    INC.b $29                   
                    LDA.b #$D0                  
                    STA.b $1F                   
                    LDA.b #$E0                  
                    STA.b $20                   
                    LDA.b #$F0                  
                    STA.b $21                   
                    LDA.b #$08                  
                    STA.b $22                   
                    RTS                         

CODE_13ED94:        LDA.b $2E                   
                    AND.b #$01                  
                    BNE   CODE_13ED9D           
                    JMP.w CODE_13EE38           

CODE_13ED9D:        LDA.w $0841                 
                    CMP.b #$F0                  
                    BEQ   CODE_13EDBD           
                    LDA.b $1F                   
                    SEC                         
                    SBC.b #$01                  
                    CMP.b #$40                  
                    BNE   CODE_13EDB2           
                    INC.b $29                   
                    JMP.w CODE_13EE38           

CODE_13EDB2:        STA.b $1F                   
                    STA.w $0841                 
                    STA.w $0845                 
                    STA.w $0849                 
CODE_13EDBD:        LDA.w $084D                 
                    CMP.b #$F0                  
                    BEQ   CODE_13EDE1           
                    DEC.b $20                   
                    CMP.b #$F9                  
                    BNE   CODE_13EDD0           
                    LDA.b $20                   
                    CMP.b #$C0                  
                    BNE   CODE_13EDE1           
CODE_13EDD0:        LDA.b $20                   
                    CMP.b #$10                  
                    BNE   CODE_13EDD8           
                    LDA.b #$F0                  
CODE_13EDD8:        STA.w $084D                 
                    STA.w $0851                 
                    STA.w $0855                 
CODE_13EDE1:        LDA.w $0859                 
                    CMP.b #$F0                  
                    BEQ   CODE_13EE05           
                    DEC.b $21                   
                    CMP.b #$F9                  
                    BNE   CODE_13EDF4           
                    LDA.b $21                   
                    CMP.b #$C0                  
                    BNE   CODE_13EE05           
CODE_13EDF4:        LDA.b $21                   
                    CMP.b #$10                  
                    BNE   CODE_13EDFC           
                    LDA.b #$F0                  
CODE_13EDFC:        STA.w $0859                 
                    STA.w $085D                 
                    STA.w $0861                 
CODE_13EE05:        LDA.w $0865                 
                    CMP.b #$F0                  
                    BEQ   CODE_13EE38           
                    DEC.b $22                   
                    CMP.b #$F9                  
                    BNE   CODE_13EE18           
                    LDA.b $22                   
                    CMP.b #$C0                  
                    BNE   CODE_13EE38           
CODE_13EE18:        LDA.b $22                   
                    CMP.b #$10                  
                    BNE   CODE_13EE20           
                    LDA.b #$F0                  
CODE_13EE20:        STA.w $0865                 
                    STA.w $0869                 
                    STA.w $086D                 
                    STA.w $0871                 
                    STA.w $0875                 
                    STA.w $0879                 
                    STA.w $087D                 
                    STA.w $0881                 
CODE_13EE38:        STZ.b $3D                   
                    STZ.b $3C                   
                    LDA.b #$0C                  
                    STA.b $3E                   
                    RTS                         

CODE_13EE41:        DEC.b $3C                   
                    BPL   CODE_13EE86           
                    LDA.b #$08                  
                    STA.b $3C                   
                    DEC.b $3E                   
                    BPL   CODE_13EE58           
                    INC.b $29                   
                    LDA.b #$00                  
                    STA.b $28                   
                    STA.b $2A                   
                    JMP.w CODE_13EE86           

CODE_13EE58:        LDY.b #$00                  
                    TYX                         
                    INC.b $3D                   
                    LDA.b $3D                   
                    AND.b #$01                  
                    BNE   CODE_13EE76           
CODE_13EE63:        LDA.l DATA_14C574,x             
                    STA.w $0842,y               
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INX                         
                    CPX.b #$06                  
                    BNE   CODE_13EE63           
                    JMP.w CODE_13EE86           

CODE_13EE76:        LDA.l DATA_14C57A,x             
                    STA.w $0842,y               
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    INX                         
                    CPX.b #$06                  
                    BNE   CODE_13EE76           
CODE_13EE86:        RTS                         

DATA_13EE87:        db $80,$7E,$A0,$7D,$40,$6D,$E0,$58
                    db $80,$44

CODE_13EE91:        DEC.b $28                   
                    BPL   CODE_13EEBB           
                    LDA.b #$02                  
                    STA.b $28                   
                    INC.b $2A                   
                    LDA.b $2A                   
                    ASL   A                     
                    TAX                         
                    REP   #$20                  
                    LDA.l DATA_13EE87,x             
                    STA.w $0C42                 
                    SEP   #$20                  
                    LDA.b #$01                  
                    STA.w $02A9                 
                    LDA.b $2A                   
                    CMP.b #$04                  
                    BNE   CODE_13EEBB           
                    INC.b $29                   
                    LDA.b #$02                  
                    STA.b $28                   
CODE_13EEBB:        RTS                         

CODE_13EEBC:        DEC.b $28                   
                    BPL   CODE_13EED6           
                    LDX.b #$16                  
                    LDY.b #$00                  
                    LDA.b #$F0                  
CODE_13EEC6:        STA.w $0841,y               
                    INY                         
                    INY                         
                    INY                         
                    INY                         
                    DEX                         
                    BPL   CODE_13EEC6           
                    LDA.b #$30                  
                    STA.b $28                   
                    INC.b $29                   
CODE_13EED6:        RTS                         

CODE_13EED7:        DEC.b $28                   
                    BPL   CODE_13EEEC           
                    STZ.b $19                   
                    STZ.b $1A                   
                    STZ.b $1B                   
                    LDA.b #$05                  
                    STA.w $0210                 
                    LDA.b #$14                  
                    STA.b $1D                   
                    INC.b $29                   
CODE_13EEEC:        RTS                         

CODE_13EEED:        LDA.b $1B                   
                    CMP.b #$2A                  
                    BEQ   CODE_13EEEC           
                    DEC.w $0210                 
                    BPL   CODE_13EEEC           
                    LDA.b #$05                  
                    STA.w $0210                 
                    INC.b $1B                   
                    LDX.b $1B                   
                    LDA.l DATA_14CBAE,x             
                    STA.w $0713                 
                    LDA.l DATA_14CBAD,x             
                    TAX                         
CODE_13EF0D:        LDA.l DATA_14CBDC,x             
                    TAY                         
                    LDA.l DATA_14CBD9,x             
                    STA.w $0800,y               
                    LDA.l DATA_14CBDA,x             
                    STA.w $0801,y               
                    LDA.l DATA_14CBDB,x             
                    STA.w $0802,y               
                    LDA.b #$21                  
                    STA.w $0803,y               
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b #$00                  
                    STA.w $0A20,y               
                    INX                         
                    INX                         
                    INX                         
                    INX                         
                    CPX.w $0713                 
                    BNE   CODE_13EF0D           
                    RTS                         

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

CODE_13F000:        LDA.w $02AB
                    BNE   CODE_13F073           
                    LDA.w $02C3                 
                    BEQ   CODE_13F017           
                    LDX.b #$02                  
CODE_13F00C:        LDA.w $02B2,x               
                    STA.w $0257,x               
                    DEX                         
                    BPL   CODE_13F00C           
                    BRA   CODE_13F02F           

CODE_13F017:        LDX.w $0535                 
                    LDA.l DATA_11CE8E,x             
                    STA.w $0257                 
                    LDA.l DATA_11CE98,x             
                    STA.w $0258                 
                    LDA.l DATA_11CEA2,x             
                    STA.w $0259                 
CODE_13F02F:        LDA.w $0535                 
                    LDY.b #$01                  
                    JSR.w CODE_13F109           
                    LDA.w $0533                 
                    CMP.b #$08                  
                    BNE   CODE_13F04C           
                    LDA.w $0534                 
                    CMP.b #$08                  
                    BNE   CODE_13F04C           
                    LDA.b #$10                  
                    STA.w $0208                 
                    BRA   CODE_13F04F           

CODE_13F04C:        STZ.w $0208                 
CODE_13F04F:        STZ.w $0209                 
                    INC.w $02AB                 
                    LDA.w $0535                 
                    STA.w $0260                 
                    LDA.b #$01                  
                    STA.w $02AC                 
                    LSR   A                     
                    STA.b $06                   
                    LDA.b #$FF                  
                    STA.w $0263                 
                    LDA.b #$0F                  
                    STA.w $0262                 
                    JSR.w CODE_13F07D           
                    JSR.w CODE_13F3B9           
CODE_13F073:        JSL.l CODE_13F1BF           
                    LDA.w $02AC                 
                    BNE   CODE_13F07C           
CODE_13F07C:        RTL                         

CODE_13F07D:        LDA.w $02C3                 
                    BEQ   CODE_13F085           
                    BRL   CODE_13F105           

CODE_13F085:        LDA.w $0535                 
                    BNE   CODE_13F095           
                    LDA.w $02C2                 
                    BPL   CODE_13F092           
                    JMP.w CODE_13F102           

CODE_13F092:        LDA.w $0535                 
CODE_13F095:        CMP.w $0541                 
                    BNE   CODE_13F09F           
                    LDA.w $02C2                 
                    BPL   CODE_13F102           
CODE_13F09F:        LDX.b #$02                  
                    LDA.w $02C2                 
                    BPL   CODE_13F0AC           
                    LDA.b #$FF                  
                    STA.b $0B                   
                    BNE   CODE_13F0AE           
CODE_13F0AC:        STZ.b $0B                   
CODE_13F0AE:        LDA.w $02C2                 
                    AND.b #$F0                  
                    CLC                         
                    ADC.w $0257,x               
                    PHP                         
                    ADC.b $0B                   
                    PLP                         
                    STA.b $0C                   
                    LDA.b $0B                   
                    BNE   CODE_13F0D3           
                    BCC   CODE_13F0E5           
                    LDA.w $0257,x               
                    AND.b #$0F                  
                    CMP.b #$09                  
                    BNE   CODE_13F0E5           
                    LDA.b $0C                   
                    AND.b #$F0                  
                    JMP.w CODE_13F0E7           

CODE_13F0D3:        BCS   CODE_13F0E5                   
                    LDA.w $0257,x               
                    AND.b #$0F                  
                    BNE   CODE_13F0E5           
                    LDA.b $0C                   
                    AND.b #$F0                  
                    ADC.b #$09                  
                    JMP.w CODE_13F0E7           

CODE_13F0E5:        LDA.b $0C                   
CODE_13F0E7:        STA.w $0257,x               
                    DEX                         
                    BPL   CODE_13F0AE           
                    LDA.w $02C2                 
                    BPL   CODE_13F102           
                    DEC.w $0260                 
                    LDA.w $0203                 
                    EOR.b #$01                  
                    STA.w $0203                 
                    LDA.b #$01                  
                    STA.w $0262                 
CODE_13F102:        STZ.w $02C2                 
CODE_13F105:        JSR.w CODE_13F343           
                    RTS                         

CODE_13F109:        LSR   A                     
                    BCS   CODE_13F126                   
                    CPY.b #$01                  
                    BEQ   CODE_13F115           
                    LDA.w $0628                 
                    BEQ   CODE_13F11C           
CODE_13F115:        LDA.b #$01                  
                    STA.w $0203                 
                    BRA   CODE_13F11F           

CODE_13F11C:        STZ.w $0203                 
CODE_13F11F:        STZ.w $0209                 
                    LDA.b #$00                  
                    BRA   CODE_13F13F           

CODE_13F126:        CPY.b #$01                  
                    BEQ   CODE_13F12F           
                    STZ.w $0203                 
                    BRA   CODE_13F13C           

CODE_13F12F:        LDA.b #$01                  
                    STA.w $0203                 
                    STA.w $0209                 
                    LDA.b #$80                  
                    STA.w $0202                 
CODE_13F13C:        LDA   DATA_119B3C,y               
CODE_13F13F:        STA.w $0261                 
                    RTS                         

CODE_13F143:        LDA.w $0202                 
                    STA.w $02AD                 
                    LDA.w $0203                 
                    STA.w $02AE                 
                    LDA.w $04C0                 
                    STA.w $02AF                 
                    INC.w $02B0                 
                    LDA.w DATA_119B3E                 
                    STA.w $0535                 
                    JSR.w CODE_13F109           
                    LDA.b #$00                  
                    STA.w $0202                 
                    STA.w $04C2                 
                    LDA.w DATA_119B3E                 
                    STA.w $04C0                 
                    LDA.w DATA_119B3E                 
                    STA.w $0257                 
                    LDA.b #$E0                  
                    STA.w $0261                 
                    LDA.w DATA_119B3E                 
                    CLC                         
                    ADC.b #$F0                  
                    STA.w $0263                 
                    RTL                         

CODE_13F184:        LDA.w $02AD                 
                    STA.w $0202                 
                    STA.w $04C2                 
                    LDA.w $02AE                 
                    STA.w $0203                 
                    LDA.w $02AF                 
                    STA.w $04C0                 
                    LDA.w $02B0                 
                    BNE   CODE_13F1BE           
                    INC.w $02B1                 
                    INC.w $02B0                 
                    INC.b $D5                   
                    LDA.w $0258                 
                    STA.w $0257                 
                    LDA.b #$10                  
                    STA.b $01                   
                    LDA.b #$F0                  
                    STA.w $0261                 
                    STA.w $0262                 
                    LDA.w $0259                 
                    STA.w $0263                 
CODE_13F1BE:        RTL                         

CODE_13F1BF:        LDX.b #$00                  
                    STX.w $0264                 
                    STX.w $0265                 
                    STX.b $D8                   
                    JSL.l CODE_13F238           
                    JSL.l CODE_13F277           
                    LDA.w $0261                 
                    CMP.w $025A                 
                    BNE   CODE_13F1F3           
                    BRA   CODE_13F1F3           

                    LDA.w $0262                 
                    CLC                         
                    ADC.b #$01                  
                    CMP.w $025B                 
                    BNE   CODE_13F1F3           
CODE_13F1E6:        STZ.w $02AC                 
                    STZ.w $02B0                 
                    STZ.w $02B1                 
                    INC.w $0264                 
                    RTL                         

CODE_13F1F3:        LDA.w $0257                 
                    CMP.w $0263                 
                    BEQ   CODE_13F1E6           
                    LDX.b #$00                  
                    JSL.l CODE_13F21D           
                    RTL                         

CODE_13F202:        LDA.w $0257,x               
                    SEC                         
                    SBC.b #$10                  
                    STA.w $0257,x               
                    BCS   CODE_13F21C                   
                    DEC.w $0257,x               
                    LDA.w $0257,x               
                    CMP.b #$EF                  
                    BNE   CODE_13F21C           
                    LDA.b #$F9                  
                    STA.w $0257,x               
CODE_13F21C:        RTL                         

CODE_13F21D:        LDA.w $0257,x               
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0257,x               
                    BCC   CODE_13F237           
                    INC.w $0257,x               
                    LDA.w $0257,x               
                    CMP.b #$0A                  
                    BNE   CODE_13F237           
                    LDA.b #$00                  
                    STA.w $0257,x               
CODE_13F237:        RTL                         

CODE_13F238:        STY.b $0F                   
                    LDA.w $0257,x               
                    AND.b #$0F                  
                    TAY                         
                    LDA   DATA_11AAF0,y               
                    STA.w $0269                 
                    LDA.w $0534                 
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC   DATA_11AAFB,y               
                    STA.w $026A                 
                    LDA.b #$7F                  
                    STA.w $026B                 
                    LDA.w $0257,x               
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.w $0256                 
                    ASL   A                     
                    STA.w $025B                 
                    LDY.b #$00                  
                    LDA.w $0257,x               
                    LSR   A                     
                    BCS   CODE_13F271                   
                    LDY.b #$04                  
CODE_13F271:        STY.w $025A                 
                    LDY.b $0F                   
                    RTL                         

CODE_13F277:        PHB                         
                    LDA.b #$13                  
                    PHA                         
                    PLB                         
                    LDA.l $7F0000               
                    TAX                         
                    LDA.w $0269                 
                    STA.b $C4                   
                    LDA.w $026A                 
                    STA.b $C5                   
                    LDA.w $026B                 
                    STA.b $C6                   
                    LDA.w $024B                 
                    BEQ   CODE_13F298           
                    JMP.w CODE_13F3E0           

CODE_13F298:        REP   #$20                  
                    LDA.w $025A                 
                    ORA.w #$0010                
                    STA.l $7F0002,x             
                    XBA                         
                    CLC                         
                    ADC.w #$0001                
                    XBA                         
                    ORA.w #$0010                
                    STA.l $7F0042,x             
                    INX                         
                    INX                         
                    LDA.w #$3C00                
                    STA.l $7F0002,x             
                    STA.l $7F0042,x             
                    INX                         
                    INX                         
                    SEP   #$20                  
                    STZ.w $0255                 
                    STZ.b $D5                   
CODE_13F2C7:        LDA.w $02DF               ; \ [$00] = Pointer to Map16 tileset.
                    STA.b $00                 ;  |
                    LDA.w $02E0               ;  |
                    STA.b $01                 ;  |
                    LDA.w $02E1               ;  |
                    STA.b $02                 ; /
                    LDY.w $0256                 
                    REP   #$30                ; Accumulator and Index = 16-bit.
                    LDA.b [$C4],y             ; \ Check if Layer 2 Map16 tile = #$FF.
                    AND.w #$00FF              ;  |
                    CMP.w #$00FF              ;  |
                    BNE   CODE_13F2F5         ; / If not, branch.
                    LDA   PNTR_13A613      ; \ Load empty tile.
                    STA.b $00                 ;  | ($13A615)
                    LDA.w #$0013              ;  |
                    STA.b $02                 ; /
                    LDY.w #$0000              ; Y = #$0000.
                    BRA   CODE_13F2F9           

CODE_13F2F5:        ASL   A                   ; \ Multiply by 8 (8 bytes for 1 Map16 tile)
                    ASL   A                   ;  |
                    ASL   A                   ;  |
                    TAY                       ; / Into Y.
CODE_13F2F9:        LDA.b [$00],y             ; \ Store top-left tile.
                    STA.l $7F0002,x           ;  |
                    INY                       ;  | Get to next tile.
                    INY                       ;  |
                    LDA.b [$00],y             ;  | Store bottom-left tile.
                    STA.l $7F0042,x           ;  |
                    INY                       ;  | Get to next tile.
                    INY                       ;  |
                    LDA.b [$00],y             ;  | Store top-right tile.
                    STA.l $7F0004,x           ;  |
                    INY                       ;  | Get to next tile.
                    INY                       ;  |
                    LDA.b [$00],y             ;  | Store bottom-right tile.
                    STA.l $7F0044,x           ; /
                    SEP   #$30                ; Accumulator and Index = 8-bit.
                    INC.w $0255                 
                    INX                         
                    INX                         
                    INX                         
                    INX                         
                    LDA.w $0256                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0256                 
                    LDA.w $0255                 
                    CMP.b #$0F                  
                    BCC   CODE_13F2C7           
                    LDA.b #$FF                  
                    STA.l $7F0042,x             
                    TXA                         
                    CLC                         
                    ADC.b #$40                  
                    STA.l $7F0000               
                    INC.w $0265                 
                    PLB                         
                    RTL                         

CODE_13F343:        LDA.w $02C3                 
                    BEQ   CODE_13F356           
                    LDA.w $0200                 
                    STA.w $0202                 
                    LDA.w $0201                 
                    STA.w $0203                 
                    BRA   CODE_13F3AD           

CODE_13F356:        LDA.w $0535                 
                    AND.b #$02                  
                    BNE   CODE_13F385           
                    LDA.w $02B6                 
                    BEQ   CODE_13F367           
                    LDA.w $0201                 
                    BRA   CODE_13F369           

CODE_13F367:        LDA.b #$01                  
CODE_13F369:        STA.w $0203                 
                    LDA.w $0201                 
                    BEQ   CODE_13F37A           
                    LDA.w $0200                 
                    LSR   A                     
                    STA.w $0202                 
                    BRA   CODE_13F3AD           

CODE_13F37A:        LDA.w $0200                 
                    LSR   A                     
                    ORA.b #$80                  
                    STA.w $0202                 
                    BRA   CODE_13F3AD           

CODE_13F385:        LDA.w $02B6                 
                    BEQ   CODE_13F391           
                    LDA.w $0201                 
                    EOR.b #$01                  
                    BRA   CODE_13F393           

CODE_13F391:        LDA.b #$00                  
CODE_13F393:        STA.w $0203                 
                    LDA.w $0201                 
                    BEQ   CODE_13F3A4           
                    LDA.w $0200                 
                    LSR   A                     
                    STA.w $0202                 
                    BRA   CODE_13F3AD           

CODE_13F3A4:        LDA.w $0200                 
                    LSR   A                     
                    ORA.b #$80                  
                    STA.w $0202                 
CODE_13F3AD:        LDA.w $0202                 
                    AND.b #$F0                  
                    STA.w $026C                 
                    STZ.w $02B6                 
                    RTS                         

CODE_13F3B9:        LDX.w $0533               ; \ Get level + room number into index.
                    LDA.l DATA_11D098,x         ;  |
                    CLC                       ;  |
                    ADC.w $0534               ;  |
                    TAX                       ; /
                    LDA.l DATA_13A61D,x         ; \ Load a certain Layer 2 Map16 tileset.     
                    ASL   A                   ;  |
                    TAX                       ; /
                    LDA   PNTR_13A6E5,x       ; \ Tileset pointer, low byte, into $02DF.
                    STA.w $02DF               ; /
                    INX                       ; \
                    LDA   PNTR_13A6E5,x       ;  | Tileset pointer, high byte, into $02E0.    
                    STA.w $02E0               ; /
                    LDA.b #$13                ; \ Bank number = #$13.
                    STA.w $02E1               ; / Into $02E1.
                    RTS                       ; Return.

CODE_13F3E0:        REP   #$20                  
                    LDA.w $025A                 
                    ORA.w #$0010                
                    CLC                         
                    ADC.w #$4001                
                    STA.l $7F0002,x             
                    XBA                         
                    CLC                         
                    ADC.w #$0001                
                    XBA                         
                    ORA.w #$0010                
                    STA.l $7F002E,x             
                    INX                         
                    INX                         
                    LDA.w #$2800                
                    STA.l $7F0002,x             
                    STA.l $7F002E,x             
                    INX                         
                    INX                         
                    SEP   #$20                  
                    STZ.w $0255                 
                    STZ.b $D5                   
                    LDA.w $0256                 
                    CLC                         
                    ADC.b #$50                  
                    STA.w $0256                 
CODE_13F41C:        LDA.w $02DF                 
                    STA.b $00                   
                    LDA.w $02E0                 
                    STA.b $01                   
                    LDA.w $02E1                 
                    STA.b $02                   
                    LDY.w $0256                 
                    REP   #$30                  
                    LDA.b [$C4],y             ; \ Check if Layer 2 Map16 tile = #$FF.
                    AND.w #$00FF              ;  |
                    CMP.w #$00FF              ;  |
                    BNE   CODE_13F44A         ; / If not, branch.
                    LDA   PNTR_13A613         ; \ Load empty tile data.
                    STA.b $00                 ;  | ($13A615)
                    LDA.w #$0013              ;  |
                    STA.b $02                 ; /
                    LDY.w #$0000              ; Y = #$0000.
                    BRA   CODE_13F44E           

CODE_13F44A:        ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    TAY                         
CODE_13F44E:        LDA.b [$00],y               
                    STA.l $7F0002,x             
                    INY                         
                    INY                         
                    LDA.b [$00],y               
                    STA.l $7F002E,x             
                    INY                         
                    INY                         
                    LDA.b [$00],y               
                    STA.l $7F0004,x             
                    INY                         
                    INY                         
                    LDA.b [$00],y               
                    STA.l $7F0030,x             
                    SEP   #$30                  
                    INC.w $0255                 
                    INX                         
                    INX                         
                    INX                         
                    INX                         
                    LDA.w $0256                 
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0256                 
                    LDA.w $0255                 
                    CMP.b #$0A                  
                    BCC   CODE_13F41C           
                    LDA.b #$FF                  
                    STA.l $7F002E,x             
                    TXA                         
                    CLC                         
                    ADC.b #$2C                  
                    STA.l $7F0000               
                    INC.w $0265                 
                    PLB                         
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
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ; /
   
CODE_13F500:        LDA.w $02AB                 
                    BNE   CODE_13F554           
                    LDA.b #$02                  
                    STA.w $025A                 
                    LDA.w $02C3                 
                    BNE   CODE_13F523           
                    LDX.w $0535                 
                    LDA.l DATA_11CEAC,x             
                    STA.w $0257                 
                    STA.w $0258                 
                    LDA.l DATA_11CEB6,x             
                    STA.w $0259                 
CODE_13F523:        LDA.w $0535                 
                    LDY.b #$00                  
                    JSR.w CODE_13F109           
                    LDA.b #$02                  
                    STA.w $02B9                 
                    LDA.b #$00                  
                    STA.w $02BA                 
                    LDA.b #$20                  
                    STA.w $025C                 
                    LDA.b #$A0                  
                    STA.w $025D                 
                    INC.w $02AB                 
                    LDA.b #$E0                  
                    STA.b $E2                   
                    LDA.b #$01                  
                    STA.b $E4                   
                    STA.w $02AC                 
                    LSR   A                     
                    STA.w $025B                 
                    JSR.w CODE_13F3B9           
CODE_13F554:        STZ.b $06                   
                    LDA.b #$FF                  
                    STA.w $0263                 
                    LDA.b #$A0                  
                    STA.w $0262                 
                    JSL.l CODE_13F5FE           
                    LDA.w $02AC                 
                    BNE   CODE_13F571           
                    LDA.b #$E8                  
                    STA.b $E1                   
                    LDA.b #$C8                  
                    STA.b $E2                   
CODE_13F571:        RTL                         

                    LDA.w $0208                 
                    STA.w $02BB                 
                    LDA.w $0200                 
                    STA.w $02AD                 
                    LDA.w $02BC                 
                    STA.w $02BE                 
                    LDA.w $02BD                 
                    STA.w $02BF                 
                    LDA.w $04C0                 
                    STA.w $02C0                 
                    STZ.w $0206                 
                    STZ.w $0200                 
                    STZ.w $0208                 
                    STZ.w $0202                 
                    RTL                         

                    LDA.w $02BB                 
                    STA.w $0208                 
                    LDA.w $02AD                 
                    STA.w $0202                 
                    LDA.w $02BE                 
                    STA.w $02BC                 
                    LDA.w $02BF                 
                    STA.w $02BD                 
                    LDA.w $02C0                 
                    STA.w $04C0                 
                    RTL                         

                    LDA.w $0258                 
                    AND.b #$10                  
                    BEQ   CODE_13F5CA           
                    LDA.b $E1                   
                    SEC                         
                    SBC.b #$08                  
                    STA.b $E1                   
CODE_13F5CA:        LDA.b #$01                  
                    STA.b $E4                   
                    LDA.w $0258                 
                    STA.w $0257                 
                    LDA.b #$10                  
                    STA.b $01                   
                    LDX.b #$00                  
                    JSL.l CODE_13F74D           
                    LDA.w $025C                 
                    STA.w $025B                 
                    LDA.b $E1                   
                    STA.b $E2                   
                    LDA.b #$F0                  
                    STA.w $0261                 
                    STA.w $0262                 
                    LDA.w $0259                 
                    STA.w $0263                 
                    INC.w $02C1                 
                    LDA.b #$01                  
                    STA.b $06                   
                    RTL                         

CODE_13F5FE:        LDX.b #$00                  
                    STX.w $0264                 
                    JSL.l CODE_13F6F7           
                    JSL.l CODE_13F77D           
                    LDX.b #$00                  
                    JSL.l CODE_13F674           
                    LDA.w $0261                 
                    CMP.w $025A                 
                    BNE   CODE_13F63B           
                    LDA.w $0262                 
                    CLC                         
                    ADC.b #$20                  
                    CMP.w $025B                 
                    BNE   CODE_13F63B           
CODE_13F624:        LDA.b $06                   
                    TAX                         
                    BEQ   CODE_13F62E           
                    LDA.w $0519                 
                    STA.b $E1                   
CODE_13F62E:        INC.w $0264                 
                    STZ.w $02AC                 
                    STZ.w $02B0                 
                    STZ.w $02B1                 
                    RTL                         

CODE_13F63B:        LDA.w $025B                 
                    AND.b #$20                  
                    BNE   CODE_13F650           
                    LDA.w $0257                 
                    CMP.w $0263                 
                    BEQ   CODE_13F624           
                    LDX.b #$00                  
                    JSL.l CODE_13F6D0           
CODE_13F650:        RTL                         

CODE_13F651:        LDA.w $025C,x               
                    SEC                         
                    SBC.b #$20                  
                    STA.w $025C,x               
                    BCS   CODE_13F673                   
                    LDA.w $02B9,x               
                    SEC                         
                    SBC.b #$01                  
                    CMP.b #$FF                  
                    BNE   CODE_13F66A           
                    LDA.b #$0B                  
                    BRA   CODE_13F670           

CODE_13F66A:        CMP.b #$07                  
                    BNE   CODE_13F6A2           
                    LDA.b #$03                  
CODE_13F670:        STA.w $02B9,x               
CODE_13F673:        RTL                         

CODE_13F674:        LDA.w $025B,x               
                    CLC                         
                    ADC.b #$20                  
                    STA.w $025B,x               
                    BCC   CODE_13F6A5           
                    CPX.b #$00                  
                    BNE   CODE_13F68D           
                    LDA.w $025A                 
                    CLC                         
                    ADC.b #$01                  
                    STA.w $025A                 
                    RTL                         

CODE_13F68D:        DEX                         
                    LDA.w $02B9,x               
                    CLC                         
                    ADC.b #$01                  
                    CMP.b #$04                  
                    BNE   CODE_13F69C           
                    LDA.b #$08                  
                    BRA   CODE_13F6A2           

CODE_13F69C:        CMP.b #$0C                  
                    BNE   CODE_13F6A2           
                    LDA.b #$00                  
CODE_13F6A2:        STA.w $02B9,x               
CODE_13F6A5:        RTL                         

CODE_13F6A6:        LDA.w $0258,x               
                    SEC                         
                    SBC.b #$10                  
                    STA.w $0258,x               
                    AND.b #$F0                  
                    CMP.b #$F0                  
                    BNE   CODE_13F6CF           
                    LDA.w $0258,x               
                    AND.b #$0F                  
                    CLC                         
                    ADC.b #$E0                  
                    STA.w $0258,x               
                    DEC.w $0258,x               
                    LDA.w $0258,x               
                    CMP.b #$DF                  
                    BNE   CODE_13F6CF           
                    LDA.b #$E9                  
                    STA.w $0258,x               
CODE_13F6CF:        RTL                         

CODE_13F6D0:        LDA.w $0257,x               
                    CLC                         
                    ADC.b #$10                  
                    STA.w $0257,x               
                    AND.b #$F0                  
                    CMP.b #$F0                  
                    BNE   CODE_13F6F6           
                    LDA.w $0257,x               
                    AND.b #$0F                  
                    STA.w $0257,x               
                    INC.w $0257,x               
                    LDA.w $0257,x               
                    CMP.b #$0A                  
                    BNE   CODE_13F6F6           
                    LDA.b #$00                  
                    STA.w $0257,x               
CODE_13F6F6:        RTL                         

CODE_13F6F7:        PHX                         
                    LDA.w $0257,x               
                    AND.b #$0F                  
                    TAY                         
                    LDA   DATA_11AAF0,y               
                    STA.w $0269                 
                    LDA.w $0534                 
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC   DATA_11AAFB,y               
                    STA.w $026A                 
                    LDA.b #$7F                  
                    STA.w $026B                 
                    LDA.w $0257,x               
                    AND.b #$F0                  
                    STA.w $0256                 
                    CPX.b #$00                  
                    BNE   CODE_13F73E           
                    LDA.w $025A                 
                    CMP.b #$FF                  
                    BNE   CODE_13F72E           
                    LDA.b #$0B                  
                    BRA   CODE_13F742           

CODE_13F72E:        CMP.b #$04                  
                    BNE   CODE_13F736           
                    LDA.b #$08                  
                    BRA   CODE_13F742           

CODE_13F736:        CMP.b #$0C                  
                    BNE   CODE_13F742           
                    LDA.b #$00                  
                    BRA   CODE_13F742           

CODE_13F73E:        DEX                         
                    LDA.w $02B9,x               
CODE_13F742:        STA.w $025A                 
                    PLX                         
                    LDA.w $025B,x               
                    STA.w $025B                 
CODE_13F74C:        RTL                         

CODE_13F74D:        LDA.w $0257,x               
                    AND.b #$10                  
                    BEQ   CODE_13F74C           
                    LDA.w $0257,x               
                    STA.b $03                   
                    SEC                         
                    SBC.b $01                   
                    STA.w $0257,x               
                    JSL.l CODE_13F6F7           
                    LDA.b #$0F                  
                    STA.b $E3                   
                    LDA.b #$00                  
                    STA.w $0255                 
CODE_13F76C:        DEC.b $E3                   
                    LDA.b $E3                   
                    BPL   CODE_13F76C           
                    LDA.b $03                   
                    STA.w $0257,x               
                    DEC.b $E4                   
                    JML.l CODE_13F6F7           

CODE_13F77D:        LDA.l $7F0000               
                    TAX                         
                    LDA.w $0269                 
                    STA.b $C4                   
                    LDA.w $026A                 
                    STA.b $C5                   
                    LDA.w $026B                 
                    STA.b $C6                   
                    LDA.w $025A                 
                    ORA.b #$10                  
                    STA.l $7F0002,x             
                    INX                         
                    LDA.w $025B                 
                    STA.l $7F0002,x             
                    INX                         
                    LDA.b #$00                  
                    STA.l $7F0002,x             
                    INX                         
                    LDA.b #$40                  
                    STA.l $7F0002,x             
                    INX                         
                    STZ.w $0255                 
                    LDA.b #$0F                  
                    STA.b $E3                   
CODE_13F7B8:        LDA.w $02DF                 
                    STA.b $00                   
                    LDA.w $02E0                 
                    STA.b $01                   
                    LDA.w $02E1                 
                    STA.b $02                   
                    LDY.w $0256                 
                    REP   #$30                  
                    LDA.b [$C4],y             ; \ Check if Layer 2 Map16 tile = #$FF.
                    AND.w #$00FF              ;  |
                    CMP.w #$00FF              ;  |
                    BNE   CODE_13F7E6         ; /
                    LDA   PNTR_13A613         ; \ Empty tile.    
                    STA.b $00                 ;  | ($13A615)
                    LDA.w #$0013              ;  |
                    STA.b $02                 ; /
                    LDY.w #$0000              ; Y = #$0000.
                    BRA   CODE_13F7EA           

CODE_13F7E6:        ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    TAY                         
CODE_13F7EA:        LDA.w $02C1                 
                    AND.w #$00FF                
                    BEQ   CODE_13F7F6           
                    INY                         
                    INY                         
                    INY                         
                    INY                         
CODE_13F7F6:        REP   #$20                  
                    LDA.b [$00],y               
                    STA.l $7F0002,x             
                    SEP   #$20                  
                    INC.w $0255                 
                    INX                         
                    INX                         
                    INY                         
                    INY                         
                    LDA.w $0255                 
                    LSR   A                     
                    BCS   CODE_13F7F6                   
                    INC.w $0256                 
                    SEP   #$30                  
                    LDA.w $0255                 
                    CMP.b #$20                  
                    BCC   CODE_13F7B8           
                    LDA.b #$FF                  
                    STA.l $7F0002,x             
                    TXA                         
                    STA.l $7F0000               
                    BRA   CODE_13F862           

                    LDA.b $E4                   
                    BEQ   CODE_13F82F           
                    DEC.b $E4                   
                    JMP.w CODE_13F837           

CODE_13F82F:        LDA.b $D8                   
                    LSR   A                     
                    BCS   CODE_13F837                   
                    JMP.w CODE_13F837
           
CODE_13F837:        LDX.b #$00                  
                    LDA.b $D8                   
                    LSR   A                     
                    BCC   CODE_13F852           
                    INX                         
                    LDA.w $0258,x               
                    AND.b #$F0                  
                    CMP.b #$E0                  
                    BEQ   CODE_13F84F           
                    LDA.w $0258,x               
                    AND.b #$10                  
                    BNE   CODE_13F862           
CODE_13F84F:        JMP.w CODE_13F862           

CODE_13F852:        LDA.w $0258,x               
                    AND.b #$F0                  
                    CMP.b #$E0                  
                    BEQ   CODE_13F862           
                    LDA.w $0258,x               
                    AND.b #$10                  
                    BEQ   CODE_13F862           
CODE_13F862:        LDA.w $02C1                 
                    EOR.b #$01                  
                    STA.w $02C1                 
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
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF      ;  |
                    db $FF,$FF,$FF,$FF,$FF                  ; /

CODE_13F900:        TXA
                    PHA
                    LDA.b #$00
                    STA.b $00
                    STA.b $01
                    LDA   DATA_11CB0E,y
                    BPL   CODE_13F90F
                    DEC.b $00
CODE_13F90F:        CLC
                    ADC.b $28,x                 
                    AND.b #$F0                  
                    STA.b $05                   
                    PHP                         
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $E5                   
                    PLP                         
                    LDA.b $14,x                 
                    ADC.b $00                   
                    STA.b $02                   
                    STA.b $03                   
                    LDA.b $EB                   
                    BNE   CODE_13F92E           
                    STA.b $02                   
                    STA.b $03                   
CODE_13F92E:        LDA   DATA_11CB56,y               
                    BPL   CODE_13F935           
                    DEC.b $01                   
CODE_13F935:        CLC                         
                    ADC.b $32,x                 
                    AND.b #$F0                  
                    STA.b $06                   
                    STA.b $E6                   
                    LDA.b $1E,x                 
                    ADC.b $01                   
                    STA.b $01                   
                    STA.b $04                   
                    JSR.w CODE_13F9EE           
                    BCC   CODE_13F94F           
                    LDA.b #$00                  
                    BEQ   CODE_13F997           
CODE_13F94F:        LDX.b $0D                   
                    STX.w $070F                 
                    LDX.b $0E                   
                    STX.w $0710                 
                    LDX.b $0F                   
                    STX.w $0711                 
                    LDX.b $03                   
                    PHX                         
                    JSR.w CODE_13FA5C           
                    REP   #$20                  
                    LDA.b $01                   
                    CLC                         
                    ADC.w #$7000                
                    STA.b $0D                   
                    SEP   #$20                  
                    LDA.b $03                   
                    STA.b $0F                   
                    LDY.b $E7                 ; Get index (position) to the corresponding Map16 tile.
                    LDA.b [$0D],y             ; \ If Map16 page 0, branch.
                    BEQ   CODE_13F983         ; /
                    LDA.b [$01],y             ; \ All tiles on page 1 must act like...
                    TAX                       ;  |
                    LDA.l DATA_14CCBD,x         ;  | $2C, $40, $AB or $C0...
                    BRA   CODE_13F985         ; / from page 0.

CODE_13F983:        LDA.b [$01],y             ; This is for page 0, just act what it's supposed to act like.
CODE_13F985:        PLX                       ; Pull X index back.
                    STX.b $03                   
                    LDX.w $070F                 
                    STX.b $0D                   
                    LDX.w $0710                 
                    STX.b $0E                   
                    LDX.w $0711                 
                    STX.b $0F                   
CODE_13F997:        STA.b $00                 ; Map16 tile 'acts like'.
                    PLA                         
                    TAX                         
                    RTL                         

CODE_13F99C:        PHA                         
                    AND.b #$C0                  
                    ASL   A                     
                    ROL   A                     
                    ROL   A                     
                    ADC   DATA_119B9C,y               
                    TAY                         
                    PLA                         
                    CMP   DATA_11CDA8,y               
                    RTL                         

                    INC.w $04BE                 
                    INC.w $041B                 
                    JSL.l CODE_1287BC           
                    LDA.b #$01                  
                    STA.w $0601                 
                    RTL                         

CODE_13F9BB:        LDX.b #$00                  
                    LDY.b $6E                   
                    LDA.b $3C                   
                    EOR   DATA_119BBA,y               
                    BPL   CODE_13F9C8           
                    STX.b $3C                   
CODE_13F9C8:        LDA.w $04CC                 
                    EOR   DATA_119BBA,y               
                    BPL   CODE_13F9D3           
                    STX.w $04CC                 
CODE_13F9D3:        STX.w $0407                 
                    RTL                         

CODE_13F9D7:        LDA.b #$02                ; \ Pick something up animation.
                    STA.b $50                 ; /
                    STZ.w $078C                 
                    LDA.b #$06                ; \ Amount of frames it should take to pick the enemy up.
                    STA.b $82                 ; /
                    LDA.b #$08                  
                    STA.b $C7                   
                    INC.b $9C                   
                    LDA.b #$3C                ; \ Picking something up sound effect.
                    STA.w $1DE3               ; /
                    RTL                       ; Return.

CODE_13F9EE:        LDY.b $01                   
                    LDA.b $E6                   
                    JSR.w CODE_13FA8F           
                    STY.b $01                   
                    STA.b $E6                   
                    LDY.b $EB                   
                    LDA.w $01,y               
                    STA.b $E9                   
                    LDA.b $02                   
                    CMP   DATA_119BB7,y               
                    BCS   CODE_13FA0C                   
                    LDA.b $01                   
                    CMP   DATA_119BB6,y               
CODE_13FA0C:        RTS                         

CODE_13FA0D:        PHA                         
                    LDA.b $29,x                 
                    CLC                         
                    ADC.b #$08                  
                    PHP                         
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    STA.b $E5                   
                    PLP                         
                    LDA.b $15,x                 
                    LDY.b $EB                   
                    BEQ   CODE_13FA23           
                    ADC.b #$00                  
CODE_13FA23:        STA.b $02                   
                    LDA.b $33,x                 
                    CLC                         
                    ADC.b #$08                  
                    AND.b #$F0                  
                    STA.b $E6                   
                    STA.w $0212                 
                    LDA.b $1F,x                 
                    ADC.b #$00                  
                    STA.b $01                   
                    JSR.w CODE_13F9EE           
                    PLA                         
                    BCS   CODE_13FA41                   
                    JSL.l CODE_128BF4           
CODE_13FA41:        RTL                         

CODE_13FA42:        LDA.w $0628                 
                    BNE   CODE_13FA5B           
                    LDA.b $14                   
                    STA.w $0511                 
                    LDA.b $28                   
                    STA.w $0513                 
                    LDA.b $1E                   
                    STA.w $0512                 
                    LDA.b $32                   
                    STA.w $0514                 
CODE_13FA5B:        RTL                         

CODE_13FA5C:        LDX.b $E9                   
                    JSR.w CODE_13FA69           
                    LDA.b $E6                   
                    CLC                         
                    ADC.b $E5                   
                    STA.b $E7                   
                    RTS                         

CODE_13FA69:        STY.w $02F5                 
                    LDA.w $0628                 
                    BEQ   CODE_13FA75           
                    LDA.b #$00                  
                    BRA   CODE_13FA7B           

CODE_13FA75:        LDY.w $0534                 
                    LDA   DATA_11AB11,y               
CODE_13FA7B:        CLC                         
                    ADC.w DATA_11AAFB,x               
                    STA.b $02                   
                    LDA.w DATA_11AAF0,x               
                    STA.b $01                   
                    LDA.w DATA_11AB06,x               
                    STA.b $03                   
                    LDY.w $02F5                 
                    RTS                         

CODE_13FA8F:        STA.b $0F                   
                    TYA                         
                    BMI   CODE_13FAA5           
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    ASL   A                     
                    CLC                         
                    ADC.b $0F                   
                    BCS   CODE_13FAA1                   
                    CMP.b #$F0                  
                    BCC   CODE_13FAA5           
CODE_13FAA1:        CLC                         
                    ADC.b #$10                  
                    INY                         
CODE_13FAA5:        RTS                         

CODE_13FAA6:        LDA.w $05,y               
                    SEC                         
                    SBC.w $0006,y               
                    BPL   CODE_13FAB5           
                    EOR.b #$FF                  
                    CLC                         
                    ADC.b #$01                  
                    DEX                         
CODE_13FAB5:        SEC                         
                    SBC.b $09,x                 
                    RTS                         

CODE_13FAB9:        LDA.w $05,y               
                    SEC                         
                    SBC.w $0006,y               
                    STA.w $06,y               
                    LDA.w $01,y               
                    SBC.w $0002,y               
                    BPL   CODE_13FADD           
                    EOR.b #$FF                  
                    PHA                         
                    LDA.w $06,y               
                    EOR.b #$FF                  
                    CLC                         
                    ADC.b #$01                  
                    STA.w $06,y               
                    PLA                         
                    ADC.b #$00                  
                    DEX                         
CODE_13FADD:        CMP.b #$00                  
                    BEQ   CODE_13FAE3           
                    SEC                         
                    RTS                         

CODE_13FAE3:        LDA.w $06,y               
                    SBC.b $09,x                 
                    RTS                         

CODE_13FAE9:        TXA                         
                    PHA                         
                    LDY.b #$02                  
CODE_13FAED:        TYA                         
                    TAX                         
                    INX                         
                    CPY.b #$00                  
                    BNE   CODE_13FAFD           
                    LDA.b $EB                   
                    BNE   CODE_13FAFD           
                    JSR.w CODE_13FAA6           
                    BRA   CODE_13FB00           

CODE_13FAFD:        JSR.w CODE_13FAB9           
CODE_13FB00:        BCS   CODE_13FB0F                   
                    PHA                         
                    TYA                         
                    LSR   A                     
                    TAX                         
                    PLA                         
                    STA.w $0426,x               
                    DEY                         
                    DEY                         
                    BPL   CODE_13FAED           
                    CLC                         
CODE_13FB0F:        PLA                         
                    TAX                         
                    RTL                         

CODE_13FB12:        LDA.w $04C7                 
                    BEQ   CODE_13FB47           
                    DEC.w $04C7                 
                    REP   #$20                  
                    LDY.w $04C7                 
                    BNE   CODE_13FB2D           
                    TYA                         
                    AND.w #$0003                
                    TAX                         
                    LDA.l DATA_11AB7B,x             
                    TXY                         
                    BRA   CODE_13FB30           

CODE_13FB2D:        LDA.w $04BC                 
CODE_13FB30:        STA.w $0C00                 
                    LDA.w $12D1,y               
                    STA.w $0C02                 
                    LDA.w $12D2,y               
                    STA.w $0C04                 
                    LDA.w $12D3,y               
                    STA.w $0C06                 
                    SEP   #$20                  
CODE_13FB47:        LDA.b #$28                  
                    STA.b $00                   
                    LDA.w $04C3                 
                    BEQ   CODE_13FB56           
                    AND.b #$F0                  
                    LSR   A                     
                    LSR   A                     
                    ADC.b #$04                  
CODE_13FB56:        TAX                         
                    LDY.b #$00                  
                    LDA.b #$FE                  
                    STA.b $03                   
CODE_13FB5D:        LDA.l DATA_11AB63,x             
                    STA.w $0802,y               
                    STA.w $0806,y               
                    LDA.b #$08                  
                    STA.w $0800,y               
                    LDA.l DATA_11AB63,x             
                    AND.b #$02                  
                    EOR.b #$02                  
                    CLC                         
                    ADC.b #$32                  
                    STA.w $0803,y               
                    LDA.b $00                   
                    STA.w $0801,y               
                    CLC                         
                    ADC.b #$10                  
                    STA.b $00                   
                    PHY                         
                    TYA                         
                    LSR   A                     
                    LSR   A                     
                    TAY                         
                    LDA.b #$02                  
                    STA.w $0A20,y               
                    PLY                         
                    TYA                         
                    CLC                         
                    ADC.b #$04                  
                    TAY                         
                    INX                         
                    INC.b $03                   
                    LDA.b $03                   
                    CMP.w $04C4                 
                    BNE   CODE_13FB5D           
                    LDA.w $04C5                 
                    BEQ   CODE_13FBC1           
                    DEC.w $04C5                 
                    LSR   A                     
                    AND.b #$01                  
                    TAY                         
                    LDA.w $0206                 
                    BPL   CODE_13FBB1           
                    INY                         
                    INY                         
CODE_13FBB1:        PHB                         
                    LDA.b #$11                  
                    PHA                         
                    PLB                         
                    LDA   DATA_11AB77,y               
                    STA.w $04C6                 
                    PLB                         
                    JSL.l CODE_12BAAE           
CODE_13FBC1:        RTL                         

CODE_13FBC2:        PHX                       ; Preserve sprite index.
                    LDX.w $0628               ; \ Don't flash colours if in potion room.
                    CPX.b #$02                ;  |
                    BEQ   CODE_13FC1A         ; /
                    REP   #$20                ; A = 16-bit
                    AND.w #$00FF              ; \ If value is zero...
                    BEQ   CODE_13FBDF         ; / branch.
                    LDA.b $10                 ; \ Flash through 4 different colours...
                    AND.w #$0003              ;  | <--
                    TAX                       ;  |
                    LDA.w DATA_11AB83,x         ;  | Apparently, the 16-bit colour values interfer with eachother (no ASL is included, table is not 8 bytes long but only 5 bytes)
                    STA.w $0B00               ;  | This may complicate hex editing the colours to your likings.
                    BRA   CODE_13FBED         ; /

CODE_13FBDF:        STZ.w $0B00               ; No flashing BG colour.
                    LDA.w $04EF                 
                    AND.w #$00FF                
                    BNE   CODE_13FC1C           
                    LDA.w $04BC                 
CODE_13FBED:        STA.w $0712                 
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    LSR   A                     
                    AND.w #$001F                
                    SEP   #$20                  
                    ORA.b #$40                  
                    STA.w $023E                 
                    LDA.w $0712                 
                    AND.b #$1F                  
                    ORA.b #$20                  
                    STA.w $023D                 
                    LDA.w $0713                 
                    LSR   A                     
                    LSR   A                     
                    AND.b #$1F                  
                    ORA.b #$80                  
                    STA.w $023F                 
CODE_13FC15:        LDA.b #$01                ; \ Update palettes.
                    STA.w $02A9               ; /
CODE_13FC1A:        PLX                       ; Pull sprite index.
                    RTL                       ; Return.

CODE_13FC1C:        LDA.w $04BC                 
                    STA.w $0B00                 
                    SEP   #$20                  
                    LDX.b #$0A                  
                    LDA.w $0533                 
                    CMP.b #$05                  
                    BEQ   CODE_13FC45           
                    CMP.b #$0F                  
                    BNE   CODE_13FC47           
                    LDA.w $0534                 
                    CMP.b #$05                  
                    BEQ   CODE_13FC45           
                    CMP.b #$03                  
                    BEQ   CODE_13FC45           
                    CMP.b #$04                  
                    BNE   CODE_13FC47           
                    LDA.w $051B                 
                    BEQ   CODE_13FC47           
CODE_13FC45:        LDX.b #$05                  
CODE_13FC47:        TXA                         
                    ORA.b #$20                  
                    STA.w $023D                 
                    TXA                         
                    ORA.b #$40                  
                    STA.w $023E                 
                    TXA                         
                    ORA.b #$80                  
                    STA.w $023F                 
                    BRA   CODE_13FC15         ; Update palettes and return appropiately.

CODE_13FC5B:        REP   #$30                  
                    LDY.w #$0120                
CODE_13FC60:        LDA.w $0801,y               
                    AND.w #$00FF                
                    CMP.w #$00F0                
                    BNE   CODE_13FC76           
                    LDA.w $0805,y               
                    AND.w #$00FF                
                    CMP.w #$00F0                
                    BEQ   CODE_13FC81           
CODE_13FC76:        TYA                         
                    CLC                         
                    ADC.w #$0004                
                    TAY                         
                    CPY.w #$01C0                
                    BNE   CODE_13FC60           
CODE_13FC81:        STY.w $02F8                 
                    SEP   #$30                  
                    LDX.b $12                   
                    RTL                         

CODE_13FC89:        LDY.w $0533               ; \ Get level + room number into X index.
                    LDA   DATA_11D098,y       ;  | 
                    CLC                       ;  |
                    ADC.w $0534               ;  |
                    TAX                       ;  |
                    LDA.l DATA_11CF52,x       ;  | Check HDMA BG table. 
                    CMP.b #$FF                ;  | If value = $FF, don't load a HDMA BG.
                    BEQ   CODE_13FCA0         ; /
                    JSL.l CODE_14FAE8         ; Load HDMA BG.
CODE_13FCA0:        RTL                       ; Return.