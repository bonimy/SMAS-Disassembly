; Super Mario All-Stars   (U) disassembly                        ;
; Disassembled by Roy and Ersanio and imamelia and wiiqwertyuiop ;
;                                                                ;
; Commenting and organization by SWR                             ;
;                                                                ;
; Code to display error message for pirated cartridge goes here. ;

DATA_009509:        dw $0020,$000A,$001B,$0017 ;"WARNING: IT IS A SERIOUS  "
                    dw $0012,$0017,$0010,$003A ;
                    dw $003B,$0012,$001D,$003B ;
                    dw $0012,$001C,$003B,$000A ;
                    dw $003B,$001C,$000E,$001B ;
                    dw $0012,$0018,$001E,$001C ;
                    dw $003B,$003B             ;
                    dw $000C,$001B,$0012,$0016 ;"CRIME TO COPY VIDEO GAMES."
                    dw $000E,$003B,$001D,$0018 ;
                    dw $003B,$000C,$0018,$0019 ;
                    dw $0022,$003B,$001F,$0012 ;
                    dw $000D,$000E,$0018,$003B ;
                    dw $0010,$000A,$0016,$000E ;
                    dw $001C,$0026             ;
                    dw $0001,$0008,$003B,$001E ;"18 USC 2319 PLEASE REFER  "
                    dw $001C,$000C,$003B,$0002 ;
                    dw $0003,$0001,$0009,$003B ;
                    dw $0019,$0015,$000E,$000A ;
                    dw $001C,$000E,$003B,$001B ;
                    dw $000E,$000F,$000E,$001B ;
                    dw $003B,$003B             ;
                    dw $001D,$0018,$003B,$0022 ;"TO YOUR NINTENDO GAME     "
                    dw $0018,$001E,$001B,$003B ;
                    dw $0017,$0012,$0017,$001D ;
                    dw $000E,$0017,$000D,$0018 ;
                    dw $003B,$0010,$000A,$0016 ;
                    dw $000E,$003B,$003B,$003B ;
                    dw $003B,$003B             ;
                    dw $0012,$0017,$001C,$001D ;"INSTRUCTION BOOKLET FOR   "
                    dw $001B,$001E,$000C,$001D ;
                    dw $0012,$0018,$0017,$003B ;
                    dw $000B,$0018,$0018,$0014 ;
                    dw $0015,$000E,$001D,$003B ;
                    dw $000F,$0018,$001B,$003B ;
                    dw $003B,$003B             ;
                    dw $000F,$001E,$001B,$001D ;"FURTHER INFORMATION.      "
                    dw $0011,$000E,$001B,$003B ;
                    dw $0012,$0017,$000F,$0018 ;
                    dw $001B,$0016,$000A,$001D ;
                    dw $0012,$0018,$0017,$0026 ;
                    dw $003B,$003B,$003B,$003B ;
                    dw $003B,$003B                 ;

;-------Game is pirated. Discontinue gameplay and show error message forever.
CODE_009641:        SEI                       ;Set interrupt flag
                    STZ.w $4200               ;No interrupts
                    STZ.w $420C               ;No HDMA
                    STZ.w $420B               ;No DMA
                    LDA.b #$80                ;\Forced blank
                    STA.w $2100               ;/
                    STZ.w $2140               ;\
                    STZ.w $2141               ; |Disable audio ports
                    STZ.w $2143               ;/
                    LDA.b #$F0                ;\Fade out the music
                    STA.w $2142               ;/
                    JSR.w CODE_0083B9         ;Initialize RAM, VRAM, and DMA registers
                    SEP   #$20                ;16-bit A
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
-                   LDA.w DATA_009509+$000,x  ;\
                    STA.w $0800+($0E3<<1),x   ; |Write text to BG1 data in RAM
                    LDA.w DATA_009509+$034,x  ; |
                    STA.w $0800+($123<<1),x   ; |"WARNING: IT IS A SERIOUS  "
                    LDA.w DATA_009509+$068,x  ; |"CRIME TO COPY VIDEO GAMES."
                    STA.w $0800+($1A3<<1),x   ; |
                    LDA.w DATA_009509+$09C,x  ; |"18 USC 2319 PLEASE REFER  "
                    STA.w $0800+($1E3<<1),x   ; |"TO YOUR NINTENDO GAME     "
                    LDA.w DATA_009509+$0D0,x  ; |"INSTRUCTION BOOKLET FOR   "
                    STA.w $0800+($223<<1),x   ; |"FURTHER INFORMATION.      "
                    LDA.w DATA_009509+$104,x  ; |
                    STA.w $0800+($263<<1),x   ; |
                    INX                       ; |
                    INX                       ; |
                    CPX.b #$1A<<1             ; |
                    BNE   -                   ;/
                    JMP.w CODE_009459         ;Display error text on screen forever