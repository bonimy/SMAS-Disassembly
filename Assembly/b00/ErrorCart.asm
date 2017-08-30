; Super Mario All-Stars   (U) disassembly                        ;
; Disassembled by Roy and Ersanio and imamelia and wiiqwertyuiop ;
;                                                                ;
; Commenting and organization by SWR                             ;
;                                                                ;
; Code to display error message for invalid cartridge type goes  ;
; here.                                                          ;

;-------Text used by "Incorrect Cartridge Type" error message
DATA_009307:        dw $003B,$001D,$0011,$0012 ;\ " THIS GAME PAK IS NOT   "
                    dw $001C,$003B,$0010,$000A ; |
                    dw $0016,$000E,$003B,$0019 ; |
                    dw $000A,$0014,$003B,$0012 ; |
                    dw $001C,$003B,$0017,$0018 ; |
                    dw $001D,$003B,$003B,$003B ; |
                    dw $000D,$000E,$001C,$0012 ; |"DESIGINED FOR YOUR SUPER" (sic)
                    dw $0010,$0012,$0017,$000E ; |
                    dw $000D,$003B,$000F,$0018 ; |
                    dw $001B,$003B,$0022,$0018 ; |
                    dw $001E,$001B,$003B,$001C ; |
                    dw $001E,$0019,$000E,$001B ; |
                    dw $000F,$000A,$0016,$0012 ; |"FAMICOM OR SUPER NES.   "
                    dw $000C,$0018,$0016,$003B ; |
                    dw $0018,$001B,$003B,$001C ; |
                    dw $001E,$0019,$000E,$001B ; |
                    dw $003B,$0017,$000E,$001C ; |
                    dw $0026,$003B,$003B,$003B ; |
                    dw $003B,$003B,$003B,$0017 ; |"   NINTENDO CO.,LTD.    "
                    dw $0012,$0017,$001D,$000E ; |
                    dw $0017,$000D,$0018,$003B ; |
                    dw $000C,$0018,$0026,$0027 ; |
                    dw $0015,$001D,$000D,$0026 ; |
                    dw $003B,$003B,$003B,$003B ;/

;-------Error message: cartridge not designed for this type of SNES
CODE_0093C7:        JSR.w CODE_0083B9         ;Initialize RAM, VRAM, and DMA registers
                    SEP   #$20                ;8-bit A
                    PHD                       ;Push direct page
                    STZ.w $2121               ;Initialize CGRAM address
                    REP   #$20                ;16-bit A
                    LDA.w #$3B3B              ;\
                    STA.b $02                 ; |Initialize BG1 tilemap buffer
                    LDA.w #$0800              ; |Value: #$3B (high byte is ignored)
                    STA.b $00                 ; |Dest: $00:0800
                    LDY.b #$00                ; |Size: 0x800 bytes (0x400 tiles)
                    JSL.l CODE_008690         ;/
                    LDA.w #$4300              ;\Direct page: $4300
                    TCD                       ;/
                    LDY.b #$80                ;\Increment after writing $2119/reading $213A
                    STY.w $2115               ;/
                    LDA.w #$7FFF              ;\
                    STA.w $0200+($0C<<1)      ; |Write four colors to palette buffer
                    LDA.w #$7FF9              ; |
                    STA.w $0200+($0D<<1)      ; |$0C: (248, 248, 248) - White
                    LDA.w #$7FD0              ; |$0D: (200, 248, 248) - Light blue
                    STA.w $0200+($0E<<1)      ; |$0E: (128, 240, 248) - Medium Blue
                    LDA.w #$6AE9              ; |$0F: ( 72, 184, 208) - Dark blue
                    STA.w $0200+($0F<<1)      ;/
                    LDA.w #$2200              ;\
                    STA.b $4300               ; |Write palette data to CGRAM
                    LDA.w #$0200              ; |
                    STA.b $4302               ; |Base register: $2122 (CGRAM Data write)
                    LDX.b #$00                ; |Writing mode: 1 regs write once
                    STX.b $4304               ; |DMA source: $00:0200
                    STA.b $4305               ; |DMA Size: 0x200 bytes (0x100 colors)
                    LDY.b #$01                ; |
                    STY.w $420B               ;/
                    LDA.w #$1801              ;\
                    STA.b $4300               ; |Write GFX data to VRAM
                    LDA.w #$0000>>1           ; |
                    STA.w $2116               ; |Base register: $2118 (VRAM Data Write low byte)
                    LDA.w #DATA_198000+$1800  ; |Writing mode: 2 regs write once
                    STA.b $4302               ; |Source: $19:9800 (SMB2 text GFX)
                    LDX.b #DATA_198000>>$10   ; |Dest: VRAM $0000
                    STX.b $4304               ; |Size: 0x800 bytes (0x40 tiles)
                    LDA.w #$0800              ; |
                    STA.b $4305               ; |
                    STY.w $420B               ;/
                    PHB                       ;Push program bank
                    LDX.b #$00                ;\
                    PHX                       ; |Set program bank: $00
                    PLB                       ;/
                    LDX.b #$00                ;Initialize loop index
-                   LDA.w DATA_009307+$00,x   ;\
                    STA.w $0800+($0E5<<1),x   ; |Write text to BG1 tilemap buffer
                    LDA.w DATA_009307+$30,x   ; |
                    STA.w $0800+($125<<1),x   ; |" THIS GAME PAK IS NOT   "
                    LDA.w DATA_009307+$60,x   ; |"DESIGINED FOR YOUR SUPER"
                    STA.w $0800+($165<<1),x   ; |"FAMICOM OR SUPER NES.   "
                    LDA.w DATA_009307+$90,x   ; |
                    STA.w $0800+($225<<1),x   ; |"   NINTENDO CO.,LTD.    "
                    INX                       ; |
                    INX                       ; |
                    CPX.b #$18<<1             ; |
                    BNE   -                   ;/

;-------Display error text on screen forever
CODE_009459:        PLB                       ;Recover program bank
                    LDA.w #$2000>>1           ;\
                    STA.w $2116               ; |Write BG1 tilemap to VRAM
                    LDA.w #$0800              ; |
                    STA.b $4302               ; |
                    LDX.b #$00                ; |Source: $00:0800
                    STX.b $4304               ; |Dest: VRAM $2000
                    STA.b $4305               ; |Size 0x800 bytes (0x400 tiles)
                    STY.w $420B               ;/
                    SEP   #$20                ;8-bit A
                    PLD                       ;Recover direct page.
                    LDA.b #($2000>>$B)<<2     ;\BG1 tilemap address: $2000
                    STA.w $2107               ;/width: 0x40 tiles, height: 0x40 tiles
                    STZ.w $210B               ;BG1 GFX address: $0000
                    LDA.b #$01                ;\Enable BG1 on main screen
                    STA.w $212C               ;/
                    STZ.w $212D               ;Disable subscreen
                    LDA.b #$01                ;\Mode 1, 8x8 tiles
                    STA.w $2105               ;/
                    STZ.w $2130               ;No color math/clipping
                    STZ.w $2131               ;No CGADSUB
                    STZ.w $210D               ;\
                    STZ.w $210D               ; |No BG1 horizontal
                    STZ.w $210E               ; |or vertical scroll
                    STZ.w $210E               ;/
                    STZ.w $210F               ;\
                    STZ.w $210F               ; |No BG2 horizontal
                    STZ.w $2110               ; |or vertical scroll
                    STZ.w $2110               ;/
                    STZ.w $2111               ;\
                    STZ.w $2111               ; |No BG3 horizontal
                    STZ.w $2112               ; |or vertical scroll
                    STZ.w $2112               ;/
                    LDA.b #$0F                ;\Maximum brightness
                    STA.w $2100               ;/
.loop               BIT.w $4212               ;\Wait for VBlank
                    BPL   .loop               ;/
                    INC.b $FD                 ;\
                    LDA.b $FD                 ; |Wait 24 (0x18) frames
                    CMP.b #$18                ; |
                    BNE   .wait               ;/
                    STZ.b $FD                 ;Reset frame counter
                    STZ.w $2121               ;Initialize CGRAM address
                    REP   #$20                ;16-bit A
                    LDA.w #$4300              ;\Direct page: $4300
                    TCD                       ;/
                    LDY.b #$80                ;\Increment after writing $2119/reading $213A
                    STY.w $2115               ;/
                    LDA.w $0200+($0D<<1)      ;\
                    PHA                       ; |Rotate the three blue tints
                    LDA.w $0200+($0E<<1)      ; |back by one cell
                    STA.w $0200+($0D<<1)      ; |
                    LDA.w $0200+($0F<<1)      ; |
                    STA.w $0200+($0E<<1)      ; |
                    PLA                       ; |
                    STA.w $0200+($0F<<1)      ;/
                    LDA.w #$2200              ;\
                    STA.b $4300               ; |Write palette data to CGRAM
                    LDA.w #$0200              ; |
                    STA.b $4302               ; |Base register: $2122 (CGRAM Data write)
                    LDX.b #$00                ; |Writing mode: 1 regs write once
                    STX.b $4304               ; |DMA source: $00:0200
                    STA.b $4305               ; |DMA Size: 0x200 bytes (0x100 colors)
                    LDY.b #$01                ; |
                    STY.w $420B               ;/
                    LDA.w #$0000              ;\
                    TCD                       ;/Direct page: $0000
                    SEP   #$20                ;8-bit A
.wait               BIT.w $4212               ;\Wait for VBlank to end
                    BMI   .wait               ;/
                    JMP.w .loop               ;Loop forever.