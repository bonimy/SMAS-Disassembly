; Super Mario All-Stars   (U) disassembly                        ;
; Disassembled by Roy and Ersanio and imamelia and wiiqwertyuiop ;
;                                                                ;
; Commenting and organization by SWR                             ;
;                                                                ;
; Memory initialization routines and common functions go here    ;

;-------Initializes RAM, VRAM, DMA, and SPC
CODE_0083B6:        JSR.w CODE_008A4F         ;Upload SPC engine + audio data of hall and menu screen
CODE_0083B9:        REP   #$20                ;16-bit A
                    LDA.w #$0150              ;\
                    STA.b $00                 ; |Clear memory
                    LDA.w #$0000              ; |Source: $7E:0000
                    TAY                       ; |Size: 0x150 bytes
                    JSL.l CODE_00868E         ;/
                    LDA.w #$1E00              ;\
                    STA.b $00                 ; |Clear memory (note that stack memory is not touched)
                    LDA.w #$0200              ; |Source: $7E:0200
                    TAY                       ; |Size: 0x1E00 bytes
                    JSL.l CODE_00868E         ;/
                    LDA.w #$E000              ;\
                    STA.b $00                 ; |Clear memory
                    LDA.w #$2000              ; |Source: $7E:2000
                    LDY.b #$7E                ; |Size: 0xE000 bytes
                    JSL.l CODE_00868E         ;/
                    LDA.w #$0000              ;\
                    STA.b $00                 ; |Clear memory
                    LDA.w #$0000              ; |Source: $7F:0000
                    LDY.b #$7F                ; |Size: 0x10000 bytes
                    JSL.l CODE_00868E         ;/
                    LDA.w #$0000              ;\
                    STA.l $7F8000             ; |Write #$0000 to $7F:8000
                    DEC   A                   ; |then #$FFFF to $7F:8002.
                    STA.l $7F8002             ;/
                    SEP   #$20                ;8-bit A
                    LDX.b #$00                ;Set X-register to #$00
                    JSL.l CODE_00849C         ;Initialize DMA registers and IRQ
                    PHD                       ;Push Direct page
                    LDA.b #$01                ;\
                    XBA                       ; |Direct page: $0100
                    LDA.b #$00                ; |
                    TCD                       ;/
                    STZ.w $2133               ;Clear Screen Mode/Video Select
                    JSR.w CODE_00841A         ;Setup hardware RAM addresses of menu screens
                    PLD                       ;Recover direct page
                    LDA.b #$01                ;\
                    STA.l $000AC0             ;/Set "Upload palette" flag.
                    RTS                       ;

;--------Writes all hardware mirrors (except screen display) to their respective registers.
CODE_00841A:        REP   #$10                ;16-bit XY
                    LDA.b $0101               ;\Object size and CHR address
                    STA.w $2101               ;/
                    LDX.b $0104               ;\BG1/BG2 Tilemap Address and Size
                    STX.w $2107               ;/
                    LDA.b $0106               ;\BG3 Tilemap Address and Size
                    STA.w $2109               ;/
                    LDA.b $0107               ;\BG1/BG2 Character address
                    STA.w $210B               ;/
                    LDA.b $0108               ;\
                    STA.w $210D               ; |BG1 Horizontal Scroll
                    LDA.b $0109               ; |
                    STA.w $210D               ;/
                    LDA.b $010A               ;\
                    STA.w $210E               ; |BG1 Vertical Scroll
                    LDA.b $010B               ; |
                    STA.w $210E               ;/
                    LDA.b $010C               ;\
                    STA.w $210F               ; |BG2 Horizontal Scroll
                    LDA.b $010D               ; |
                    STA.w $210F               ;/
                    LDA.b $010E               ;\
                    STA.w $2110               ; |BG2 Vertical Scroll
                    LDA.b $010F               ; |
                    STA.w $2110               ;/
                    LDA.b $0110               ;\
                    STA.w $2111               ; |BG3 Horizontal Scroll
                    LDA.b $0111               ; |
                    STA.w $2111               ;/
                    LDA.b $0112               ;\
                    STA.w $2112               ; |BG3 Vertical Scroll
                    LDA.b $0113               ; |
                    STA.w $2112               ;/
                    LDA.b $011D               ;\
                    STA.w $2132               ; |
                    LDA.b $011E               ; |Fixed Color data
                    STA.w $2132               ; |
                    LDA.b $011F               ; |
                    STA.w $2132               ;/
                    LDX.b $0117               ;\Main/Subscreen designation
                    STX.w $212C               ;/
                    LDX.b $0119               ;\Main/Subscreen Window Mask designation
                    STX.w $212E               ;/
                    LDX.b $0114               ;\BG1/2/3/4 Window Mask settings
                    STX.w $2123               ;/
                    LDA.b $0116               ;\OBJ/Color Window Mask settings
                    STA.w $2125               ;/
                    LDX.b $011B               ;\Color addition select/CGADSUB
                    STX.w $2130               ;/
                    LDX.b $0102               ;\BG and Character Size/Pixelation
                    STX.w $2105               ;/
                    SEP   #$10                ;8-bit XY
                    RTS                       ;

;-------Initialize DMA registers and data for Hall Screen (X=0) or GAME SELECT (X=1)
CODE_00849C:        JSL.l CODE_00882E         ;Force blank + HDMA-Disable
                    PHD                       ;Push direct page
                    LDA.b #$01                ;\
                    XBA                       ; |Direct page: $0100
                    LDA.b #$00                ; |
                    TCD                       ;/
                    TXA                       ;\Ignore IRQ initialization during the
                    BEQ   +                   ;/Hall Screen
                    LDA.b #$01                ;\Enable general IRQ flag
                    STA.w $0124               ;/
                    LDA.b #$37                ;\IRQ V-timer low byte (sets the BG1 scroll height
                    STA.w $0125               ;/during the game select screen)
                    PHB                       ;Push data bank
                    PHX                       ;Push X
                    REP   #$30                ;16-bit AXY
                    LDA.l $D0                 ;\
                    AND.w #$0003              ; |Set initial BG1 H-scroll. The value is
                    ASL   A                   ; |indexed by the current game value.
                    TAX                       ; |
                    LDA.w DATA_008559,x       ; |
                    STA.w $0214               ;/
                    LDX.w #DATA_02F000        ;\
                    LDY.w #$1000              ; |Upload GAME SELECT BG1 tilemap
                    LDA.w #$0FFF              ; |src: $02:F000, dest: $7F:1000, size: 0x1000 bytes
                    MVN   $7F,DATA_02F000>>$10;/
                    SEP   #$30                ;8-bit AXY
                    PLX                       ;Recover X
                    PLB                       ;Recover program bank
+                   LDA.w DATA_008873,x       ;\
                    STA.b $010A               ; |BG1 Vertical scroll mirror
                    LDA.w DATA_008875,x       ; |
                    STA.b $010B               ;/
                    LDA.w DATA_00885D,x       ;\
                    STA.b $0101               ; |Sprite and object size mirrors
                    LDA.w DATA_00885F,x       ; |
                    STA.b $0102               ;/
                    STZ.b $0103               ;Disable screen pixelation
                    LDA.w DATA_008861,x       ;\
                    STA.b $0104               ; |BG Tilemap Address and Size mirrors
                    LDA.w DATA_008863,x       ; |
                    STA.b $0105               ; |
                    LDA.w DATA_008865,x       ; |
                    STA.b $0106               ;/
                    LDA.w DATA_008867,x       ;\BG1/BG2 CHR Address
                    STA.b $0107               ;/
                    LDA.w DATA_008869,x       ;\BG3/BG4 CHR Address
                    STA.w $210C               ;/(has no mirror address)
                    LDA.b #$20                ;\
                    STA.b $011D               ; |Fixed color data.
                    ASL   A                   ; |r = #$00
                    STA.b $011E               ; |g = #$00
                    ASL   A                   ; |b = #$00
                    STA.b $011F               ;/
                    LDA.w DATA_00886B,x       ;\
                    STA.b $0117               ; |Screen designation mirrors
                    LDA.w DATA_00886D,x       ; |
                    STA.b $0118               ;/
                    LDA.w DATA_00886F,x       ;\
                    STA.b $011B               ; |Color addition and color math mirrors
                    LDA.w DATA_008871,x       ; |
                    STA.b $011C               ;/
                    STZ.b $0119               ;\
                    STZ.b $011A               ; |Window Designation and Setting mirrors
                    STZ.b $0114               ; |
                    STZ.b $0115               ; |Disable all window masking
                    STZ.b $0116               ;/
                    REP   #$20                ;16-bit A
                    LDA.w #$4300              ;\Set direct page to $4300
                    TCD                       ;/
                    JSR.w CODE_008565         ;Upload Hall Screen/Game Select data to VRAM
                    PLD                       ;Pull direct page
                    TXA                       ;\
                    AND.w #$00FF              ; |Double X register so it
                    ASL   A                   ; |can index words
                    TAX                       ;/
                    LDA.w #$0200              ;\
                    STA.b $00                 ; |Upload Palette data
                    LDA.w PNTR_0088BF,x       ; |
                    LDY.b #DATA_3C8E00>>$10   ; |Source: $3C:[$8E00, $B400](x)
                    STA.b $02                 ; |Dest: $7F:9200
                    STY.b $04                 ; |Size: 0x200 bytes
                    LDA.w #$9200              ; |
                    LDY.b #$7F                ; |
                    JSL.l CODE_00866D         ;/
                    SEP   #$20                ;8-bit A
                    RTL                       ;

DATA_008559:        dw $0000,$0078,$00F8,$017C              ;BG1 H-Scroll in GAME SELECT during IRQ

PNTR_008561:        dw CODE_00857A                          ;Upload "Hall Screen" tiles to VRAM
                    dw CODE_0085FF                          ;Upload "Game select" tiles to VRAM

;-------Upload Hall Screen(X=0) or game select(X=1) tiles to VRAM.
CODE_008565:        PHX                       ;Push X-register
                    LDY.b #$80                ;\increment after writing $2118/reading $2139
                    STY.w $2115               ;/
                    LDA.b #$01                ;\
                    CLC                       ; |DMA mode 01: 2 regs write once
                    STA.b $4300               ;/
                    LDY.b #$01                ;DMA Channel #0
                    TXA                       ;\
                    ASL   A                   ; |Upload Hall Screen(X=0) or game select(X=1) tiles to VRAM.
                    TAX                       ; |
                    JSR.w (PNTR_008561,x)     ; |
                    PLX                       ; |
                    RTS                       ;/

;Upload Hall Screen tiles to VRAM
CODE_00857A:        LDA.w #$0000>>1           ;\
                    STA.w $2116               ; |Upload BG1 GFX
                    LDA.w #DATA_018000        ; |
                    STA.b $4302               ; |VRAM: $0000
                    LDX.b #DATA_018000>>$10   ; |Source: $01:8000
                    STX.b $4304               ; |Size: 0x8000 bytes
                    LDA.w #$8000              ; |
                    STA.b $4305               ; |
                    STY.w $420B               ;/
                    LDA.w #DATA_3DCC00        ;\
                    STA.b $4302               ; |Upload Animated BG1 GFX data
                    LDX.b #DATA_3DCC00>>$10   ; |
                    STX.b $4304               ; |VRAM: $8000
                    LDA.w #$1400              ; |Source: $3D:CC00
                    STA.b $4305               ; |Size: 0x1400 bytes
                    STY.w $420B               ;/
                    LDA.w #$A000>>1           ;\
                    STA.w $2116               ; |Upload BG2 GFX (fading triangles)
                    LDA.w #DATA_029000        ; |
                    STA.b $4302               ; |VRAM: $A000
                    LDX.b #DATA_029000>>$10   ; |Source: $02:9000
                    STX.b $4304               ; |Size: 0x800 bytes
                    LDA.w #$0800              ; |
                    STA.b $4305               ; |
                    STY.w $420B               ;/
                    LDA.w #$C000>>1           ;\
                    STA.w $2116               ; |Upload OBJ GFX (intro logo)
                    LDA.w #DATA_028000        ; |
                    STA.b $4302               ; |VRAM: $C000
                    LDX.b #DATA_028000>>$10   ; |Source: $02:8000
                    STX.b $4304               ; |Size: 0x1000 bytes
                    LDA.w #$1000              ; |
                    STA.b $4305               ; |
                    STY.w $420B               ;/
                    LDA.w #$E000>>1           ;\
                    STA.w $2116               ; |Upload BG2 tilemap (fading triangles)
                    LDA.w #DATA_02C000        ; |
                    STA.b $4302               ; |VRAM: $E000
                    LDX.b #DATA_02C000>>$10   ; |Source: $02:C000
                    STX.b $4304               ; |Size: 0x800 bytes
                    LDA.w #$0800              ; |
                    STA.b $4305               ; |
                    STY.w $420B               ;/
                    LDA.w #$F000>>1           ;\
                    STA.w $2116               ; |Upload BG1 tilemap
                    LDA.w #DATA_3C8000        ; |
                    STA.b $4302               ; |VRAM: $F000
                    LDX.b #DATA_3C8000>>$10   ; |Source: $3C:8000
                    STX.b $4304               ; |Size: 0x800 bytes
                    LDA.w #$0800              ; |
                    STA.b $4305               ; |
                    STY.w $420B               ;/
                    RTS                       ;

;-------Upload game select tiles to VRAM
CODE_0085FF:        LDA.w #$0000>>1           ;\
                    STA.w $2116               ; |Upload BG1 GFX (part 1)
                    LDA.w #DATA_2B8000        ; |
                    STA.b $4302               ; |VRAM: $0000
                    LDX.b #DATA_2B8000>>$10   ; |Source: $2B:8000
                    STX.b $4304               ; |Size: 0x8000 bytes
                    LDA.w #$8000              ; |
                    STA.b $4305               ; |
                    STY.w $420B               ;/
                    LDA.w #DATA_2C8000        ;\
                    STA.b $4302               ; |Upload BG1 GFX (part 2)
                    LDX.b #DATA_2C8000>>$10   ; |
                    STX.b $4304               ; |VRAM: $8000
                    LDA.w #$5800              ; |Source: $2C:8000
                    STA.b $4305               ; |Size: 0x5800
                    STY.w $420B               ;/
                    LDA.w #$D800>>1           ;\
                    STA.w $2116               ; |Upload BG2 tilemap (fading triangles)
                    LDA.w #DATA_02C000        ; |
                    STA.b $4302               ; |VRAM: $D800
                    LDX.b #DATA_02C000>>$10   ; |Source: $02:C000
                    STX.b $4304               ; |Size: 0x800 bytes
                    LDA.w #$0800              ; |
                    STA.b $4305               ; |
                    STY.w $420B               ;/
                    LDA.w #$E000>>1           ;\
                    STA.w $2116               ; |Upload BG2 GFX (fading triangles)
                    LDA.w #DATA_3DA800        ; |
                    STA.b $4302               ; |VRAM: $E000
                    LDX.b #DATA_3DA800>>$10   ; |Source: $3D:A800
                    STX.b $4304               ; |Size: 0x800 bytes
                    LDA.w #$0800              ; |
                    STA.b $4305               ; |
                    STY.w $420B               ;/
                    LDA.w #$F000>>1           ;\
                    STA.w $2116               ; |Upload BG1 tilemap
                    LDA.w #DATA_02F000        ; |
                    STA.b $4302               ; |VRAM: $F000
                    LDX.b #DATA_02F000>>$10   ; |Source: $02:F000
                    STX.b $4304               ; |Size: 0x1000 bytes
                    LDA.w #$1000              ; |
                    STA.b $4305               ; |
                    STY.w $420B               ;/
                    RTS                       ;

;-------DMA memory copy routine
CODE_00866D:        STA.w $2181               ;\
                    STY.w $2183               ; |
                    LDA.w #$8000              ; |
                    STA.w $4300               ; |
                    LDA.b $02                 ; |
                    STA.w $4302               ; |Input: $7E0002 - 3 bytes - source address
                    LDY.b $04                 ; |       $7E0000 - 2 bytes - size
                    STY.w $4304               ; |A = destination RAM (16-bit)
                    LDA.b $00                 ; |Y = RAM bank (8-bit)
                    STA.w $4305               ; |
                    LDY.b #$01                ; |
                    STY.w $420B               ;/
                    RTL                       ;

;-------Zero out a memory region
CODE_00868E:        STZ.b $02                 ;

;-------Fill a memory region with the same value
CODE_008690:        STA.w $4302               ;\
                    STY.w $4304               ; |
                    LDA.w #$3480              ; | Input:
                    STA.w $4300               ; | A: Dest low and high
                    LDA.b $00                 ; | Y: Dest bank
                    STA.w $4305               ; | $00: DMA Size
                    LDY.b #$01                ; | $02: 16-bit value to transfer
                    STY.w $211B               ; |
                    DEY                       ; |
                    STY.w $211B               ; |
                    LDY.b $02                 ; |
                    STY.w $211C               ; |
                    LDY.b #$01                ; |
                    STY.w $420B               ;/
                    RTL                       ;

CODE_0086B5:        LDA.w $4016               ;\NES-styled Joypad data 1
                    AND.b #$01                ; |Read if the latch is open
                    EOR.b #$01                ; |Reverse the latch status
                    ASL   A                   ; |Multiply by 2
                    STA.l $701FF4             ;/Store into SRAM
                    LDA.w $4017               ;
                    AND.b #$01                ;
                    ASL   A                   ;
                    STA.l $701FF6             ;
                    RTL                       ;

;-------Get controller data for this frame
CODE_0086CC:        STZ.w $4016               ;Unlatch the joypads
                    LDA.w $4218               ;\
                    STA.b $00                 ; |Copy Controller Port 1 Data1 Register
                    LDA.w $4219               ; |to scratch RAM
                    STA.b $01                 ;/
                    LDA.b $00                 ;\$00:00F2 is the controller data for this frame
                    STA.b $F2                 ;/
                    TAY                       ;Save controller data to Y register
                    EOR.b $FA                 ;\
                    AND.b $F2                 ; |$00:000F6 is new controller data for this frame
                    STA.b $F6                 ;/
                    STY.b $FA                 ;$00:00FA is controller data from last frame
                    LDA.b $01                 ;\
                    STA.b $F0                 ; |Repeat process for Controller Port 1
                    TAY                       ; |Data1 Register high byte
                    EOR.b $F8                 ; |
                    AND.b $F0                 ; |
                    STA.b $F4                 ; |
                    STY.b $F8                 ;/
                    NOP                       ;[]
                    LDA.w $421A               ;\
                    STA.b $00                 ; |Repeat process for Controller Port 2
                    LDA.w $421B               ; |Data1 Register
                    STA.b $01                 ; |
                    LDA.b $00                 ; |
                    STA.b $F3                 ; |
                    TAY                       ; |
                    EOR.b $FB                 ; |
                    AND.b $F3                 ; |
                    STA.b $F7                 ; |
                    STY.b $FB                 ; |
                    LDA.b $01                 ; |
                    STA.b $F1                 ; |
                    TAY                       ; |
                    EOR.b $F9                 ; |
                    AND.b $F1                 ; |
                    STA.b $F5                 ; |
                    STY.b $F9                 ;/
                    RTS                       ;

;-------Clears the OAM low table
CODE_008719:        PHD                       ;Push Direct Page
                    REP   #$30                ;16-bit AXY
                    LDA.w #$0800              ;\Direct Page: $0800
                    TCD                       ;/
                    LDY.w #$F000              ;\
                    LDX.w #$0180              ; |Write #$F000 to $7E:0800-$7E:09FF
-                   TYA                       ; |(The OAM low table mirror)
                    STA.b $0800+$00,x         ; |
                    STA.b $0800+$04,x         ; |
                    STA.b $0800+$08,x         ; |
                    STA.b $0800+$0C,x         ; |
                    STA.b $0800+$10,x         ; |
                    STA.b $0800+$14,x         ; |
                    STA.b $0800+$18,x         ; |
                    STA.b $0800+$1C,x         ; |
                    STA.b $0800+$20,x         ; |
                    STA.b $0800+$24,x         ; |
                    STA.b $0800+$28,x         ; |
                    STA.b $0800+$2C,x         ; |
                    STA.b $0800+$30,x         ; |
                    STA.b $0800+$34,x         ; |
                    STA.b $0800+$38,x         ; |
                    STA.b $0800+$3C,x         ; |
                    STA.b $0800+$40,x         ; |
                    STA.b $0800+$44,x         ; |
                    STA.b $0800+$48,x         ; |
                    STA.b $0800+$4C,x         ; |
                    STA.b $0800+$50,x         ; |
                    STA.b $0800+$54,x         ; |
                    STA.b $0800+$58,x         ; |
                    STA.b $0800+$5C,x         ; |
                    STA.b $0800+$60,x         ; |
                    STA.b $0800+$64,x         ; |
                    STA.b $0800+$68,x         ; |
                    STA.b $0800+$6C,x         ; |
                    STA.b $0800+$70,x         ; |
                    STA.b $0800+$74,x         ; |
                    STA.b $0800+$78,x         ; |
                    STA.b $0800+$7C,x         ; |
                    TXA                       ; |
                    SEC                       ; |
                    SBC.w #$0080              ; |
                    TAX                       ; |
                    BPL   -                   ;/
                    SEP   #$30                ;8-bit AXY
                    PLD                       ;Recover direct page
                    RTS                       ;

;-------Copies the OAM high table mirror from it's expanded form to its standard form
CODE_008773:        PHD                       ;Push Direct page
                    LDA.b #$0A                ;\
                    XBA                       ; |Direct page: $0A00
                    LDA.b #$00                ; |
                    TCD                       ;/
                    LDY.b #$1C                ;\
-                   TYA                       ; |Each byte of $00:0A20 - $00:0A9F uses only
                    ASL   A                   ; |the lowest two bits which represent the high
                    ASL   A                   ; |table bit properties of the sprite at that index.
                    TAX                       ; |
                    LDA.b $0A20+$03,x         ; |$00:0A00 - $00:0A1F is the actual OAM high table
                    ASL   A                   ; |mirror. The lower two bits of all bytes from
                    ASL   A                   ; |$00:0A20 - $00:0A9F are copied into the proper
                    ORA.b $0A20+$02,x         ; |form starting at $00:0A00.
                    ASL   A                   ; |
                    ASL   A                   ; |
                    ORA.b $0A20+$01,x         ; |
                    ASL   A                   ; |
                    ASL   A                   ; |
                    ORA.b $0A20+$00,x         ; |
                    STA.w $0A00+$00,y         ; |
                    LDA.b $0A20+$07,x         ; |
                    ASL   A                   ; |
                    ASL   A                   ; |
                    ORA.b $0A20+$06,x         ; |
                    ASL   A                   ; |
                    ASL   A                   ; |
                    ORA.b $0A20+$05,x         ; |
                    ASL   A                   ; |
                    ASL   A                   ; |
                    ORA.b $0A20+$04,x         ; |
                    STA.w $0A00+$01,y         ; |
                    LDA.b $0A20+$0B,x         ; |
                    ASL   A                   ; |
                    ASL   A                   ; |
                    ORA.b $0A20+$0A,x         ; |
                    ASL   A                   ; |
                    ASL   A                   ; |
                    ORA.b $0A20+$09,x         ; |
                    ASL   A                   ; |
                    ASL   A                   ; |
                    ORA.b $0A20+$08,x         ; |
                    STA.w $0A00+$02,y         ; |
                    LDA.b $0A20+$0F,x         ; |
                    ASL   A                   ; |
                    ASL   A                   ; |
                    ORA.b $0A20+$0E,x         ; |
                    ASL   A                   ; |
                    ASL   A                   ; |
                    ORA.b $0A20+$0D,x         ; |
                    ASL   A                   ; |
                    ASL   A                   ; |
                    ORA.b $0A20+$0C,x         ; |
                    STA.w $0A00+$03,y         ; |
                    DEY                       ; |
                    DEY                       ; |
                    DEY                       ; |
                    DEY                       ; |
                    BPL   -                   ;/
                    PLD                       ;Recover Direct page
                    RTS                       ;

CODE_0087CC:        LDA.w $62                 ;\
                    BEQ   +++                 ; |Store $62 to $2142 if it has a nonzero value
                    STA.w $2142               ;/
                    CMP.b #$F0                ;\
                    BCS   .start              ; |Store $62 to $66 if it is less than #$F0
                    STA.w $66                 ;/
.start              LDA.w $60                 ;\
                    BNE   +                   ; |If $60 is nonzero or if $2140 is different from
                    LDY.w $2140               ; |$64, then store $60 to $2140 and $64.
                    CPY.w $64                 ; |
                    BNE   ++                  ; |
+                   STA.w $2140               ; |
                    STA.w $64                 ;/
++                  LDA.w $61                 ;\
                    BNE   +                   ; |If $61 is nonzero or if $2141 is different from
                    LDY.w $2141               ; |$65, then store $61 to $2141 and $65.
                    CPY.w $65                 ; |
                    BNE   ++                  ; |
+                   STA.w $2141               ; |
                    STA.w $65                 ;/
++                  LDA.w $63                 ;\
                    BNE   +                   ; |If $63 is nonzero or if $2143 is different from
                    LDY.w $2143               ; |$67, then store $63 to $2143 and $67.
                    CPY.w $67                 ; |
                    BNE   ++                  ; |
+                   STA.w $2143               ; |
                    STA.w $67                 ;/
++                  STZ.w $60                 ;\
                    STZ.w $61                 ; |Clear $60, $61, $62, and $63.
                    STZ.w $62                 ; |
                    STZ.w $63                 ;/
                    RTS                       ;

+++                 LDY.w $2142               ;\
                    CPY.w $66                 ; |Store $62 to $2142 if $2142 and
                    BNE   .start              ; |$66 are equal
                    STA.w $2142               ; |
                    BRA   .start              ;/

CODE_00882E:        LDA.b #$80                ;\Enable forced blank & Disable HDMA
                    STA.w $2100               ; |Forced blank
                    STA.w $0100               ; |Forced blank on mirror too
                    STZ.w $420C               ; |HDMA disable
                    STZ.w $0120               ; |HDMA disable on mirror too
                    RTL                       ;/

DATA_00883D:        db $01,$01,$01,$01,$01,$01,$01,$01 ;
                    db $01,$00,$00,$01,$01,$01,$01,$01 ;
                    db $01,$01,$01,$01,$01,$01,$01,$01 ;
                    db $01,$01,$01,$01,$01,$01,$01,$01 ;

;-------Register values during initialization for Hall Screen or GAME SELECT
;--------The first comment is for Hall Screen, the second is for GAME SELECT
DATA_00885D:        db $03,$00                  ;\8x8 and 16x16 sprites, base address: $C000
                                                ;/8x8 and 16x16 sprites, base address: $0000
DATA_00885F:        db $03,$03                  ;\8x8 BG tiles, Mode 3 (BG1 = 8BPP, BG2 = 4BPP)
                                                ;/8x8 BG tiles, Mode 3 (BG1 = 8BPP, BG2 = 4BPP)
DATA_008861:        db $78,$73                  ;\32x32 BG1 tilemap, base address: $F000
                                                ;/64x64 BG1 tilemap, base address: $E000
DATA_008863:        db $72,$6C                  ;\64x32 BG2 tilemap, base address: $E000
                                                ;/32x32 BG2 tilemap, base address: $D800
DATA_008865:        db $00,$00                  ;\32x32 BG3 tilemap, base address: $0000
                                                ;/32x32 BG3 tilemap, base address: $0000
DATA_008867:        db $50,$70                  ;\BG1 GFX address: $0000, BG2 GFX address: $A000
                                                ;/BG1 GFX address: $0000, BG2 GFX address: $E000
DATA_008869:        db $00,$05                  ;\BG3 GFX address: $0000, BG4 GFX address: $0000
                                                ;/BG3 GFX address: $A000, BG4 GFX address: $0000
DATA_00886B:        db $13,$02                  ;\Enable BG1, BG2, OBJ on main screen
                                                ;/Enable BG2 on main screen
DATA_00886D:        db $00,$11                  ;\Disable subscreen
                                                ;/Enable BG2, OBJ on subscreen
DATA_00886F:        db $00,$02                  ;\No color math
                                                ;/Add subscreen (instead of fixed color)
DATA_008871:        db $20,$20                  ;\Color addition on backdrop
                                                ;/Color addition on backdrop
DATA_008873:        db $00,$00                  ;\BG1 vertical scroll: $0000
DATA_008875:        db $00,$01                  ;/BG1 vertical scroll: $0100

DATA_008877:        db $00,$00,$00,$20,$00,$00,$00,$80 ;[]Never used
					db $00,$00,$06,$00,$00,$00,$00,$40 ;
					db $00,$00,$00,$40,$00,$00,$00,$A0 ;
					db $00,$00,$07,$00,$00,$00,$00,$20 ;
					db $00,$00,$00,$70,$00,$00,$00,$80 ;
					db $00,$00,$07,$00,$00,$00,$00,$20 ;
					db $00,$00,$00,$00,$00,$00,$00,$C0 ;
					db $00,$00,$06,$00,$00,$00,$00,$40 ;
					db $0F,$00,$6D,$00,$24,$01,$24,$01 ;

PNTR_0088BF:        dw DATA_3C8E00,DATA_3CB400                  ;

CODE_0088C3:        LDA.b #$43                ;\
                    XBA                       ; |Direct page: $4300
                    LDA.b #$00                ; |
                    TCD                       ;/
                    REP   #$10                ;16-bit XY
                    LDX.w #$1801              ;\Base register: $2118. 2 regs write once.
                    STX.b $4300               ;/
                    LDA.b #$80                ;\Increment after writing $2119/reading $213A
                    STA.w $2115               ;/
                    LDA.w $0219               ;\"File Select mode" flag
                    BEQ   +                   ;/
                    LDX.w #$D800>>1           ;\
                    STX.w $2116               ; |Do "file select" GFX DMA
                    LDX.w #DATA_2CD800        ; |
                    STX.b $4302               ; |VRAM Destination: $D800
                    LDA.b #DATA_2CD800>>$10   ; |DMA Source: $2C:D800
                    STA.b $4304               ; |Size: 0x1000 bytes
                    LDX.w #$1000              ; |
                    STX.b $4305               ; |
                    LDA.b #$01                ; |
                    STA.w $420B               ;/
                    STZ.w $0219               ;Reset "file select GFX DMA" flag
                    STZ.w $00E5               ;\[?]Clear offset of fading out into game select triangle
                    STZ.w $00E6               ;/graphics.
                    RTS                       ;

+                   LDX.w $00E5               ;\ If we're fading out into the game select room
                    BEQ   ++                  ; |
                    STX.b $4302               ; |DMA source: bank #$02, offset that $00E5 has
                    LDA.b #DATA_029000>>$10   ; |
                    STA.b $4304               ; |
                    LDX.w #$A000>>1           ; |
                    LDA.w $E0                 ;\|If fading out, VRAM address is $A000, else, $E000
                    BEQ   +                   ;/|
                    LDX.w #$E000>>1           ; |
+                   STX.w $2116               ; |
                    LDY.w #$0800              ; |DMA size: $800 bytes
                    STY.b $4305               ; |
                    LDA.b #$01                ; |
                    STA.w $420B               ;/
                    STZ.w $00E5               ;\[?]
                    STZ.w $00E6               ;/
++                  LDA.w $DE                 ;\ If character animation on Hall Screen flag is set
                    BEQ   +                   ; |
                    LDX.w #$7800              ; |VRAM address: $F000
                    STX.w $2116               ; |
                    LDX.w #$0000              ; |Update screen's tilemap using ram $7F0000 AKA animate stuff
                    STX.b $4302               ; |Source: $7F0000
                    LDA.b #$7F                ; |
                    STA.b $4304               ; |
                    LDY.w #$0800              ; |
                    STY.b $4305               ; |Size: $0800 bytes
                    LDA.b #$01                ; |
                    STA.w $420B               ; |Enable DMA transfer
                    STZ.w $00DE               ;/ Reset character animation on Hall Screen flag
+                   LDA.w $0AC0               ;\ Dynamically upload palette
                    BEQ   +                   ; |If $0AC0 is set, upload full palette to CGRAM
                    STZ.w $2121               ; |located at Source: $7F:9200.
                    LDY.w #$2200              ; |One reg write once. Reg = $2122
                    STY.b $4300               ; |
                    LDY.w #$9200              ; |Source: $7F:9200
                    STY.b $4302               ; |
                    LDA.b #$7F                ; |
                    STA.b $4304               ; |
                    LDY.w #$0200              ; |Size: Full palette
                    STY.b $4305               ; |
                    LDA.b #$01                ; |
                    STA.w $420B               ; |
                    STZ.w $0AC0               ;/
+                   REP   #$20                ;16-bit A
                    SEP   #$10                ;8-bit XY
                    STZ.w $2102               ;\
                    LDA.w #$0400              ; |Write OAM data
                    STA.b $4300               ; |
                    LDA.w #$0800              ; |Source: $7E:0800
                    STA.b $4302               ; |Size: 0x220 bytes
                    STZ.b $4304               ; |
                    LDA.w #$0220              ; |
                    STA.b $4305               ; |
                    LDY.b #$01                ; |
                    STY.w $420B               ;/
                    LDA.w #$1801              ;\
                    STA.b $4300               ; |
                    LDA.w #$1801              ; |
                    STA.b $4300               ; |
                    LDA.w #$0000              ; |
                    TCD                       ; |
                    LDA.w #$8002              ; |
                    STA.b $E8                 ; |Indirect pointer $7F8002 at $E8-$EA
                    SEP   #$20                ; |
                    LDA.b #$7F                ; |
                    STA.w $4304               ; |
                    STA.b $EA                 ; |
                    REP   #$10                ; |
                    LDY.w #$0000              ; |
                    JSR.w +                   ; |
                    REP   #$20                ; |
                    LDA.w #$0000              ; |
                    STA.l $7F8000             ; |
                    DEC   A                   ; |
                    STA.l $7F8002             ; |
                    RTS                       ;/
-                   STA.w $2117               ;
                    INY                       ;
                    LDA.b [$E8],y             ;
                    STA.w $2116               ;
                    INY                       ;
                    LDA.b [$E8],y             ;
                    ASL   A                   ;
                    LDA.w #$2A40              ;
                    STA.w $2115               ;
                    REP   #$20                ;
                    LDA.b [$E8],y             ;
                    XBA                       ;
                    ASL   A                   ;
                    LSR   A                   ;
                    STA.w $4305               ;
                    STA.b $EC                 ;
                    INY                       ;
                    INY                       ;
                    TYA                       ;
                    ADC.b $E8                 ;
                    STA.w $4302               ;
                    TYA                       ;
                    ADC.b $EC                 ;
                    TAY                       ;
                    SEP   #$20                ;
                    LDA.b #$01                ;
                    STA.w $420B               ;
+                   LDA.b [$E8],y             ;
                    BPL   -                   ;
                    RTS                       ;