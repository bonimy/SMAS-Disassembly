; Super Mario All-Stars   (U) disassembly                        ;
; Disassembled by Roy and Ersanio and imamelia and wiiqwertyuiop ;

CODE_038000:        JMP CODE_038015     ; $03:8000: 4C 15 80    ;Jump to SMB1 RESET

CODE_038003:        JMP CODE_038308     ; $03:8003: 4C 08 83    ;Jump to SMB1 NMI

CODE_038006:        JMP CODE_03850D     ; $03:8006: 4C 0D 85    ;Jump to SMB1 IRQ

DATA_038009:        db $00,$00,$03,$03,$04,$04,$05,$05 ;

CODE_038011:        JML CODE_009641     ; $03:8011: 5C 41 96 00 ;Show "Pirated game" message

incsrc RESET.asm
incsrc NMI.asm
incsrc IRQ.asm

;-------Play mode jump table
CODE_038545:        LDA.w $0770             ; $03:8545: AD 70 07    ;\
                    ASL   A                 ; $03:8548: 0A          ; |Set up 'playing modes' (RAM $7E:0770)
                    TAX                     ; $03:8549: AA          ; |see pointers below for effects
                    JMP.w (PNTR_03854D,x)   ; $03:854A: 7C 4D 85    ;/

PNTR_03854D:        dw CODE_03868D          ;$00 Title screen
                    dw CODE_03AD60          ;$01 Normal playing and controls
                    dw CODE_0388BB          ;$02 Saved a toad at end of castle
                    dw CODE_03A0A8

incsrc PauseScreen.asm
incsrc TitleScreen.asm
incsrc PrincessToadSaved.asm

DATA_038B0C:        db $FF,$FF,$F6,$FB,$F7,$FB,$F8,$FB
                    db $F9,$FB,$FA,$FB,$F6,$0E,$F7,$0E
                    db $F8,$0E,$F9,$0E,$FA,$0E,$FD,$FE

DATA_038B24:        db $FF,$41,$42,$44,$45,$48,$31,$32
                    db $34,$35,$38,$00

;-------[?]Sprite stuff (affects point sprites despawning)
CODE_038B30:        LDA.w $0110,x             ; $03:8B30: BD 10 01    ;
                    BEQ   CODE_038B07         ; $03:8B33: F0 D2       ;
                    CMP.b #$0B                ; $03:8B35: C9 0B       ;
                    BCC   +                   ; $03:8B37: 90 0C       ;
                    LDA.b #$0B                ; $03:8B39: A9 0B       ;
                    STA.w $0110,x             ; $03:8B3B: 9D 10 01    ;
                    CPX.b #$09                ; $03:8B3E: E0 09       ;
                    BEQ   +                   ; $03:8B40: F0 03       ;
                    STA.w $0284               ; $03:8B42: 8D 84 02    ;
+                   TAY                       ; $03:8B45: A8          ;
                    LDA.w $0138,x             ; $03:8B46: BD 38 01    ;
                    BNE   +                   ; $03:8B49: D0 04       ;
                    STA.w $0110,x             ; $03:8B4B: 9D 10 01    ;
                    RTS                       ; $03:8B4E: 60          ;

+                   DEC.w $0138,x             ; $03:8B4F: DE 38 01    ;
                    CMP.b #$2B                ; $03:8B52: C9 2B       ;
                    BNE   ++                  ; $03:8B54: D0 20       ;
                    CPY.b #$0B                ; $03:8B56: C0 0B       ;
                    BNE   +                   ; $03:8B58: D0 09       ;
                    JSL.l CODE_048596         ; $03:8B5A: 22 96 85 04 ;Increase lives by one
                    LDA.b #$05                ; $03:8B5E: A9 05       ;\1-UP sound
                    STA.w $1603               ; $03:8B60: 8D 03 16    ;/
+                   LDA.w DATA_038B24,y       ; $03:8B63: B9 24 8B    ;
                    LSR   A                   ; $03:8B66: 4A          ;
                    LSR   A                   ; $03:8B67: 4A          ;
                    LSR   A                   ; $03:8B68: 4A          ;
                    LSR   A                   ; $03:8B69: 4A          ;
                    TAX                       ; $03:8B6A: AA          ;
                    LDA.w DATA_038B24,y       ; $03:8B6B: B9 24 8B    ;
                    AND.b #$0F                ; $03:8B6E: 29 0F       ;
                    STA.w $0145,x             ; $03:8B70: 9D 45 01    ;
                    JSR.w CODE_03BD55         ; $03:8B73: 20 55 BD    ;
++                  LDX.b $9E                 ; $03:8B76: A6 9E       ;
                    LDY.w $0B58               ; $03:8B78: AC 58 0B    ;
-                   LDA.w $0801,y             ; $03:8B7B: B9 01 08    ;
                    CMP.b #$F0                ; $03:8B7E: C9 F0       ;
                    BEQ   +                   ; $03:8B80: F0 0F       ;
                    INY                       ; $03:8B82: C8          ;
                    INY                       ; $03:8B83: C8          ;
                    INY                       ; $03:8B84: C8          ;
                    INY                       ; $03:8B85: C8          ;
                    INY                       ; $03:8B86: C8          ;
                    INY                       ; $03:8B87: C8          ;
                    INY                       ; $03:8B88: C8          ;
                    INY                       ; $03:8B89: C8          ;
                    CPY.b #$90                ; $03:8B8A: C0 90       ;
                    BNE   -                   ; $03:8B8C: D0 ED       ;
                    LDY.w $0B58               ; $03:8B8E: AC 58 0B    ;
+                   LDA.w $0124,x             ; $03:8B91: BD 24 01    ;
                    CMP.b #$18                ; $03:8B94: C9 18       ;
                    BCC   +                   ; $03:8B96: 90 05       ;
                    SBC.b #$01                ; $03:8B98: E9 01       ;
                    STA.w $0124,x             ; $03:8B9A: 9D 24 01    ;
+                   LDA.w $0124,x             ; $03:8B9D: BD 24 01    ;
                    JSR.w CODE_03EC42         ; $03:8BA0: 20 42 EC    ;
                    STX.b $E0                 ; $03:8BA3: 86 E0       ;
                    TXA                       ; $03:8BA5: 8A          ;
                    ASL   A                   ; $03:8BA6: 0A          ;
                    TAX                       ; $03:8BA7: AA          ;
                    REP   #$20                ; $03:8BA8: C2 20       ;
                    LDA.w $0E50,x             ; $03:8BAA: BD 50 0E    ;
                    STA.b $E2                 ; $03:8BAD: 85 E2       ;
                    CLC                       ; $03:8BAF: 18          ;
                    ADC.w #$0008              ; $03:8BB0: 69 08 00    ;
                    STA.b $DE                 ; $03:8BB3: 85 DE       ;
                    SEP   #$20                ; $03:8BB5: E2 20       ;
                    LDX.b $E0                 ; $03:8BB7: A6 E0       ;
                    STZ.b $DD                 ; $03:8BB9: 64 DD       ;
                    LDA.b $E3                 ; $03:8BBB: A5 E3       ;
                    BEQ   +                   ; $03:8BBD: F0 06       ;
                    LDA.b $DD                 ; $03:8BBF: A5 DD       ;
                    ORA.b #$01                ; $03:8BC1: 09 01       ;
                    STA.b $DD                 ; $03:8BC3: 85 DD       ;
+                   LDA.b $DD                 ; $03:8BC5: A5 DD       ;
                    STA.w $0C00,y             ; $03:8BC7: 99 00 0C    ;
                    LDA.w $0110,x             ; $03:8BCA: BD 10 01    ;
                    CMP.b #$06                ; $03:8BCD: C9 06       ;
                    BCS   +                   ; $03:8BCF: B0 04       ;
-                   STZ.b $DD                 ; $03:8BD1: 64 DD       ;
                    BRA   ++                  ; $03:8BD3: 80 08       ;

+                   CMP.b #$0B                ; $03:8BD5: C9 0B       ;
                    BEQ   -                   ; $03:8BD7: F0 F8       ;
                    LDA.b #$02                ; $03:8BD9: A9 02       ;
                    STA.b $DD                 ; $03:8BDB: 85 DD       ;
++                  LDA.b $DF                 ; $03:8BDD: A5 DF       ;
                    BEQ   +                   ; $03:8BDF: F0 06       ;
                    LDA.b $DD                 ; $03:8BE1: A5 DD       ;
                    ORA.b #$01                ; $03:8BE3: 09 01       ;
                    STA.b $DD                 ; $03:8BE5: 85 DD       ;
+                   LDA.b $DD                 ; $03:8BE7: A5 DD       ;
                    STA.w $0C04,y             ; $03:8BE9: 99 04 0C    ;
                    LDA.b $E2                 ; $03:8BEC: A5 E2       ;
                    STA.w $0800,y             ; $03:8BEE: 99 00 08    ;
                    LDA.b $DE                 ; $03:8BF1: A5 DE       ;
                    STA.w $0804,y             ; $03:8BF3: 99 04 08    ;
                    LDA.w $0110,x             ; $03:8BF6: BD 10 01    ;
                    ASL   A                   ; $03:8BF9: 0A          ;
                    TAX                       ; $03:8BFA: AA          ;
                    LDA.w DATA_038B0C,x       ; $03:8BFB: BD 0C 8B    ;
                    STA.w $0802,y             ; $03:8BFE: 99 02 08    ;
                    LDA.w DATA_038B0C+1,x     ; $03:8C01: BD 0D 8B    ;
                    STA.w $0806,y             ; $03:8C04: 99 06 08    ;
                    TAX                       ; $03:8C07: AA          ;
                    LDA.b #$32                ; $03:8C08: A9 32       ;
                    STA.w $0803,y             ; $03:8C0A: 99 03 08    ;
                    CPX.b #$0E                ; $03:8C0D: E0 0E       ;
                    BNE   +                   ; $03:8C0F: D0 01       ;
                    INC   A                   ; $03:8C11: 1A          ;
+                   STA.w $0807,y             ; $03:8C12: 99 07 08    ;
                    LDX.b $9E                 ; $03:8C15: A6 9E       ;
                    RTS                       ; $03:8C17: 60          ;

incsrc LevelPreview.asm

CODE_03922D:        LDA.w $0EC9               ; $03:922D: AD C9 0E    ;\Check if the level renderer has reset.
                    BNE   CODE_03922C         ; $03:9230: D0 FA       ;/If it hasn't, leave.
                    REP   #$30                ; $03:9232: C2 30       ;16-bit AXY
                    LDY.w $1A00               ; $03:9234: AC 00 1A    ;\ [?]
                    STY.b $00                 ; $03:9237: 84 00       ;/
                    LDA.w $0720               ; $03:9239: AD 20 07    ;\Load layer 1 drawing handler
                    STA.w $1A02,y             ; $03:923C: 99 02 1A    ;/Store it here?
                    XBA                       ; $03:923F: EB          ;\
                    STA.w $0ECC               ; $03:9240: 8D CC 0E    ;/Swap high and low bytes and store it here.
                    LDA.w #$3D80              ; $03:9243: A9 80 3D    ;\
                    STA.w $1A04,y             ; $03:9246: 99 04 1A    ; |Initialize the level rendering to something?
                    LDA.w #$0024              ; $03:9249: A9 24 00    ; |#$0024 is a blank tile.
                    STA.w $1A06,y             ; $03:924C: 99 06 1A    ; |
                    STA.w $1A08,y             ; $03:924F: 99 08 1A    ; |
                    STA.w $1A0A,y             ; $03:9252: 99 0A 1A    ; |
                    STA.w $1A0C,y             ; $03:9255: 99 0C 1A    ;/
                    SEP   #$30                ; $03:9258: E2 30       ;
                    LDX.b #$00                ; $03:925A: A2 00       ;Initialize vertical position of tile to render as top tile.
                    LDA.w $0EE7               ; $03:925C: AD E7 0E    ;\
                    BEQ   .write              ; $03:925F: F0 10       ;/
                    STA.w $0EE6               ; $03:9261: 8D E6 0E    ;
                    LDA.w $0720               ; $03:9264: AD 20 07    ;\
                    STA.w $0EF5               ; $03:9267: 8D F5 0E    ;/
                    LDA.w $0721               ; $03:926A: AD 21 07    ;\
                    INC   A                   ; $03:926D: 1A          ; |
                    STA.w $0EF4               ; $03:926E: 8D F4 0E    ;/
.write              STX.b $02                 ; $03:9271: 86 02       ;Store current vertical position of renderer.
                    LDA.w $06A1,x             ; $03:9273: BD A1 06    ;Get tile at current vertical position.
                    AND.b #$C0                ; $03:9276: 29 C0       ;\
                    ASL   A                   ; $03:9278: 0A          ; |The Map16 tile data is split into four chunks,
                    ROL   A                   ; $03:9279: 2A          ; |each holding a maximum of #$40 tiles. Each chunk is
                    ROL   A                   ; $03:927A: 2A          ; |stored at a different address, so we first get the starting
                    TAY                       ; $03:927B: A8          ; |address of where to load the Map16 data depending on which
                    LDA.w PNTR_039438,y       ; $03:927C: B9 38 94    ; |set the tile belongs to.
                    STA.b $06                 ; $03:927F: 85 06       ; |
                    LDA.w PNTR_03943C,y       ; $03:9281: B9 3C 94    ; |
                    STA.b $07                 ; $03:9284: 85 07       ;/
                    REP   #$30                ; $03:9286: C2 30       ;16-bit AXY
                    TXA                       ; $03:9288: 8A          ;\
                    AND.w #$00FF              ; $03:9289: 29 FF 00    ; |Clear the high byte of the X register
                    TAX                       ; $03:928C: AA          ;/
                    LDA.w $06A1,x             ; $03:928D: BD A1 06    ;\
                    AND.w #$003F              ; $03:9290: 29 3F 00    ; |Get the index of the Map16 tile.
                    ASL   A                   ; $03:9293: 0A          ; |
                    ASL   A                   ; $03:9294: 0A          ; |
                    ASL   A                   ; $03:9295: 0A          ; |
                    STA.b $03                 ; $03:9296: 85 03       ;/
                    LDA.w $071F               ; $03:9298: AD 1F 07    ;\
                    AND.w #$0001              ; $03:929B: 29 01 00    ; |Goes to the half-tile index if $071F is zero,
                    EOR.w #$0001              ; $03:929E: 49 01 00    ; |but not sure why.[?]
                    ASL   A                   ; $03:92A1: 0A          ; |
                    ASL   A                   ; $03:92A2: 0A          ; |
                    ADC.b $03                 ; $03:92A3: 65 03       ;/
                    TAY                       ; $03:92A5: A8          ;Store tile-index to Y
                    LDX.b $00                 ; $03:92A6: A6 00       ;
                    LDA.b ($06),y             ; $03:92A8: B1 06       ;
                    STA.w $1A0E,x             ; $03:92AA: 9D 0E 1A    ;
                    INY                       ; $03:92AD: C8          ;
                    INY                       ; $03:92AE: C8          ;
                    LDA.b ($06),y             ; $03:92AF: B1 06       ;
                    STA.w $1A10,x             ; $03:92B1: 9D 10 1A    ;
                    INC.b $00                 ; $03:92B4: E6 00       ;
                    INC.b $00                 ; $03:92B6: E6 00       ;
                    INC.b $00                 ; $03:92B8: E6 00       ;
                    INC.b $00                 ; $03:92BA: E6 00       ;
                    SEP   #$30                ; $03:92BC: E2 30       ;
                    LDX.b $02                 ; $03:92BE: A6 02       ;
                    INX                       ; $03:92C0: E8          ;
                    CPX.b #$0D                ; $03:92C1: E0 0D       ;
                    BCS   +                   ; $03:92C3: B0 03       ;
                    JMP.w .write              ; $03:92C5: 4C 71 92    ;

+                   REP   #$30                ; $03:92C8: C2 30       ;
                    LDY.w $1A00               ; $03:92CA: AC 00 1A    ;
                    LDA.w $1A0E,y             ; $03:92CD: B9 0E 1A    ;
                    CMP.w #$18A2              ; $03:92D0: C9 A2 18    ;
                    BEQ   +                   ; $03:92D3: F0 05       ;
                    CMP.w #$18A3              ; $03:92D5: C9 A3 18    ;
                    BNE   ++                  ; $03:92D8: D0 0C       ;
+                   STA.w $1A06,y             ; $03:92DA: 99 06 1A    ;
                    STA.w $1A08,y             ; $03:92DD: 99 08 1A    ;
                    STA.w $1A0A,y             ; $03:92E0: 99 0A 1A    ;
                    STA.w $1A0C,y             ; $03:92E3: 99 0C 1A    ;
++                  LDA.b $00                 ; $03:92E6: A5 00       ;
                    CLC                       ; $03:92E8: 18          ;
                    ADC.w #$000E              ; $03:92E9: 69 0E 00    ;
                    TAY                       ; $03:92EC: A8          ;
                    LDA.w #$FFFF              ; $03:92ED: A9 FF FF    ;
                    STA.w $1A02,y             ; $03:92F0: 99 02 1A    ;
                    STY.w $1A00               ; $03:92F3: 8C 00 1A    ;
                    LDA.w $0743               ; $03:92F6: AD 43 07    ;
                    AND.w #$00FF              ; $03:92F9: 29 FF 00    ;
                    BNE   +++                 ; $03:92FC: D0 36       ;
                    LDA.b $5C                 ; $03:92FE: A5 5C       ;
                    AND.w #$00FF              ; $03:9300: 29 FF 00    ;
                    BEQ   +++                 ; $03:9303: F0 2F       ;
                    CMP.w #$0003              ; $03:9305: C9 03 00    ;
                    BEQ   +++                 ; $03:9308: F0 2A       ;
                    LDA.w $19F8,y             ; $03:930A: B9 F8 19    ;
                    CMP.w #$0024              ; $03:930D: C9 24 00    ;
                    BEQ   +                   ; $03:9310: F0 15       ;
                    CMP.w #$10A4              ; $03:9312: C9 A4 10    ;
                    BEQ   +                   ; $03:9315: F0 10       ;
                    CMP.w #$0A08              ; $03:9317: C9 08 0A    ;
                    BNE   ++                  ; $03:931A: D0 14       ;
                    LDA.w $0ECE               ; $03:931C: AD CE 0E    ;
                    AND.w #$FF00              ; $03:931F: 29 00 FF    ;
                    STA.w $0ECE               ; $03:9322: 8D CE 0E    ;
                    BRA   ++                  ; $03:9325: 80 09       ;

+                   LDA.w $0ECE               ; $03:9327: AD CE 0E    ;
                    ORA.w #$0100              ; $03:932A: 09 00 01    ;
                    STA.w $0ECE               ; $03:932D: 8D CE 0E    ;
++                  JSL.l CODE_048D71         ; $03:9330: 22 71 8D 04 ;
+++                 SEP   #$30                ; $03:9334: E2 30       ;
                    INC.w $0721               ; $03:9336: EE 21 07    ;
                    LDA.w $0721               ; $03:9339: AD 21 07    ;
                    AND.b #$1F                ; $03:933C: 29 1F       ;
                    BNE   +                   ; $03:933E: D0 0B       ;
                    STZ.w $0721               ; $03:9340: 9C 21 07    ;
                    LDA.w $0720               ; $03:9343: AD 20 07    ;
                    EOR.b #$04                ; $03:9346: 49 04       ;
                    STA.w $0720               ; $03:9348: 8D 20 07    ;
+                   LDA.b #$06                ; $03:934B: A9 06       ;
                    STA.w $0773               ; $03:934D: 8D 73 07    ;
                    RTS                       ; $03:9350: 60          ;

CODE_039351:        RTS                       ; $03:9351: 60          ;

CODE_039352:        RTS                       ; $03:9352: 60          ;

DATA_039353:        dw $0C45,$0C45,$0C47,$0C47
                    dw $0C47,$0C47,$0C47,$0C47
                    dw $0C57,$0C58,$0C59,$0C5A
                    dw $0024,$0024,$0024,$0024

CODE_039373:        LDY.w $1700               ; $03:9373: AC 00 17    ;
                    INY                       ; $03:9376: C8          ;
                    LDA.b #$03                ; $03:9377: A9 03       ;
                    JSR.w CODE_0393C1         ; $03:9379: 20 C1 93    ;
                    LDA.b #$06                ; $03:937C: A9 06       ;
                    STA.w $0773               ; $03:937E: 8D 73 07    ;
                    JMP.w CODE_0393B2         ; $03:9381: 4C B2 93    ;

CODE_039384:        JSR.w CODE_039390         ; $03:9384: 20 90 93    ;
                    INC.w $03F2               ; $03:9387: EE F2 03    ;
                    DEC.w $03EE,x             ; $03:938A: DE EE 03    ;
                    RTS                       ; $03:938D: 60          ;

CODE_03938E:        LDA.b #$00                ; $03:938E: A9 00       ;
CODE_039390:        LDY.b #$03                ; $03:9390: A0 03       ;
                    CMP.b #$00                ; $03:9392: C9 00       ;
                    BEQ   +                   ; $03:9394: F0 14       ;
                    LDY.b #$00                ; $03:9396: A0 00       ;
                    CMP.b #$5B                ; $03:9398: C9 5B       ;
                    BEQ   +                   ; $03:939A: F0 0E       ;
                    CMP.b #$51                ; $03:939C: C9 51       ;
                    BEQ   +                   ; $03:939E: F0 0A       ;
                    INY                       ; $03:93A0: C8          ;
                    CMP.b #$60                ; $03:93A1: C9 60       ;
                    BEQ   +                   ; $03:93A3: F0 05       ;
                    CMP.b #$52                ; $03:93A5: C9 52       ;
                    BEQ   +                   ; $03:93A7: F0 01       ;
                    INY                       ; $03:93A9: C8          ;
+                   TYA                       ; $03:93AA: 98          ;
                    LDY.w $1700               ; $03:93AB: AC 00 17    ;
                    INY                       ; $03:93AE: C8          ;
                    JSR.w CODE_0393C1         ; $03:93AF: 20 C1 93    ;
CODE_0393B2:        REP   #$20                ; $03:93B2: C2 20       ;
                    LDA.w $1700               ; $03:93B4: AD 00 17    ;
                    CLC                       ; $03:93B7: 18          ;
                    ADC.w #$0010              ; $03:93B8: 69 10 00    ;
                    STA.w $1700               ; $03:93BB: 8D 00 17    ;
                    SEP   #$20                ; $03:93BE: E2 20       ;
                    RTS                       ; $03:93C0: 60          ;

CODE_0393C1:        STX.b $00                 ; $03:93C1: 86 00       ;
                    STY.b $01                 ; $03:93C3: 84 01       ;
                    ASL   A                   ; $03:93C5: 0A          ;
                    ASL   A                   ; $03:93C6: 0A          ;
                    ASL   A                   ; $03:93C7: 0A          ;
                    TAX                       ; $03:93C8: AA          ;
                    LDY.b #$00                ; $03:93C9: A0 00       ;
                    LDA.b $06                 ; $03:93CB: A5 06       ;
                    CMP.b #$D0                ; $03:93CD: C9 D0       ;
                    BCC   +                   ; $03:93CF: 90 02       ;
                    LDY.b #$04                ; $03:93D1: A0 04       ;
+                   STY.b $03                 ; $03:93D3: 84 03       ;
                    AND.b #$0F                ; $03:93D5: 29 0F       ;
                    ASL   A                   ; $03:93D7: 0A          ;
                    STA.b $04                 ; $03:93D8: 85 04       ;
                    STZ.b $05                 ; $03:93DA: 64 05       ;
                    LDA.b $02                 ; $03:93DC: A5 02       ;
                    CLC                       ; $03:93DE: 18          ;
                    ADC.b #$20                ; $03:93DF: 69 20       ;
                    ASL   A                   ; $03:93E1: 0A          ;
                    ROL.b $05                 ; $03:93E2: 26 05       ;
                    ASL   A                   ; $03:93E4: 0A          ;
                    ROL.b $05                 ; $03:93E5: 26 05       ;
                    ADC.b $04                 ; $03:93E7: 65 04       ;
                    STA.b $04                 ; $03:93E9: 85 04       ;
                    LDA.b $05                 ; $03:93EB: A5 05       ;
                    ADC.b $03                 ; $03:93ED: 65 03       ;
                    STA.b $05                 ; $03:93EF: 85 05       ;
                    LDY.b $01                 ; $03:93F1: A4 01       ;
CODE_0393F3:        REP   #$30                ; $03:93F3: C2 30       ;
                    TYA                       ; $03:93F5: 98          ;
                    AND.w #$00FF              ; $03:93F6: 29 FF 00    ;
                    TAY                       ; $03:93F9: A8          ;
                    TXA                       ; $03:93FA: 8A          ;
                    AND.w #$00FF              ; $03:93FB: 29 FF 00    ;
                    TAX                       ; $03:93FE: AA          ;
                    LDA.b $04                 ; $03:93FF: A5 04       ;
                    XBA                       ; $03:9401: EB          ;
                    STA.w $1701,y             ; $03:9402: 99 01 17    ;
                    CLC                       ; $03:9405: 18          ;
                    ADC.w #$2000              ; $03:9406: 69 00 20    ;
                    STA.w $1709,y             ; $03:9409: 99 09 17    ;
                    LDA.w #$0300              ; $03:940C: A9 00 03    ;
                    STA.w $1703,y             ; $03:940F: 99 03 17    ;
                    STA.w $170B,y             ; $03:9412: 99 0B 17    ;
                    LDA.w DATA_039353+0,x     ; $03:9415: BD 53 93    ;
                    STA.w $1705+0,y           ; $03:9418: 99 05 17    ;
                    LDA.w DATA_039353+2,x     ; $03:941B: BD 55 93    ;
                    STA.w $1705+2,y           ; $03:941E: 99 07 17    ;
                    LDA.w DATA_039353+4,x     ; $03:9421: BD 57 93    ;
                    STA.w $1705+8,y           ; $03:9424: 99 0D 17    ;
                    LDA.w DATA_039353+6,x     ; $03:9427: BD 59 93    ;
                    STA.w $1705+10,y          ; $03:942A: 99 0F 17    ;
                    LDA.w #$FFFF              ; $03:942D: A9 FF FF    ;
                    STA.w $1711,y             ; $03:9430: 99 11 17    ;
                    SEP   #$30                ; $03:9433: E2 30       ;
                    LDX.b $00                 ; $03:9435: A6 00       ;
                    RTS                       ; $03:9437: 60          ;

PNTR_039438:        db DATA_039440
                    db DATA_039598
                    db DATA_039758
                    db DATA_0397C8

PNTR_03943C:        db DATA_039440>>8
                    db DATA_039598>>8
                    db DATA_039758>>8
                    db DATA_0397C8>>8

;SMB1 MAP16 IMAGE DATA
;FORMAT: $upper-left,$property,$bottom-left,$property,$upper-right,$property,$bottom-right,$property

;-------The level's map16 tiles. Supports tiles #00-#3F, but in reality only goes to #2A.
DATA_039440:        incbin Map16Tiles/Tile00_3F.bin

;-------The level's map16 tiles. Supports tiles #40-#7F, but in reality only goes to #77.
DATA_039598:        incbin Map16Tiles/Tile40_7F.bin

;-------The level's map16 tiles. Supports tiles #80-#BF, but in reality only goes to #8D.
DATA_039758:        incbin Map16Tiles/Tile80_BF.bin

;-------The level's map16 tiles. Supports tiles #C0-#FF, but in reality only goes to #FD.
DATA_0397C8:        incbin Map16Tiles/TileC0_FF.bin

;-------Empty stripe inserter
DATA_0399B8:        db $FF

;-------"THANK YOU MARIO"
DATA_0399B9:        incbin Stripes/ThankMario.bin

;-------"THANK YOU LUIGI"
DATA_0399DE:        incbin Stripes/ThankLuigi.bin

;-------"BUT OUR PRINCESS IS IN ANOTHER CASTLE!"
DATA_039A03:        incbin Stripes/PrincessInAnotherCastle.bin

;-------"YOUR QUEST IS OVER." [][?]Only used in NES version
DATA_039A56:        incbin Stripes/QuestIsOver.bin

;-------"WE PRESENT YOU A NEW QUEST." [][?]Only used in NES version
DATA_039A81:        incbin Stripes/PresentNewQuest.bin

;-------"PUSH BUTTON Y" [][?]Unused
DATA_039ABC:        incbin Stripes/PushButtonY.bin

;-------"TO START A URA-WORLD" (sic) [][?]Unused
DATA_039ADB:        incbin Stripes/StartNewWorld.bin

CODE_039B08:        ASL   A                   ;\Execute Pointer Short routine
                    TAY                       ; |
                    PLA                       ; |(ExecutePtrShort)
                    STA.b $04                 ; |
                    PLA                       ; |
                    STA.b $05                 ; |
                    INY                       ; |
                    LDA.b ($04),y             ; |
                    STA.b $06                 ; |
                    INY                       ; |
                    LDA.b ($04),y             ; |
                    STA.b $07                 ; |
                    JMP.w ($0006)             ;/

CODE_039B1D:        STZ.b $00                 ;Looks like some sort of an OAM update routine.
                    REP   #$20                ;Direct page = $4300. DMA mode: 1 reg write once
                    STZ.w $2102               ;OAM address low byte: 00
                    LDA.w #$0004              ;\Dest: data for OAM write $2104
                    STA.b $01                 ; |Source: $00:0800
                    LDA.w #$0008              ; |
                    STA.b $03                 ;/
                    LDA.w #$0220              ;\$220 bytes
                    STA.b $05                 ;/
                    LDX.b #$01                ;\
                    STX.w $420B               ; |Enable DMA
                    SEP   #$20                ;/
                    LDA.b #$80                ;\
                    STA.w $2103               ; |Regular sprite priority.
                    STZ.w $2102               ;/ OAM address: $0000
                    LDA.w $0B76               ;
                    BNE   CODE_039B54         ;
                    JSR.w CODE_039B95         ;
                    LDA.w $028C               ;
                    BNE   CODE_039B91         ;
                    LDA.w $028D               ;
                    BEQ   CODE_039B91         ;
CODE_039B54:        REP   #$20                ;
                    LDA.w $028A               ;
                    STA.w $2116               ;
                    LDA.w #$1801              ;
                    STA.b $00                 ;
                    LDA.w $0285               ;
                    STA.b $02                 ;
                    LDY.w $0287               ;
                    STY.b $04                 ;
                    LDA.w $0288               ;
                    STA.b $05                 ;
                    STX.w $420B               ;
                    SEP   #$20                ;
                    LDA.w $0B76               ;
                    BEQ   CODE_039B91         ;
                    DEC.w $0B76               ;
                    BEQ   CODE_039B91         ;
                    LDA.w $0286               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0286               ;
                    LDA.w $028B               ;
                    CLC                       ;
                    ADC.b #$04                ;
                    STA.w $028B               ;
CODE_039B91:        STZ.w $028C               ;
                    RTS                       ;

CODE_039B95:        LDA.w $028E               ;
                    BEQ   CODE_039BBB         ;
                    REP   #$20                ;
                    LDA.w $0295               ;
                    STA.w $2116               ;
                    LDA.w #$1801              ;
                    STA.b $00                 ;
                    LDA.w $028F               ;
                    STA.b $02                 ;
                    LDY.w $0291               ;
                    STY.b $04                 ;
                    LDA.w $0293               ;
                    STA.b $05                 ;
                    STX.w $420B               ;
                    SEP   #$20                ;
CODE_039BBB:        RTS                       ;

CODE_039BBC:        REP   #$10                ;Stripe image uploader. Stripe image format:
                    LDA.b #$03                ;\VVVVVVVV VVVVVVVV DRLLLLLL LLLLLLLL <data bytes>
                    STA.w $4314               ;/DMA source: bank 3
                    STZ.b $06                 ;Clear something
                    LDY.w #$0000              ;Go into a loop
                    LDA.b [$00],y             ;\Load next byte
                    BPL   CODE_039BCF         ;/If positive, go process stripe image
                    SEP   #$30                ;\else, return.
                    RTS                       ;/

CODE_039BCF:        STA.b $04                 ;\
                    INY                       ; |Store stripe image VRAM destination in
                    LDA.b [$00],y             ; |RAM $03-$04.
                    STA.b $03                 ; |
                    INY                       ;/
                    LDA.b [$00],y             ;\
                    AND.b #$80                ; |Get direction bit.
                    ASL   A                   ; |0 = Horizontal, 1 = Vertical
                    ROL   A                   ; |
                    STA.b $07                 ;/
                    LDA.b [$00],y             ;\
                    AND.b #$40                ; |Get RLE bit. 1 = RLE, 0 = normal
                    STA.b $05                 ; |
                    LSR   A                   ; |
                    LSR   A                   ; |
                    LSR   A                   ; |DMA transfer becomes RLE if necessary
                    ORA.b #$01                ; |
                    STA.w $4310               ;/
                    LDA.b #$18                ;\DMA destination: $2118, $2119
                    STA.w $4311               ;/
                    REP   #$20                ;16-bit A
                    LDA.b $03                 ;\Set DMA VRAM dest
                    STA.w $2116               ;/
                    LDA.b [$00],y             ;\
                    XBA                       ; |Get Length bytes
                    AND.w #$3FFF              ; |
                    TAX                       ; |
                    INX                       ; |
                    STX.w $4315               ;/
                    INY                       ;\
                    INY                       ;/Get at next bytes
                    TYA                       ;\
                    CLC                       ; |Setup DMA source
                    ADC.b $00                 ; |
                    STA.w $4312               ;/
                    LDA.b $05                 ;\If not RLE, branch
                    BEQ   CODE_039C45         ;/
                    INX                       ;\
                    TXA                       ; |Setup RLE DMA size
                    LSR   A                   ; |
                    TAX                       ; |
                    STX.w $4315               ;/
                    SEP   #$20                ;8-bit A
                    LDA.b $05                 ;\
                    LSR   A                   ; |Set RLE DMA flag
                    LSR   A                   ; |
                    LSR   A                   ; |
                    STA.w $4310               ;/
                    LDA.b $07                 ;\
                    STA.w $2115               ;/Get RLE DMA direction. Either horizontal or vertical
                    LDA.b #$02                ;\Enable RLE DMA. This will DMA the low bytes of VRAM
                    STA.w $420B               ;/data.
                    LDA.b #$19                ;\RLE DMA dest: $2119
                    STA.w $4311               ;/
                    REP   #$21                ;\
                    TYA                       ; |
                    ADC.b $00                 ; |Setup RLE DMA source
                    INC   A                   ; |
                    STA.w $4312               ;/
                    LDA.b $03                 ;\Setup RLE VRAM dest
                    STA.w $2116               ;/
                    STX.w $4315               ;Setup RLE size
                    LDX.w #$0002              ;\
CODE_039C45:        STX.b $03                 ; |
                    TYA                       ; |
                    CLC                       ; |Increase pointer to stripe image data
                    ADC.b $03                 ; |
                    TAY                       ; |
                    SEP   #$20                ;/
                    LDA.b $07                 ;\
                    ORA.b #$80                ; |Set VRAM DMA mode: Either horizontal/vertical
                    STA.w $2115               ;/ normal address increment mode
                    LDA.b #$02                ;\Enable DMA to upload stripe image to VRAM
                    STA.w $420B               ;/
                    LDA.b [$00],y             ;\If done, return
                    BMI   CODE_039C61         ;/
                    JMP.w CODE_039BCF         ;Otherwise, process next chunk.

CODE_039C61:        SEP   #$30                ;\Return from stripe image uploading.
                    RTS                       ;/

DATA_039C64:        db $EF,$00,$06
                    db $00,$62,$00
                    db $06,$00,$62
                    db $00,$06,$00
                    db $6D,$00,$02
                    db $00,$6D,$00
                    db $02,$00,$7A
                    db $00,$03,$00

DATA_039C7C:        db $06,$0C,$12,$18,$1E,$24

CODE_039C82:        STA.b $00                 ;
                    JSR.w +                   ;
                    LDA.b $00                 ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
+                   CLC                       ;
                    ADC.b #$01                ;
                    AND.b #$0F                ;
                    CMP.b #$06                ;
                    BCS   .end                ;
                    PHA                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.b #$58                ;
                    LDX.b #$20                ;
                    CPY.b #$00                ;
                    BNE   +                   ;
                    LDA.b #$02                ;
                    LDX.b #$28                ;
+                   STX.b $F9                 ;
                    LDX.w $1700               ;
                    STA.w $1702,x             ;
                    LDA.w DATA_039C64,y       ;
                    STA.w $1703,x             ;
                    LDA.w DATA_039C64+1,y     ;
                    STA.w $1704,x             ;
                    LDA.w DATA_039C64+2,y     ;
                    STA.b $03                 ;
                    ASL   A                   ;
                    DEC   A                   ;
                    STA.w $1705,x             ;
                    STX.b $02                 ;
                    PLA                       ;
                    TAX                       ;
                    LDA.w DATA_039C7C,x       ;
                    SEC                       ;
                    SBC.w DATA_039C64+2,y     ;
                    TAY                       ;
                    LDX.b $02                 ;
-                   LDA.w $07C8,y             ;
                    STA.w $1706,x             ;
                    LDA.b $F9                 ;
                    STA.w $1707,x             ;
                    INX                       ;
                    INX                       ;
                    INY                       ;
                    DEC.b $03                 ;
                    BNE   -                   ;
                    LDA.b #$FF                ;
                    STA.w $1706,x             ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    STX.w $1700               ;
.end                RTS                       ;

CODE_039CF1:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    JSR.w CODE_039C82         ;
                    PLB                       ;
                    RTL                       ;

CODE_039CF9:        LDA.w $0770               ;
                    CMP.b #$00                ;
                    BEQ   CODE_039D21         ;
                    CMP.b #$02                ;
                    BNE   CODE_039D0B         ;
                    LDA.w $0772               ;
                    CMP.b #$05                ;
                    BNE   CODE_039D21         ;
CODE_039D0B:        LDX.b #$05                ;
CODE_039D0D:        LDA.w $0145,x             ;
                    CLC                       ;
                    ADC.w $07C8,y             ;
                    BMI   CODE_039D2C         ;
                    CMP.b #$0A                ;
                    BCS   CODE_039D33         ;
CODE_039D1A:        STA.w $07C8,y             ;
                    DEY                       ;
                    DEX                       ;
                    BPL   CODE_039D0D         ;
CODE_039D21:        LDA.b #$00                ;
                    LDX.b #$06                ;
CODE_039D25:        STA.w $0144,x             ;
                    DEX                       ;
                    BPL   CODE_039D25         ;
                    RTS                       ;

CODE_039D2C:        DEC.w $0144,x             ;
                    LDA.b #$09                ;
                    BNE   CODE_039D1A         ;
CODE_039D33:        CPX.b #$00                ;
                    BNE   CODE_039D43         ;
                    LDX.b #$05                ;
                    LDA.b #$09                ;
CODE_039D3B:        STA.w $07CE,x             ;
                    DEX                       ;
                    BNE   CODE_039D3B         ;
                    LDA.b #$13                ;
CODE_039D43:        SEC                       ;
                    SBC.b #$0A                ;
                    INC.w $0144,x             ;
                    BRA   CODE_039D1A         ;

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF

                    db $D0,$00,$18,$30,$48,$60,$78,$90
                    db $A8,$C0,$D8,$D8,$B0,$C0,$40,$44
                    db $48,$50,$54,$60,$68,$70,$78,$80
                    db $88,$00,$08,$10,$18,$18,$FF,$23
                    db $58

CODE_039D91:        LDA.b #$80                ;
                    STA.w $1201               ;
                    LDA.b #$FF                ;
                    STA.w $1102               ;
                    LDA.b #$7F                ;
                    STA.w $1103               ;
                    INC.w $1200               ;
                    LDA.b #$FF                ;
                    STA.w $1702               ;
                    STA.w $1703               ;
                    LDA.b #$09                ;
                    STA.w $120D               ;
                    LDA.b #$10                ;
                    STA.w $120B               ;
                    LDA.b #$20                ;
                    STA.w $120A               ;
                    LDA.b #$20                ;
                    STA.w $0EE0               ;
                    LDA.b #$40                ;
                    STA.w $0EE1               ;
                    LDA.b #$80                ;
                    STA.w $0EE2               ;
                    LDY.b #$FE                ;
                    LDX.b #$05                ;
CODE_039DCD:        LDA.w $07C8,x             ;
                    CMP.b #$0A                ;
                    BCS   CODE_039DE0         ;
                    DEX                       ;
                    BPL   CODE_039DCD         ;
                    LDA.w $07FF               ;
                    CMP.b #$A5                ;
                    BNE   CODE_039DE0         ;
                    LDY.b #$C7                ;
CODE_039DE0:        JSR.w CODE_039F3E         ;
                    LDA.b #$A5                ;
                    STA.w $07FF               ;
                    STA.w $07B7               ;
                    STZ.w $0EF6               ;
                    STZ.w $0EF9               ;
                    STZ.w $0EF7               ;
                    STZ.w $0EF8               ;
                    LDY.b #$6F                ;
                    JSR.w CODE_039F3E         ;
                    LDA.b #$18                ;
                    STA.w $07B2               ;
                    JSL.l CODE_04C00B         ;
                    JSR.w CODE_039E0C         ;
                    STZ.w $0E7F               ;
                    RTS                       ;

CODE_039E0C:        LDY.w $075F               ;\ Load current world
                    CPY.b #$08                ; |If it is smaller than world 08
                    BCC   CODE_039E17         ;/Skip the "set level number & map type" routine
                    JSL.l CODE_04C00B         ;set level number & map type
CODE_039E17:        LDY.b #$4B                ;
                    JSR.w CODE_039F3E         ;
                    LDX.b #$29                ;
                    LDA.b #$00                ;
CODE_039E20:        STA.w $0788,x             ;
                    DEX                       ;
                    BPL   CODE_039E20         ;
                    LDA.w $075B               ;
                    LDY.w $0752               ;
                    BEQ   CODE_039E31         ;
                    LDA.w $0751               ;
CODE_039E31:        STA.w $071A               ;
                    STA.w $0725               ;
                    STA.w $0728               ;
                    PHY                       ;
                    REP   #$20                ;
                    XBA                       ;
                    AND.w #$FF00              ;
                    STA.b $42                 ;
                    LSR   A                   ;
                    STA.w $0EFD               ;
                    LSR   A                   ;
                    STA.w $0EEE               ;
                    SEP   #$20                ;
                    PLY                       ;
                    JSR.w CODE_03AF0F         ;
                    LDY.b #$00                ;
                    AND.b #$01                ;
                    BEQ   CODE_039E59         ;
                    LDY.b #$04                ;
CODE_039E59:        STY.w $0720               ;
                    STZ.w $0721               ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    STA.w $06A0               ;
                    LDA.b #$FF                ;
                    STA.w $1300               ;
                    STA.w $1301               ;
                    STA.w $1302               ;
                    STA.w $1303               ;
                    STA.w $1304               ;
                    LDA.b #$0B                ;
                    STA.w $071E               ;
                    JSL.l CODE_04C041         ;
                    LDA.w $076A               ;
                    BNE   CODE_039E95         ;
                    LDA.w $075F               ;
                    CMP.b #$04                ;
                    BCC   CODE_039E98         ;
                    BNE   CODE_039E95         ;
                    LDA.w $075C               ;
                    CMP.b #$02                ;
                    BCC   CODE_039E98         ;
CODE_039E95:        INC.w $06CC               ;
CODE_039E98:        LDA.w $075B               ;
                    BEQ   CODE_039EA2         ;
                    LDA.b #$02                ;
                    STA.w $0710               ;
CODE_039EA2:        LDA.b $DB                 ;\Load background image
                    CMP.b #$21                ; |If it is the 'real' Bowser's Castle background
                    BEQ   CODE_039EB1         ;/branch
                    CMP.b #$02                ;\If it is the underwater Bowser's Castle background
                    BEQ   CODE_039EB1         ;/Branch
                    LDA.b #$80                ;\Fade out the music
                    STA.w $1602               ;/
CODE_039EB1:        LDA.b #$01                ;
                    STA.w $0E7F               ;
                    INC.w $0772               ;
                    RTS                       ;

CODE_039EBA:        LDA.w $2142               ;
                    CMP.b #$14                ;
                    BEQ   CODE_039ECA         ;
                    JSL.l CODE_0086B5         ;
                    LDA.b #$14                ;
                    STA.w $2142               ;
CODE_039ECA:        LDA.b #$01                ;
                    STA.w $0757               ;
                    STA.w $0754               ;
                    STA.w $077F               ;
                    STZ.w $0E73               ;
CODE_039ED8:        LDA.b #$02                ;
                    STA.w $0E7F               ;
                    LDA.b #$00                ;
                    STA.w $1201               ;
                    STA.w $0774               ;
                    TAY                       ;
CODE_039EE6:        STA.w $0300,y             ;
                    INY                       ;
                    BNE   CODE_039EE6         ;
                    STA.w $0759               ;
                    STA.w $0769               ;
                    STA.w $0728               ;
                    LDA.b #$FF                ;
                    STA.w $03A0               ;
                    STA.w $1702               ;
                    LDA.w $071A               ;
                    LSR.w $0778               ;
                    AND.b #$01                ;
                    ROR   A                   ;
                    ROL.w $0778               ;
                    LDA.b #$38                ;
                    STA.w $0B43               ;
                    LDA.b #$48                ;
                    STA.w $0B42               ;
                    LDA.b #$58                ;
                    STA.w $0B41               ;
                    LDX.b #$1C                ;
CODE_039F1A:        LDA.w $9D70,x             ;
                    STA.w $0B45,x             ;
                    DEX                       ;
                    BPL   CODE_039F1A         ;
                    JSR.w CODE_03A294         ;
                    JSR.w CODE_03A28F         ;
                    INC.w $0722               ;
                    INC.w $0772               ;
                    RTS                       ;

                    LDA.b #$00                ;
                    STA.b $06                 ;
                    STX.b $07                 ;
CODE_039F36:        STA.b ($06),y             ;
                    DEY                       ;
                    CPY.b #$FF                ;
                    BNE   CODE_039F36         ;
                    RTS                       ;

CODE_039F3E:        LDA.w $DB               ;
                    CMP.b #$21                ;
                    BNE   CODE_039F48         ;
                    INC.w $0E7F               ;
CODE_039F48:        LDX.b #$07                ;
                    LDA.b #$00                ;
                    STA.b $06                 ;
CODE_039F4E:        STX.b $07                 ;
CODE_039F50:        CPX.b #$01                ;
                    BNE   CODE_039F58         ;
                    CPY.b #$50                ;
                    BCS   CODE_039F5A         ;
CODE_039F58:        STA.b ($06),y             ;
CODE_039F5A:        DEY                       ;
                    CPY.b #$FF                ;
                    BNE   CODE_039F50         ;
                    DEX                       ;
                    BPL   CODE_039F4E         ;
                    LDA.b #$FF                ;
                    STA.w $1702               ;
                    INC   A                   ;
                    STZ.w $0B25               ;
                    STZ.w $0B26               ;
                    STZ.w $0B27               ;
                    STZ.w $0B28               ;
                    STZ.w $0B29               ;
                    LDA.w $07FC               ;
                    STA.w $076A               ;
                    LDX.b #$40                ;
CODE_039F7F:        STZ.w $0F00,x             ;
                    INX                       ;
                    BNE   CODE_039F7F         ;
                    LDA.w $0F0B               ;
                    BEQ   CODE_039FA1         ;
                    DEC   A                   ;
                    STA.w $0F0B               ;
                    BNE   CODE_039FA1         ;
                    LDA.l $7FFB05             ;
                    STA.w $07FB               ;
                    STA.w $076A               ;
                    STA.w $07FC               ;
                    JSL.l CODE_05C994         ;
CODE_039FA1:        RTS                       ;

                    db $28,$18,$38,$28,$08,$00,$00,$20 ;
                    db $B0,$50,$00,$00,$B0,$B0,$F0,$2E ;
                    db $0E,$2E,$2E,$2E,$2E,$2E,$2E,$0E ;
                    db $04,$03,$02

;Looks like a level loading routine? Not sure.

CODE_039FBD:        LDA.w $071A               ;
                    STA.b $78                 ;
                    LDA.b #$28                ;
                    STA.w $070A               ;
                    LDA.b #$01                ;
                    STA.w $0202               ;
                    STA.b $BB                 ;
                    LDA.b #$00                ;
                    STA.b $28                 ;
                    DEC.w $0480               ;
                    LDY.b #$00                ;
                    STY.w $075B               ;
                    LDA.b $5C                 ;
                    BNE   CODE_039FDF         ;
                    INY                       ;
CODE_039FDF:        STY.w $0704               ;
                    LDX.w $0710               ;
                    LDY.w $0752               ;
                    BEQ   CODE_039FF1         ;
                    CPY.b #$01                ;
                    BEQ   CODE_039FF1         ;
                    LDX.w $9FA4,y             ;
CODE_039FF1:        LDA.w $9FA2,y             ;
                    STA.w $0219               ;
                    LDA.w $9FA8,x             ;
                    STA.w $0237               ;
                    LDA.w $9FB1,x             ;
                    STA.w $0256               ;
                    LDX.b #$00                ;
                    JSR.w CODE_03EA2D         ;
                    JSL.l CODE_049A88         ;
                    LDY.w $0715               ;
                    BEQ   CODE_03A02B         ;
                    LDA.w $0757               ;
                    BEQ   CODE_03A02B         ;
                    LDA.w $9FB9,y             ;
                    STA.w $07E9               ;
                    LDA.b #$01                ;
                    STA.w $07EB               ;
                    LSR   A                   ;
                    STA.w $07EA               ;
                    STA.w $0757               ;
                    STA.w $07AF               ;
CODE_03A02B:        LDY.w $0758               ;
                    BEQ   CODE_03A044         ;
                    LDA.b #$03                ;
                    STA.b $28                 ;
                    LDX.b #$00                ;
                    JSR.w CODE_03BF0D         ;
                    LDA.b #$F0                ;
                    STA.b $44                 ;
                    LDX.b #$09                ;
                    LDY.b #$00                ;
                    JSR.w CODE_03B9FD         ;
CODE_03A044:        LDY.b $5C                 ;
                    BNE   CODE_03A04B         ;
                    JSR.w CODE_03B793         ;
CODE_03A04B:        LDA.b #$07                ;
                    STA.b $0F                 ;
                    RTS                       ;

                    db $56,$40,$65,$70,$66,$40,$66,$40
                    db $66,$40,$66,$60,$65,$70,$00,$00

CODE_03A060:        LDA.b #$01                ;
                    STA.w $0E7F               ;
                    STA.w $0E67               ;
                    STZ.w $0722               ;
                    DEC.w $075A               ;
                    BPL   CODE_03A079         ;
                    STZ.w $0772               ;
                    LDA.b #$03                ;
                    STA.w $0770               ;
                    RTS                       ;

CODE_03A079:        LDA.w $075F               ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w $075C               ;
                    AND.b #$02                ;
                    BEQ   CODE_03A086         ;
                    INX                       ;
CODE_03A086:        LDY.w $A050,x             ;
                    LDA.w $075C               ;
                    LSR   A                   ;
                    TYA                       ;
                    BCS   CODE_03A094         ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
CODE_03A094:        AND.b #$0F                ;
                    CMP.w $071A               ;
                    BEQ   CODE_03A09F         ;
                    BCC   CODE_03A09F         ;
                    LDA.b #$00                ;
CODE_03A09F:        STA.w $075B               ;
                    JSR.w CODE_03A22B         ;
                    JMP.w CODE_03A204         ;

CODE_03A0A8:        LDA.w $0772               ;\
                    ASL   A                   ; |Some sort of a game mode?
                    TAX                       ; |
                    JMP.w (PNTR_03A0B0,x)     ;/

PNTR_03A0B0:        dw CODE_03A0B6 ;$00
                    dw CODE_038C18 ;$01
                    dw CODE_03A1E1 ;$02

CODE_03A0B6:        STZ.w $073C               ;
                    STZ.w $0722               ;
                    LDA.b #$0A                ;\Game over music
                    STA.w $1602               ;/
                    INC.w $0774               ;
                    INC.w $0772               ;
                    RTS                       ;

                    db $42,$73,$0C,$2B,$63,$73,$83

CODE_03A0CF:        LDA.w $077A               ;
                    BEQ   CODE_03A0DC         ;
                    LDA.w $0761               ;
                    BMI   CODE_03A0DC         ;
                    JMP.w CODE_03A1E4         ;

CODE_03A0DC:        LDA.w $0FF6               ;
                    ORA.w $0FF7               ;
                    STA.w $0FF6               ;
                    AND.b #$0C                ;
                    BEQ   CODE_03A107         ;
                    LDY.b #$01                ;\Mario collected a coin sound
                    STY.w $1603               ;/
                    LDY.w $0F06               ;
                    AND.b #$08                ;
                    BEQ   CODE_03A0FB         ;
                    DEY                       ;
                    BPL   CODE_03A104         ;
                    INY                       ;
                    BRA   CODE_03A101         ;

CODE_03A0FB:        INY                       ;
                    CPY.b #$03                ;
                    BNE   CODE_03A104         ;
                    DEY                       ;
CODE_03A101:        STZ.w $1603               ;
CODE_03A104:        STY.w $0F06               ;
CODE_03A107:        LDA.w $0F8A               ;
                    BNE   CODE_03A181         ;
                    LDA.w $0FF6               ;
                    ORA.w $0FF7               ;
                    AND.b #$10                ;
                    BNE   CODE_03A168         ;
                    LDA.w $0FF6               ;
                    ORA.w $0FF7               ;
                    AND.b #$20                ;
                    BEQ   CODE_03A132         ;
                    LDA.b #$01                ;\Mario collected a coin sound
                    STA.w $1603               ;/
                    INC.w $0F06               ;
                    LDA.w $0F06               ;
                    CMP.b #$03                ;
                    BNE   CODE_03A132         ;
                    STZ.w $0F06               ;
CODE_03A132:        LDA.w $075F               ;
                    CMP.b #$08                ;
                    BNE   CODE_03A13A         ;
                    RTS                       ;

CODE_03A13A:        LDA.w $1603               ;
                    BEQ   CODE_03A142         ;
                    STZ.w $0B78               ;
CODE_03A142:        INC.w $0B78               ;Frame counter which runs when the game is paused
                    LDA.w $0B78               ;
                    AND.b #$10                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    ORA.b #$02                ;
                    STA.w $0C00               ;
                    LDY.b #$03                ;
CODE_03A155:        LDA.w $A0C8,y             ;
                    STA.w $0800,y             ;
                    DEY                       ;
                    BPL   CODE_03A155         ;
                    LDY.w $0F06               ;
                    LDA.w $A0CC,y             ;
                    STA.w $0801               ;
                    RTS                       ;

CODE_03A168:        LDA.b #$20                ;
                    STA.w $0F8A               ;
                    LDA.b #$43                ;\Pause sound
                    STA.w $1600               ;/
                    LDA.b #$F3                ;\Music fades out
                    STA.w $1602               ;/
                    LDA.w $0F06               ;
                    BEQ   CODE_03A181         ;
                    LDA.b #$3B                ;\
                    STA.w $1600               ;/"Save & Continue/Save & Quit" sound
CODE_03A181:        JSR.w CODE_03A142         ;
                    DEC.w $0F8A               ;
                    LDA.w $0F8A               ;
                    BEQ   CODE_03A18D         ;
                    RTS                       ;

CODE_03A18D:        STZ.w $0B78               ;
                    LDY.b #$04                ;
                    STY.w $075A               ;
                    STZ.w $0F03               ;
                    STZ.w $075E               ;
                    STZ.w $0765               ;
                    LDA.w $075F               ;
                    STA.w $075F               ;
                    STA.l $700008             ;
                    STZ.w $075C               ;
                    STZ.w $0E24               ;
                    STZ.w $0763               ;
                    STZ.w $0767               ;
                    STZ.w $0760               ;
                    LDA.b #$00                ;
                    STA.l $700009             ;
                    LDA.b #$00                ;
                    LDY.b #$11                ;
CODE_03A1C1:        STA.w $07CE,y             ;
                    DEY                       ;
                    BPL   CODE_03A1C1         ;
                    INC.w $075D               ;
                    LDA.w $0F06               ;
                    BEQ   CODE_03A1DE         ;
                    JSL.l CODE_008F03         ;
                    LDA.w $0F06               ;
                    CMP.b #$01                ;
                    BEQ   CODE_03A1DE         ;
                    JML.l CODE_0080DE         ;

CODE_03A1DE:        JMP.w CODE_03A1EF         ;
CODE_03A1E1:        JMP.w CODE_03A0CF         ;

CODE_03A1E4:        JSL.l CODE_048650         ;
                    JMP.w (PNTR_03A1EB,x)     ;

PNTR_03A1EB:        dw CODE_03A22A
                    dw CODE_03A1EF

CODE_03A1EF:        JSR.w CODE_03A22B         ;
                    BCC   CODE_03A204         ;
                    LDA.w $075F               ;
                    STA.w $07FD               ;
                    STZ.w $0772               ;
                    STZ.w $07B0               ;
                    STZ.w $0770               ;
                    RTS                       ;

CODE_03A204:        JSL.l CODE_04C00B         ;
                    LDA.w $1680               ;
                    BNE   CODE_03A21A         ;
                    LDA.w $077A               ;
                    BNE   CODE_03A21A         ;
                    LDA.b #$01                ;
                    STA.w $0754               ;
                    STZ.w $0756               ;
CODE_03A21A:        INC.w $0757               ;
                    STZ.w $0747               ;
                    STZ.b $0F                 ;
                    STZ.w $0772               ;
                    LDA.b #$01                ;
                    STA.w $0770               ;
CODE_03A22A:        RTS                       ;

CODE_03A22B:        SEC                       ;
                    LDA.w $077A               ;
                    BEQ   CODE_03A280         ;
                    LDA.w $0761               ;
                    BMI   CODE_03A280         ;
                    LDA.w $0754               ;
                    PHA                       ;
                    LDA.w $077F               ;
                    STA.w $0754               ;
                    PLA                       ;
                    STA.w $077F               ;
                    LDA.w $0756               ;
                    PHA                       ;
                    LDA.w $0780               ;
                    STA.w $0756               ;
                    PLA                       ;
                    STA.w $0780               ;
                    LDA.w $07FC               ;
                    PHA                       ;
                    LDA.w $0781               ;
                    STA.w $07FC               ;
                    PLA                       ;
                    STA.w $0781               ;
                    LDA.w $0753               ;
                    EOR.b #$01                ;
                    STA.w $0753               ;
                    STA.w $0EC2               ;
                    LDX.b #$06                ;
CODE_03A26D:        LDA.w $075A,x             ;
                    PHA                       ;
                    LDA.w $0761,x             ;
                    STA.w $075A,x             ;
                    PLA                       ;
                    STA.w $0761,x             ;
                    DEX                       ;
                    BPL   CODE_03A26D         ;
                    CLC                       ;
CODE_03A27F:        RTS                       ;

CODE_03A280:        LDA.w $0F03               ;
                    BNE   CODE_03A27F         ;
                    CLC                       ;
                    RTS                       ;

CODE_03A287:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    JSR.w CODE_03A22B         ;
                    PLB                       ;
                    RTL                       ;

CODE_03A28F:        LDA.b #$FF                ;
                    STA.w $06C9               ;
CODE_03A294:        RTS                       ;

CODE_03A295:        LDY.w $071F               ;
                    BNE   CODE_03A29F         ;
                    LDY.b #$08                ;
                    STY.w $071F               ;
CODE_03A29F:        DEY                       ;
                    TYA                       ;
                    JSR.w CODE_03A300         ;
                    DEC.w $071F               ;
                    BNE   CODE_03A2DE         ;
                    LDA.b #$20                ;
                    STA.b $00                 ;
                    LDA.b $BA                 ;
                    CMP.b #$03                ;
                    BNE   CODE_03A2B5         ;
                    ASL.b $00                 ;
CODE_03A2B5:        LDA.w $0ED1               ;
                    BNE   CODE_03A2DE         ;
                    LDA.w $0EFD               ;
                    AND.b $00                 ;
                    BEQ   CODE_03A2C8         ;
                    LDA.w $0EFC               ;
                    BEQ   CODE_03A2D2         ;
                    BRA   CODE_03A2DE         ;

CODE_03A2C8:        LDA.w $0EFC               ;
                    BEQ   CODE_03A2DE         ;
                    STZ.w $0EFC               ;
                    BRA   CODE_03A2D7         ;

CODE_03A2D2:        LDA.b #$01                ;
                    STA.w $0EFC               ;
CODE_03A2D7:        JSL.l CODE_049B35         ;
                    JSR.w CODE_039351         ;
CODE_03A2DE:        LDA.w $0EEE               ;
                    AND.b #$10                ;
                    BEQ   CODE_03A2EC         ;
                    LDA.w $0EDD               ;
                    BEQ   CODE_03A2F6         ;
                    BRA   CODE_03A2FF         ;

CODE_03A2EC:        LDA.w $0EDD               ;
                    BEQ   CODE_03A2FF         ;
                    STZ.w $0EDD               ;
                    BRA   CODE_03A2FB         ;

CODE_03A2F6:        LDA.b #$01                ;
                    STA.w $0EDD               ;
CODE_03A2FB:        JSL.l CODE_048B4E         ;
CODE_03A2FF:        RTS                       ;

CODE_03A300:        ASL   A                   ;
                    TAX                       ;
                    JMP.w (PNTR_03A305,x)     ;

PNTR_03A305:        dw CODE_03A315
                    dw CODE_03922D
                    dw CODE_03922D
                    dw CODE_03A436
                    dw CODE_03A315
                    dw CODE_03922D
                    dw CODE_03922D
                    dw CODE_03A436

CODE_03A315:        INC.w $0726               ;
                    LDA.w $0726               ;
                    AND.b #$0F                ;
                    BNE   CODE_03A325         ;
                    STA.w $0726               ;
                    INC.w $0725               ;
CODE_03A325:        INC.w $06A0               ;
                    LDA.w $06A0               ;
                    AND.b #$1F                ;
                    STA.w $06A0               ;
                    RTS                       ;

                    db $00,$30,$60,$93,$00,$00,$11,$12
                    db $12,$13,$00,$00,$51,$52,$53,$00
                    db $00,$00,$00,$00,$00,$01,$02,$02
                    db $03,$00,$00,$00,$00,$00,$00,$91
                    db $92,$93,$00,$00,$00,$00,$51,$52
                    db $53,$41,$42,$43,$00,$00,$00,$00
                    db $00,$91,$92,$97,$87,$88,$89,$99
                    db $00,$00,$00,$11,$12,$13,$A4,$A5
                    db $A5,$A5,$A6,$97,$98,$99,$01,$02
                    db $03,$00,$A4,$A5,$A6,$00,$11,$12
                    db $12,$12,$13,$00,$00,$00,$00,$01
                    db $02,$02,$03,$00,$A4,$A5,$A5,$A6
                    db $00,$00,$00,$11,$12,$12,$13,$00
                    db $00,$00,$00,$00,$00,$00,$9C,$00
                    db $8B,$AA,$AA,$AA,$AA,$11,$12,$13
                    db $8B,$00,$9C,$9C,$00,$00,$01,$02
                    db $03,$11,$12,$12,$13,$00,$00,$00
                    db $00,$AA,$AA,$9C,$AA,$00,$8B,$00
                    db $01,$02,$03,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$04,$00,$00,$05
                    db $00,$00,$06,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$4D,$00
                    db $00,$11,$13,$4E,$12,$4E,$4E,$00
                    db $0D,$1A,$00,$00,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$71,$71,$00
                    db $00,$00,$00,$00,$00,$00,$00,$00
                    db $00,$00,$71,$71,$00,$00,$00,$00
                    db $00,$00,$00,$00,$00,$00,$00

                    db $86,$8B,$72,$56,$52,$65,$00,$00
                    db $00,$18,$01,$18,$07,$18,$0F,$18
                    db $FF,$18,$01,$1F,$07,$1F,$0F,$1F
                    db $81,$1F,$01,$00,$8F,$1F,$F1,$1F
                    db $F9,$18,$F1,$18,$FF,$1F

CODE_03A436:        LDA.w $0728               ;
                    BEQ   CODE_03A43E         ;
                    JSR.w CODE_03A5CC         ;
CODE_03A43E:        LDX.b #$0C                ;
                    LDA.b #$00                ;
CODE_03A442:        STA.w $06A1,x             ;
                    DEX                       ;
                    BPL   CODE_03A442         ;
                    LDY.w $0742               ;
                    BEQ   CODE_03A48F         ;
                    LDA.w $0725               ;
CODE_03A450:        CMP.b #$03                ;
                    BMI   CODE_03A459         ;
                    SEC                       ;
                    SBC.b #$03                ;
                    BPL   CODE_03A450         ;
CODE_03A459:        ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ADC.w $A330,y             ;
                    ADC.w $0726               ;
                    TAX                       ;
                    LDA.w $A334,x             ;
                    BEQ   CODE_03A48F         ;
                    PHA                       ;
                    AND.b #$0F                ;
                    SEC                       ;
                    SBC.b #$01                ;
                    STA.b $00                 ;
                    ASL   A                   ;
                    ADC.b $00                 ;
                    TAX                       ;
                    PLA                       ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    TAY                       ;
                    LDA.b #$03                ;
                    STA.b $00                 ;
CODE_03A47F:        LDA.w $A3C4,x             ;
                    STA.w $06A1,y             ;
                    INX                       ;
                    INY                       ;
                    CPY.b #$0B                ;
                    BEQ   CODE_03A48F         ;
                    DEC.b $00                 ;
                    BNE   CODE_03A47F         ;
CODE_03A48F:        LDX.w $0741               ;
                    BEQ   CODE_03A4C7         ;
                    LDY.w $A3E7,x             ;
                    LDX.b #$00                ;
CODE_03A499:        LDA.w $A3EB,y             ;
                    BEQ   CODE_03A4C1         ;
                    PHY                       ;
                    LDY.b $5C                 ;
                    BNE   CODE_03A4B3         ;
                    LDY.w $0EF0               ;
                    BNE   CODE_03A4AE         ;
                    INC.w $0EF0               ;
                    INC   A                   ;
                    BRA   CODE_03A4BB         ;

CODE_03A4AE:        STZ.w $0EF0               ;
                    BRA   CODE_03A4BD         ;

CODE_03A4B3:        CPY.b #$03                ;
                    BNE   CODE_03A4BD         ;
                    CMP.b #$86                ;
                    BNE   CODE_03A4BD         ;
CODE_03A4BB:        INC   A                   ;
                    INC   A                   ;
CODE_03A4BD:        PLY                       ;
                    STA.w $06A1,x             ;
CODE_03A4C1:        INY                       ;
                    INX                       ;
                    CPX.b #$0D                ;
                    BNE   CODE_03A499         ;
CODE_03A4C7:        STZ.w $0109               ;
                    STZ.b $F9                 ;
                    LDA.w $0EE8               ;
                    STA.w $0EE9               ;
                    INC.w $0EE8               ;
                    LDY.b $5C                 ;
                    BNE   CODE_03A4E4         ;
                    LDA.w $075F               ;
                    CMP.b #$07                ;
                    BNE   CODE_03A4E4         ;
                    LDA.b #$65                ;
                    BRA   CODE_03A4EE         ;

CODE_03A4E4:        LDA.w $A412,y             ;
                    LDY.w $0743               ;
                    BEQ   CODE_03A4EE         ;
                    LDA.b #$8C                ;
CODE_03A4EE:        STA.b $07                 ;
                    LDX.b #$00                ;
                    LDA.w $0727               ;
                    ASL   A                   ;
                    TAY                       ;
CODE_03A4F7:        LDA.w $A416,y             ;
                    STA.b $00                 ;
                    INY                       ;
                    STY.b $01                 ;
                    LDA.w $0743               ;
                    BEQ   CODE_03A50E         ;
                    CPX.b #$00                ;
                    BEQ   CODE_03A50E         ;
                    LDA.b $00                 ;
                    AND.b #$08                ;
                    STA.b $00                 ;
CODE_03A50E:        LDY.b #$00                ;
CODE_03A510:        LDA.w $CA9F,y             ;
                    BIT.b $00                 ;
                    BEQ   CODE_03A55B         ;
                    LDA.b $BA                 ;
                    CMP.b #$03                ;
                    BNE   CODE_03A527         ;
                    LDA.b $F9                 ;
                    BEQ   CODE_03A527         ;
                    LDA.b #$68                ;
                    STA.b $07                 ;
                    BRA   CODE_03A529         ;

CODE_03A527:        LDA.b $07                 ;
CODE_03A529:        STA.w $06A1,x             ;
                    LDA.b $F9                 ;
                    BEQ   CODE_03A544         ;
                    LDA.b $BA                 ;
                    CMP.b #$03                ;
                    BNE   CODE_03A544         ;
                    LDA.b $F9                 ;
                    INC.b $F9                 ;
                    INC   A                   ;
                    BNE   CODE_03A562         ;
                    INC.w $06A1,x             ;
                    INC.b $07                 ;
                    BRA   CODE_03A562         ;

CODE_03A544:        LDA.b $BA                 ;
                    CMP.b #$03                ;
                    BNE   CODE_03A562         ;
                    LDA.w $0109               ;
                    BNE   CODE_03A562         ;
                    LDA.w $0EE9               ;
                    AND.b #$01                ;
                    BNE   CODE_03A562         ;
                    INC.w $06A1,x             ;
                    BRA   CODE_03A562         ;

CODE_03A55B:        LDA.b #$FE                ;
                    STA.b $F9                 ;
                    INC.w $0109               ;
CODE_03A562:        INX                       ;
                    CPX.b #$0D                ;
                    BEQ   CODE_03A584         ;
                    LDA.b $5C                 ;
                    CMP.b #$02                ;
                    BNE   CODE_03A575         ;
                    CPX.b #$0B                ;
                    BNE   CODE_03A575         ;
                    LDA.b #$56                ;
                    STA.b $07                 ;
CODE_03A575:        INC.w $0EE9               ;
                    INY                       ;
                    CPY.b #$08                ;
                    BNE   CODE_03A510         ;
                    LDY.b $01                 ;
                    BEQ   CODE_03A584         ;
                    JMP.w CODE_03A4F7         ;

CODE_03A584:        LDA.w $06AD               ;
                    CMP.b #$56                ;
                    BEQ   CODE_03A58F         ;
                    CMP.b #$72                ;
                    BNE   CODE_03A592         ;
CODE_03A58F:        INC.w $06AD               ;
CODE_03A592:        JSR.w CODE_03A5CC         ;
                    LDA.w $06A0               ;
                    JSR.w CODE_03ACF6         ;
                    LDX.b #$00                ;
                    LDY.b #$00                ;
CODE_03A59F:        STY.b $00                 ;
                    LDA.w $0EC9               ;
                    BNE   CODE_03A5C7         ;
                    LDA.w $06A1,x             ;
                    AND.b #$C0                ;
                    ASL   A                   ;
                    ROL   A                   ;
                    ROL   A                   ;
                    TAY                       ;
                    LDA.w $06A1,x             ;
                    CMP.w $A5C8,y             ;
                    BCS   CODE_03A5B9         ;
                    LDA.b #$00                ;
CODE_03A5B9:        LDY.b $00                 ;
                    STA.b ($06),y             ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b #$10                ;
                    TAY                       ;
                    INX                       ;
                    CPX.b #$0D                ;
                    BCC   CODE_03A59F         ;
CODE_03A5C7:        RTS                       ;

                    db $14,$51,$8C,$E7

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Primary level data loading routine
;;  Parses level data and inserts as map16 tile.
;;
;; Read-only values:
;;  $FA-
;;  $FC:    24-bit address pointer to level data.
;;
;; Local values:
;;  $010B:  Three byte object flag
;;  $0725:  Current page of renderer.
;;  $0728:  Saved page number. Value set when entering level from another level (e.g. by pipe).
;;  $0729:  Flag determining if page of current object to render is behind current rendering page
;;  $072A:  Current page of object being rendered.
;;  $072B:  Page select flag. Set when we are ready to move to the next page number.
;;  $072C:  Index to current object pointer (e.g. [$FA],$072C)
;;  $9E:    Current area object buffer index
;;  $1300-
;;  $1304:  Area object buffer
;;  $1305-
;;  $130E:  16-bit area object buffer
;;  $F6:    #$0F command three-byte object (essentially another three-byte-object flag)
;;  $F7:    Word index of current area-object buffer (#$0F command objects)
;;  $00:    The basic object type.
;;  $07:    The height of an object at the current X-position when writing tiles.
;;  $0F82:  Initialize level flag. Set when first entering a level.
;;  $0745:  Loop command flag. When set, we are in a loop-command.
;;  $04-
;;  $05:    Address pointer to jump location for object types.

CODE_03A5CC:        REP   #$10                ;16-bit XY
                    LDX.w #$0004              ;Area object buffer accepts 5 objects per row.
CODE_03A5D1:        STZ.w $010B               ;Store zero in 3-byte object flag
                    STX.b $9E                 ;Store current row object buffer value.
                    STZ.w $0729               ;Clear "Behind area parse" flag
                    LDY.w $072C               ;Load level index.
                    LDA.b [$FA],y             ;Load current level byte.
                    CMP.b #$FD                ;\End if current level byte is #$FD
                    BEQ   CODE_03A645         ;/
                    AND.b #$0F                ;\
                    CMP.b #$0F                ; |A unique difference between NES and SNES level format is the $0F height,
                    BNE   CODE_03A5EB         ; |which are three byte objects in SNES. $010B is the accompanying flag.
                    INC.w $010B               ;/
CODE_03A5EB:        LDA.w $1300,x             ;Check area object buffer flag
                    BPL   CODE_03A645         ;Decode if flag is non-negative.
                    LDA.w $010B               ;\
                    BEQ   CODE_03A5F6         ; |Increment two bytes for three-byte-object, and one
                    INY                       ; |byte for two-byte-objects.
CODE_03A5F6:        INY                       ;/
                    LDA.b [$FA],y             ;\
                    ASL   A                   ; |Get page flag bit, branch if not set
                    BCC   CODE_03A607         ;/
                    LDA.w $072B               ;\Skip if page select flag already set
                    BNE   CODE_03A607         ;/
                    INC.w $072B               ;Set page select flag
                    INC.w $072A               ;Increment page number
CODE_03A607:        LDY.w $072C               ;\
                    LDA.b [$FA],y             ; |Read just the low nybble.
                    AND.b #$0F                ;/
                    CMP.b #$0D                ;\Branch if not #$0D (Page skip or misc. objects)
                    BNE   CODE_03A634         ;/
                    INY                       ;\Read next byte.
                    LDA.b [$FA],y             ;/
                    LDY.w $072C               ;Load level index
                    AND.b #$40                ;\ Branch if not a misc. object
                    BNE   CODE_03A63D         ;/ (#$40 through #$4F are misc. objects)
                    LDA.w $072B               ;\ Branch if page select already set
                    BNE   CODE_03A63D         ;/
                    LDA.w $010B               ;\
                    BEQ   CODE_03A627         ; |Increment two bytes for three-byte-object, and one
                    INY                       ; |byte for two-byte-objects.
CODE_03A627:        INY                       ;/
                    LDA.b [$FA],y             ;\
                    AND.b #$1F                ; |Get page skip number (sets page, rather than adding that many)
                    STA.w $072A               ;/
                    INC.w $072B               ;Set page select flag.s
                    BRA   CODE_03A64F         ;Get next object

CODE_03A634:        CMP.b #$0E                ;\Check if low nybble of  [$FD],y is #$0E
                    BNE   CODE_03A63D         ;/Branch if it isn't.
                    LDA.w $0728               ;\Check if we have a saved page number
                    BNE   CODE_03A645         ;/Branch if we don't.
CODE_03A63D:        LDA.w $072A               ;\ Check to see if current page of level object
                    CMP.w $0725               ; |is behind current page of renderer.
                    BCC   CODE_03A64C         ;/ If so, branch
CODE_03A645:        JSR.w CODE_03A693         ;Load area data.
                    REP   #$10                ;16 bit XY
                    BRA   CODE_03A652         ;Check length

CODE_03A64C:        INC.w $0729               ;Turn on flag if object is behind renderer
CODE_03A64F:        JSR.w CODE_03A675         ;Increment buffer offset and move on
CODE_03A652:        LDX.b $9E                 ;Get buffer offset
                    LDA.w $1300,x             ;\ Check object length for anything stored here
                    BMI   CODE_03A65C         ; |And decrement or remove object at that position
                    DEC.w $1300,x             ;/
CODE_03A65C:        DEX                       ;Decrement buffer offset
                    BMI   CODE_03A662         ;Branch if we exceeded buffer
                    JMP.w CODE_03A5D1         ;Otherwise, loop back to level load routine

CODE_03A662:        LDA.w $0729               ;Check for flag set if objects were behind renderer
                    BEQ   CODE_03A66A         ;Branch if not true
                    JMP.w CODE_03A5CC         ;Otherwise, load more level data

CODE_03A66A:        LDA.w $0728               ;Now check for flag set f starting at page $00
                    BEQ   CODE_03A672         ;End routine if not set
                    JMP.w CODE_03A5CC         ;Otherwise, load more level data.

CODE_03A672:        SEP   #$10                ;8-bit XY
                    RTS                       ;End of level-load routine

CODE_03A675:        REP   #$20                ;16-bit A
                    INC.w $072C               ;\Increment level pointer object to next object index
                    INC.w $072C               ;/
                    LDA.w $010B               ;\
                    AND.w #$00FF              ; |Increment by one more byte if three-byte-object
                    BEQ   CODE_03A688         ; |flag is set
                    INC.w $072C               ;/
CODE_03A688:        SEP   #$20                ;8-bit A
                    LDA.b #$00                ;\
                    STA.w $072B               ; |Reset page select and three-byte-object flags
                    STA.w $010B               ;/
                    RTS                       ;

CODE_03A693:        REP   #$30                ;\
                    TXA                       ; |Clear high byte of X register
                    AND.w #$00FF              ; |
                    TAX                       ; |
                    SEP   #$20                ;/
                    LDA.w $1300,x             ;Check current buffer flag.
                    BMI   CODE_03A6AB         ;Branch if negative
                    REP   #$20                ;\
                    TXA                       ; |Get word index of $1300,x
                    ASL   A                   ; |and store to $1305,x
                    TAX                       ; |
                    LDY.w $1305,x             ; |
                    SEP   #$20                ;/
CODE_03A6AB:        LDA.w $0F82               ;
                    BEQ   CODE_03A6B8         ;
                    JSL.l CODE_048817         ;
                    STZ.w $0F82               ;
                    RTS                       ;

CODE_03A6B8:        STY.b $F7                 ;Store word index of current area object buffer.
                    STZ.b $F6                 ;Clear alt. three-byte-object flag.
                    STZ.w $010B               ;Clear three-byte-object flag.
                    LDX.w #$0010              ;
                    LDA.b [$FA],y             ;
                    CMP.b #$FD                ;
                    BEQ   CODE_03A672         ;
                    AND.b #$0F                ;
                    CMP.b #$0F                ;
                    BNE   CODE_03A6D2         ;
                    INC.b $F6                 ;
                    BRA   CODE_03A6DC         ;

CODE_03A6D2:        LDX.w #$0008              ;
                    CMP.b #$0C                ;
                    BEQ   CODE_03A6DC         ;
                    LDX.w #$0000              ;
CODE_03A6DC:        STX.b $07                 ;
                    LDX.b $9E                 ;
                    CMP.b #$0E                ;
                    BNE   CODE_03A6EA         ;
                    STZ.b $07                 ;
                    LDA.b #$2E                ;
                    BNE   CODE_03A747         ;
CODE_03A6EA:        CMP.b #$0D                ;
                    BNE   CODE_03A70D         ;
                    LDA.b #$22                ;
                    STA.b $07                 ;
                    LDA.b $F6                 ;
                    BEQ   CODE_03A6F7         ;
                    INY                       ;
CODE_03A6F7:        INY                       ;
                    LDA.b [$FA],y             ;
                    AND.b #$40                ;
                    BEQ   CODE_03A766         ;
                    LDA.b [$FA],y             ;
                    AND.b #$7F                ;
                    CMP.b #$4B                ;
                    BNE   CODE_03A709         ;
                    INC.w $0745               ;
CODE_03A709:        AND.b #$3F                ;
                    BRA   CODE_03A747         ;

CODE_03A70D:        CMP.b #$0C                ;
                    BCS   CODE_03A739         ;
                    LDA.b $F6                 ;
                    BEQ   CODE_03A716         ;
                    INY                       ;
CODE_03A716:        INY                       ;
                    LDA.b [$FA],y             ;
                    AND.b #$70                ;
                    BNE   CODE_03A727         ;
                    LDA.b #$16                ;
                    STA.b $07                 ;
                    LDA.b [$FA],y             ;
                    AND.b #$0F                ;
                    BRA   CODE_03A747         ;

CODE_03A727:        STA.b $00                 ;
                    CMP.b #$70                ;
                    BNE   CODE_03A735         ;
                    LDA.b [$FA],y             ;
                    AND.b #$08                ;
                    BEQ   CODE_03A735         ;
                    STZ.b $00                 ;
CODE_03A735:        LDA.b $00                 ;
                    BRA   CODE_03A743         ;

CODE_03A739:        LDA.b $F6                 ;
                    BEQ   CODE_03A73E         ;
                    INY                       ;
CODE_03A73E:        INY                       ;
                    LDA.b [$FA],y             ;
                    AND.b #$70                ;
CODE_03A743:        LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
CODE_03A747:        STA.b $00                 ;
                    LDA.w $1300,x             ;
                    BPL   CODE_03A7A6         ;
                    LDA.w $072A               ;
                    CMP.w $0725               ;
                    BEQ   CODE_03A769         ;
                    LDY.w $072C               ;
                    LDA.b [$FA],y             ;
                    AND.b #$0F                ;
                    CMP.b #$0E                ;
                    BNE   CODE_03A766         ;
                    LDA.w $0728               ;
                    BNE   CODE_03A78D         ;
CODE_03A766:        SEP   #$10                ;
                    RTS                       ;

CODE_03A769:        LDA.w $0728               ;
                    BEQ   CODE_03A77D         ;
                    LDA.b #$00                ;
                    STA.w $0728               ;
                    STA.w $0729               ;
                    STA.b $9E                 ;
                    STA.b $9F                 ;
CODE_03A77A:        SEP   #$10                ;
                    RTS                       ;

CODE_03A77D:        LDY.w $072C               ;
                    LDA.b [$FA],y             ;
                    AND.b #$F0                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    CMP.w $0726               ;
                    BNE   CODE_03A766         ;
CODE_03A78D:        PHX                       ;
                    REP   #$20                ;
                    TXA                       ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w $072C               ;
                    STA.w $1305,x             ;
                    SEP   #$20                ;
                    PLX                       ;
                    LDA.b $F6                 ;
                    BEQ   CODE_03A7A3         ;
                    INC.w $010B               ;
CODE_03A7A3:        JSR.w CODE_03A675         ;
CODE_03A7A6:        LDA.b $F6                 ;\Check if this is a #$0F three-byte object
                    BEQ   CODE_03A7B3         ;/Branch if it isn't.
                    LDY.b $F7                 ;\Otherwise, get the word index of the current area
                    JSL.l CODE_048E15         ;/object buffer and write the tile data.
                    SEP   #$10                ;8-bit XY
                    RTS                       ;

CODE_03A7B3:        SEP   #$10                ;
                    LDA.b $00                 ;
                    CLC                       ;
                    ADC.b $07                 ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w $A7C9,y             ;
                    STA.b $04                 ;
                    LDA.w $A7CA,y             ;
                    STA.b $05                 ;
                    JMP.w ($0004)             ;

                    dw CODE_03A9F7
                    dw CODE_03A8AF
                    dw CODE_03AB63
                    dw CODE_03AB72
                    dw CODE_03AB2A
                    dw CODE_03AB83
                    dw CODE_03AB8A
                    dw CODE_03A9F7
                    dw CODE_03AC3F
                    dw CODE_03A978
                    dw CODE_03AAB0
                    dw CODE_03AAB4
                    dw CODE_03AAB8
                    dw CODE_03AA7E
                    dw CODE_03AA9E
                    dw CODE_03AAA2
                    dw CODE_03A827
                    dw CODE_03A827
                    dw CODE_03A827
                    dw CODE_03A827
                    dw CODE_03A827
                    dw CODE_03A827
                    dw CODE_03AC0F
                    dw CODE_03AC0F
                    dw CODE_03AC0F
                    dw CODE_03AC05
                    dw CODE_03AC18
                    dw CODE_03AC18
                    dw CODE_03AC18
                    dw CODE_03AC15
                    dw CODE_03AC18
                    dw CODE_03A98D
                    dw CODE_03AB4E
                    dw CODE_03ABD5
                    dw CODE_03A9A0
                    dw CODE_03AAE4
                    dw CODE_03AB3F
                    dw CODE_03AB44
                    dw CODE_03AB38
                    dw CODE_03A862
                    dw CODE_03A87C
                    dw CODE_03A87C
                    dw CODE_03A89A
                    dw CODE_03A89A
                    dw CODE_03A89A
                    dw CODE_03A77A
                    dw CODE_03A828

CODE_03A827:        RTS                       ;

CODE_03A828:        PHX                       ;
                    REP   #$30                ;
                    TXA                       ;
                    ASL   A                   ;
                    TAX                       ;
                    LDY.w $1305,x             ;
                    SEP   #$20                ;
                    INY                       ;
                    LDA.b [$FA],y             ;
                    SEP   #$10                ;
                    PLX                       ;
                    PHA                       ;
                    AND.b #$40                ;
                    BNE   CODE_03A850         ;
                    PLA                       ;
                    PHA                       ;
                    AND.b #$0F                ;
                    STA.w $0727               ;
                    PLA                       ;
                    AND.b #$30                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    STA.w $0742               ;
                    RTS                       ;

CODE_03A850:        PLA                       ;
                    AND.b #$07                ;
                    CMP.b #$04                ;
                    BCC   CODE_03A85E         ;
                    AND.b #$04                ;
                    STA.w $0744               ;
                    LDA.b #$00                ;
CODE_03A85E:        STA.w $0741               ;
                    RTS                       ;

CODE_03A862:        LDX.b #$04                ;"warpzone scroll stop code" ~ SWR | Warpzone setup
                    LDA.w $075F               ;\If world 1-x
                    BEQ   CODE_03A870         ;/Set warpzone config to world 1's warps
                    INX                       ;adjust config for next checks
                    LDY.b $5C                 ;\If map type is not "ground" and world is not 1-x
                    DEY                       ; |Set warpzone config to world 4's single warp
                    BNE   CODE_03A870         ;/
                    INX                       ;Else set warpzone config to world 4's outside warps
CODE_03A870:        TXA                       ;\
                    STA.w $06D6               ;/Store warpzone config
                    JSR.w CODE_0390FC         ;Routine to write the "Welcome to warpzone" message
                    LDA.b #$0D                ;\Destroy all piranha plants
                    JSR.w CODE_03A885         ;/
CODE_03A87C:        LDA.w $0723               ;\
                    EOR.b #$01                ; |Flip scroll enabled flag on or off
                    STA.w $0723               ;/
                    RTS                       ;Return

CODE_03A885:        STA.b $00                 ;\ Destroy all sprites with sprite number specified in A by setting them
                    LDA.b #$00                ; |off-screen.
                    LDX.b #$08                ; |
CODE_03A88B:        LDY.b $1C,x               ; |
                    CPY.b $00                 ; |
                    BNE   CODE_03A893         ; |
                    STA.b $10,x               ; |
CODE_03A893:        DEX                       ; |
                    BPL   CODE_03A88B         ; |
                    RTS                       ;/

                    TRB.b $17                 ;
                    CLC                       ;
CODE_03A89A:        LDX.b $00                 ;
                    LDA.w $A88F,x             ;
                    LDY.b #$09                ;
CODE_03A8A1:        DEY                       ;
                    BMI   CODE_03A8AB         ;
                    CMP.w $001C,y             ;
                    BNE   CODE_03A8A1         ;
                    LDA.b #$00                ;
CODE_03A8AB:        STA.w $06CD               ;
                    RTS                       ;

CODE_03A8AF:        LDA.w $0733               ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w $A8C1,y             ;
                    STA.b $04                 ;
                    LDA.w $A8C2,y             ;
                    STA.b $05                 ;
                    JMP.w ($0004)             ;

                    dw CODE_03A8C7
                    dw CODE_03A937
                    dw CODE_03AB99

CODE_03A8C7:        JSR.w CODE_03ACC2         ;
                    STX.w $0ECA               ;
                    LDA.w $1300,x             ;
                    BEQ   CODE_03A932         ;
                    BPL   CODE_03A8E5         ;
                    TYA                       ;
                    STA.w $1300,x             ;
                    LDA.w $0725               ;
                    ORA.w $0726               ;
                    BEQ   CODE_03A8E5         ;
                    LDA.b #$1A                ;
                    JMP.w CODE_03A96E         ;

CODE_03A8E5:        STA.w $0ECB               ;
                    LDX.b $07                 ;
                    LDA.b #$1B                ;
                    STA.w $06A1,x             ;
                    TXY                       ;
                    INY                       ;
                    LDX.w $0ECA               ;
                    DEC.w $0ECB               ;
                    BEQ   CODE_03A913         ;
                    LDA.w $130F,x             ;
                    BNE   CODE_03A90A         ;
                    INC.w $130F,x             ;
                    LDA.b #$45                ;
                    STA.w $06A1,y             ;
                    LDA.b #$49                ;
                    BRA   CODE_03A92E         ;

CODE_03A90A:        LDA.b #$46                ;
                    STA.w $06A1,y             ;
                    LDA.b #$4A                ;
                    BRA   CODE_03A92E         ;

CODE_03A913:        LDA.w $130F,x             ;
                    BEQ   CODE_03A924         ;
                    STZ.w $130F,x             ;
                    LDA.b #$47                ;
                    STA.w $06A1,y             ;
                    LDA.b #$4B                ;
                    BRA   CODE_03A92E         ;

CODE_03A924:        STZ.w $130F,x             ;
                    LDA.b #$48                ;
                    STA.w $06A1,y             ;
                    LDA.b #$4C                ;
CODE_03A92E:        TYX                       ;
                    JMP.w CODE_03A968         ;

CODE_03A932:        LDA.b #$1C                ;
                    JMP.w CODE_03A96E         ;

CODE_03A937:        JSR.w CODE_03ACB3         ;
                    STY.b $06                 ;
                    BCC   CODE_03A949         ;
                    LDA.w $1300,x             ;
                    LSR   A                   ;
                    STA.w $1314,x             ;
                    LDA.b #$1D                ;
                    BRA   CODE_03A96E         ;

CODE_03A949:        LDA.b #$1F                ;
                    LDY.w $1300,x             ;
                    BEQ   CODE_03A96E         ;
                    LDA.w $1314,x             ;
                    STA.b $06                 ;
                    LDX.b $07                 ;
                    LDA.b #$1E                ;
                    STA.w $06A1,x             ;
                    CPY.b $06                 ;
                    BNE   CODE_03A98C         ;
                    INX                       ;
                    LDA.b #$4F                ;
                    STA.w $06A1,x             ;
                    LDA.b #$50                ;
CODE_03A968:        INX                       ;
                    LDY.b #$0F                ;
                    JMP.w CODE_03AC78         ;

CODE_03A96E:        LDX.b $07                 ;
                    LDY.b #$00                ;
                    JMP.w CODE_03AC78         ;

                    db $42,$41,$43

CODE_03A978:        JSR.w CODE_03ACB3         ;
                    LDY.b #$00                ;
                    BCS   CODE_03A986         ;
                    INY                       ;
                    LDA.w $1300,x             ;
                    BNE   CODE_03A986         ;
                    INY                       ;
CODE_03A986:        LDA.w $A975,y             ;
                    STA.w $06A1               ;
CODE_03A98C:        RTS                       ;

CODE_03A98D:        JSR.w CODE_03ACC2         ;
                    LDY.w $1300,x             ;
                    LDX.b $07                 ;
                    LDA.b #$75                ;
                    STA.w $06A1,x             ;
                    LDA.b #$76                ;
                    STA.w $06A2,x             ;
                    RTS                       ;

CODE_03A9A0:        LDY.b #$03                ;
                    JSR.w CODE_03ACB6         ;
                    LDY.b #$0A                ;
                    DEY                       ;
                    DEY                       ;
                    STY.b $05                 ;
                    LDY.w $1300,x             ;
                    STY.b $06                 ;
                    LDX.b $05                 ;
                    INX                       ;
                    LDA.w $A9E3,y             ;
                    CMP.b #$00                ;
                    BEQ   CODE_03A9C2         ;
                    LDX.b #$00                ;
                    LDY.b $05                 ;
                    JSR.w CODE_03AC78         ;
                    CLC                       ;
CODE_03A9C2:        LDY.b $06                 ;
                    LDA.w $A9E7,y             ;
                    STA.w $06A1,x             ;
                    LDA.w $A9EB,y             ;
                    STA.w $06A2,x             ;
                    BCS   CODE_03A9E2         ;
                    LDX.b #$06                ;
CODE_03A9D4:        LDA.b #$00                ;
                    STA.w $06A1,x             ;
                    DEX                       ;
                    BPL   CODE_03A9D4         ;
                    LDA.w $A9EF,y             ;
                    STA.w $06A8               ;
CODE_03A9E2:        RTS                       ;

                    db $19,$18,$00,$00,$19,$22,$21,$20
                    db $19,$25,$24,$23,$15,$14,$19,$18
                    db $17,$16,$19,$18

CODE_03A9F7:        JSR.w CODE_03AA4D         ;
                    LDA.b $00                 ;
                    BEQ   CODE_03AA02         ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
CODE_03AA02:        TYA                       ;
                    PHA                       ;Preserve A
                    LDA.w $0760               ;\
                    ORA.w $075F               ; |If 1-1, piranha plants do not appear
                    BEQ   CODE_03AA39         ;/
                    LDY.w $1300,x             ;
                    BEQ   CODE_03AA39         ;
                    JSR.w CODE_03AA6B         ;\Get free sprite slot for the piranha plant
                    BCS   CODE_03AA39         ;/If none, skip
                    JSR.w CODE_03ACE0         ;\Get X-pos of screen ((AND #$F0>>4)<<4)
                    CLC                       ; |
                    ADC.b #$08                ; |Add 8 pixels to it
                    STA.w $021A,x             ; |Store to piranha plant x-pos
                    LDA.w $0725               ; |
                    ADC.b #$00                ; |Handle page boundary accordingly
                    STA.b $79,x               ;/
                    LDA.b #$01                ;\
                    STA.b $BC,x               ; |Sprite is on-screen in a normal way
                    STA.b $10,x               ;/
                    JSR.w CODE_03ACE8         ;\Store y-pos
                    STA.w $0238,x             ;/
                    LDA.b #$0D                ;\Which sprite to create: piranha plant
                    STA.b $1C,x               ;/
                    JSR.w CODE_03CB99         ;Run piranha plant code?
CODE_03AA39:        PLA                       ;Recover A
                    TAY                       ;
                    LDX.b $07                 ;
                    LDA.w $A9EF,y             ;
                    STA.w $06A1,x             ;
                    INX                       ;
                    LDA.w $A9F1,y             ;
                    LDY.b $06                 ;
                    DEY                       ;
                    JMP.w CODE_03AC78         ;

CODE_03AA4D:        LDY.b #$01                ;
                    JSR.w CODE_03ACB6         ;
                    JSR.w CODE_03ACC2         ;
                    TYA                       ;
                    AND.b #$07                ;
                    STA.b $06                 ;
                    LDY.w $1300,x             ;
                    RTS                       ;

CODE_03AA5E:        LDX.b #$00                ;
CODE_03AA60:        CLC                       ;
                    LDA.b $10,x               ;
                    BEQ   CODE_03AA6A         ;
                    INX                       ;
                    CPX.b #$08                ;
                    BNE   CODE_03AA60         ;
CODE_03AA6A:        RTS                       ;

CODE_03AA6B:        LDX.b #$08                ;\ Routine only used by piranha plant
CODE_03AA6D:        CLC                       ; |
                    LDA.b $10,x               ; |
                    BEQ   CODE_03AA77         ; |Get free sprite slot (check for an off-screen sprite)
                    DEX                       ; |Index = $FF if none
                    CPX.b #$FF                ; |
                    BNE   CODE_03AA6D         ; |
CODE_03AA77:        RTS                       ;/

                    db $86,$87,$00,$88,$8A,$8B

CODE_03AA7E:        JSR.w CODE_03ACB3         ;
                    LDX.b #$0A                ;
                    LDA.b $5C                 ;
                    CMP.b #$03                ;
                    BNE   CODE_03AA8A         ;
                    INX                       ;
CODE_03AA8A:        LDY.b $5C                 ;
                    LDA.w $AA78,y             ;
                    STA.w $06A1,x             ;
                    INX                       ;
                    TYA                       ;
                    LSR   A                   ;
                    TAY                       ;
                    LDA.w $AA7C,y             ;
                    LDY.b #$01                ;
                    JMP.w CODE_03AC78         ;

CODE_03AA9E:        LDA.b #$03                ;
                    BRA   CODE_03AAA4         ;

CODE_03AAA2:        LDA.b #$07                ;
CODE_03AAA4:        PHA                       ;
                    JSR.w CODE_03ACB3         ;
                    PLA                       ;
                    TAX                       ;
                    LDA.b #$E7                ;
                    STA.w $06A1,x             ;
                    RTS                       ;

CODE_03AAB0:        LDA.b #$06                ;
                    BRA   CODE_03AABA         ;

CODE_03AAB4:        LDA.b #$07                ;
                    BRA   CODE_03AABA         ;

CODE_03AAB8:        LDA.b #$09                ;
CODE_03AABA:        PHA                       ;
                    JSR.w CODE_03ACB3         ;
                    LDA.w $1300,x             ;
                    BEQ   CODE_03AAD3         ;
                    LDA.w $130F,x             ;
                    BNE   CODE_03AACF         ;
                    INC.w $130F,x             ;
                    LDA.b #$0E                ;
                    BRA   CODE_03AAD8         ;

CODE_03AACF:        LDA.b #$0D                ;
                    BRA   CODE_03AAD8         ;

CODE_03AAD3:        STZ.w $130F,x             ;
                    LDA.b #$0F                ;
CODE_03AAD8:        PLX                       ;
                    STA.w $06A1,x             ;
                    INX                       ;
                    LDY.b #$00                ;
                    LDA.b #$6B                ;
                    JMP.w CODE_03AC78         ;

CODE_03AAE4:        LDA.b #$28                ;
                    STA.w $06A1               ;
                    LDX.b #$01                ;
                    LDY.b #$08                ;
                    LDA.b #$29                ;
                    JSR.w CODE_03AC78         ;
                    LDA.b #$64                ;
                    STA.w $06AB               ;
                    JSR.w CODE_03ACE0         ;
                    SEC                       ;
                    SBC.b #$08                ;
                    STA.w $021F               ;
                    LDA.w $0725               ;
                    SBC.b #$00                ;
                    STA.b $7E                 ;
                    LDA.b #$30                ;
                    STA.w $023D               ;
                    LDA.b #$B0                ;
                    STA.w $010D               ;
                    LDA.b #$30                ;
                    STA.b $21                 ;
                    INC.b $15                 ;
                    LDA.b #$FF                ;
                    STA.w $0FB4               ;
                    STA.w $0FB5               ;
                    STA.w $0FB6               ;
                    STA.w $0FB7               ;
                    RTS                       ;

                    db $EA,$E9,$E9,$E9

CODE_03AB2A:        LDY.b $5C                 ;
                    LDA.w $AB26,y             ;
                    JMP.w CODE_03AB77         ;

                    ASL.b $07                 ;
                    PHP                       ;
                    SBC.w $8D10,x             ;
CODE_03AB38:        LDY.b #$0C                ;
                    JSR.w CODE_03ACB6         ;
                    BRA   CODE_03AB44         ;

;-------[?]Happens during bowser boss fight
CODE_03AB3F:        LDA.b #$08                ;
                    STA.w $0773               ;
CODE_03AB44:        LDY.b $00                 ;
                    LDX.w $AB30,y             ;
                    LDA.w $AB33,y             ;
                    BRA   CODE_03AB55         ;

CODE_03AB4E:        JSR.w CODE_03ACC2         ;
                    LDX.b $07                 ;
                    LDA.b #$FC                ;
CODE_03AB55:        LDY.b #$00                ;
                    JMP.w CODE_03AC78         ;

                    db $71,$64,$64,$6A

                    db $26,$51,$52,$52,$8C

CODE_03AB63:        LDY.b $5C                 ;
                    LDA.w $0743               ;
                    BEQ   CODE_03AB6C         ;
                    LDY.b #$04                ;
CODE_03AB6C:        LDA.w $AB5E,y             ;
                    JMP.w CODE_03AB77         ;

CODE_03AB72:        LDY.b $5C                 ;
                    LDA.w $AB5A,y             ;
CODE_03AB77:        PHA                       ;
                    JSR.w CODE_03ACB3         ;
                    LDX.b $07                 ;
                    LDY.b #$00                ;
                    PLA                       ;
                    JMP.w CODE_03AC78         ;

CODE_03AB83:        LDY.b $5C                 ;
                    LDA.w $AB5E,y             ;
                    BRA   CODE_03AB8F         ;

CODE_03AB8A:        LDY.b $5C                 ;
                    LDA.w $AB5A,y             ;
CODE_03AB8F:        PHA                       ;
                    JSR.w CODE_03ACC2         ;
                    PLA                       ;
                    LDX.b $07                 ;
                    JMP.w CODE_03AC78         ;

CODE_03AB99:        JSR.w CODE_03ACC2         ;
                    LDX.b $07                 ;
                    LDA.b #$6C                ;
                    STA.w $06A1,x             ;
                    INX                       ;
                    DEY                       ;
                    BMI   CODE_03ABB5         ;
                    LDA.b #$6D                ;
                    STA.w $06A1,x             ;
                    INX                       ;
                    DEY                       ;
                    BMI   CODE_03ABB5         ;
                    LDA.b #$6E                ;
                    JSR.w CODE_03AC78         ;
CODE_03ABB5:        LDX.w $026A               ;
                    JSR.w CODE_03ACE8         ;
                    STA.w $0277,x             ;
                    LDA.w $0725               ;
                    STA.w $026B,x             ;
                    JSR.w CODE_03ACE0         ;
                    STA.w $0271,x             ;
                    INX                       ;
                    CPX.b #$06                ;
                    BCC   CODE_03ABD1         ;
                    LDX.b #$00                ;
CODE_03ABD1:        STX.w $026A               ;
                    RTS                       ;

CODE_03ABD5:        JSR.w CODE_03ACC2         ;
                    JSR.w CODE_03AA5E         ;
                    JSR.w CODE_03ACE0         ;
                    STA.w $021A,x             ;
                    LDA.w $0725               ;
                    STA.b $79,x               ;
                    JSR.w CODE_03ACE8         ;
                    STA.w $0238,x             ;
                    STA.b $5E,x               ;
                    LDA.b #$32                ;
                    STA.b $1C,x               ;
                    LDY.b #$01                ;
                    STY.b $BC,x               ;
                    INC.b $10,x               ;
                    LDX.b $07                 ;
                    LDA.b #$6F                ;
                    STA.w $06A1,x             ;
                    LDA.b #$70                ;
                    STA.w $06A2,x             ;
                    RTS                       ;

CODE_03AC05:        LDA.w $075D               ;
                    BEQ   CODE_03AC3E         ;
                    STZ.w $075D               ;
                    BRA   CODE_03AC18         ;

CODE_03AC0F:        JSR.w CODE_03AC38         ;
                    JMP.w CODE_03AC2A         ;

CODE_03AC15:        STZ.w $06BC               ;
CODE_03AC18:        JSR.w CODE_03AC38         ;
                    STY.b $07                 ;
                    LDA.b #$00                ;
                    LDY.b $5C                 ;
                    DEY                       ;
                    BEQ   CODE_03AC26         ;
                    LDA.b #$05                ;
CODE_03AC26:        CLC                       ;
                    ADC.b $07                 ;
                    TAY                       ;
CODE_03AC2A:        LDA.w $BF87,y             ;
                    PHA                       ;
                    JSR.w CODE_03ACC2         ;
                    LDX.b $07                 ;
                    PLA                       ;
                    STA.w $06A1,x             ;
                    RTS                       ;

CODE_03AC38:        LDA.b $00                 ;
                    SEC                       ;
                    SBC.b #$00                ;
                    TAY                       ;
CODE_03AC3E:        RTS                       ;

CODE_03AC3F:        JSR.w CODE_03ACB3         ;
                    BCC   CODE_03AC70         ;
                    LDA.b $5C                 ;
                    BNE   CODE_03AC70         ;
                    LDX.w $026A               ;
                    JSR.w CODE_03ACE0         ;
                    SEC                       ;
                    SBC.b #$10                ;
                    STA.w $0271,x             ;
                    LDA.w $0725               ;
                    SBC.b #$00                ;
                    STA.w $026B,x             ;
                    INY                       ;
                    INY                       ;
                    TYA                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    STA.w $0277,x             ;
                    INX                       ;
                    CPX.b #$05                ;
                    BCC   CODE_03AC6D         ;
                    LDX.b #$00                ;
CODE_03AC6D:        STX.w $026A               ;
CODE_03AC70:        LDX.b $5C                 ;
                    LDA.b #$00                ;
                    LDX.b #$08                ;
                    LDY.b #$0F                ;
CODE_03AC78:        STY.w $0735               ;
                    LDY.w $06A1,x             ;
                    BEQ   CODE_03ACA4         ;
                    CPY.b #$1B                ;
                    BEQ   CODE_03ACA7         ;
                    CPY.b #$1E                ;
                    BEQ   CODE_03ACA7         ;
                    CPY.b #$E7                ;
                    BEQ   CODE_03ACA4         ;
                    CPY.b #$46                ;
                    BEQ   CODE_03ACA7         ;
                    CPY.b #$4A                ;
                    BEQ   CODE_03ACA7         ;
                    CPY.b #$E7                ;
                    BCS   CODE_03ACA7         ;
                    CPY.b #$57                ;
                    BEQ   CODE_03ACA0         ;
                    CPY.b #$56                ;
                    BNE   CODE_03ACA4         ;
CODE_03ACA0:        CMP.b #$50                ;
                    BEQ   CODE_03ACA7         ;
CODE_03ACA4:        STA.w $06A1,x             ;
CODE_03ACA7:        INX                       ;
                    CPX.b #$0D                ;
                    BCS   CODE_03ACB2         ;
                    LDY.w $0735               ;
                    DEY                       ;
                    BPL   CODE_03AC78         ;
CODE_03ACB2:        RTS                       ;

CODE_03ACB3:        JSR.w CODE_03ACC2         ;
CODE_03ACB6:        LDA.w $1300,x             ;
                    CLC                       ;
                    BPL   CODE_03ACC1         ;
                    TYA                       ;
                    STA.w $1300,x             ;
                    SEC                       ;
CODE_03ACC1:        RTS                       ;

CODE_03ACC2:        PHX                       ;
                    REP   #$30                ;
                    TXA                       ;
                    AND.w #$00FF              ;
                    ASL   A                   ;
                    TAX                       ;
                    LDY.w $1305,x             ;
                    SEP   #$20                ;
                    LDA.b [$FA],y             ;
                    AND.b #$0F                ;
                    STA.b $07                 ;
                    INY                       ;
                    LDA.b [$FA],y             ;
                    AND.b #$0F                ;
                    SEP   #$10                ;
                    TAY                       ;
                    PLX                       ;
                    RTS                       ;

CODE_03ACE0:        LDA.w $0726               ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    RTS                       ;

CODE_03ACE8:        LDA.b $07                 ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.b #$20                ;
                    RTS                       ;

                    db $00,$D0
                    db $05,$05

CODE_03ACF6:        PHA                       ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    TAY                       ;
                    LDA.w $ACF4,y             ;
                    STA.b $07                 ;
                    PLA                       ;
                    AND.b #$0F                ;
                    CLC                       ;
                    ADC.w $ACF2,y             ;
                    STA.b $06                 ;
                    RTS                       ;

CODE_03AD0B:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    JSR.w CODE_03AC78         ;
                    PLB                       ;
                    RTL                       ;

CODE_03AD13:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    JSR.w CODE_03ACB6         ;
                    PLB                       ;
                    RTL                       ;

CODE_03AD1B:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    JSR.w CODE_03ACE0         ;
                    PLB                       ;
                    RTL                       ;

CODE_03AD23:        PHB                       ;
                    PHK                       ;
                    PLB                       ;
                    JSR.w CODE_03AA5E         ;
                    PLB                       ;
                    RTL                       ;

ORG $03AD60
CODE_03AD60:        LDA.w $0772               ;\
                    ASL   A                   ; |Get "In-game modes"
                    TAX                       ; |
                    JMP.w (PNTR_03AD68,x)     ;/

PNTR_03AD68:        dw CODE_039E0C ;$00 Screen goes black
                    dw CODE_038C18 ;$01 "Image before level" mode
                    dw CODE_039ED8 ;$02 Pause timer, Sprites go disappear
                    dw CODE_03AD70 ;$03 Normal mode

CODE_03AD70:        JSL.l CODE_05C860         ;
CODE_03AD74:        LDA.b $28                 ;
                    BNE   CODE_03AD7B         ;
                    STZ.w $0E67               ;
CODE_03AD7B:        LDX.w $0753               ;
                    LDA.w $0FF4,x             ;
                    STA.w $0FF4               ;
                    JSR.w CODE_03AF21         ;
                    LDA.w $0772               ;
                    CMP.b #$03                ;
                    BCS   CODE_03AD8F         ;
                    RTS                       ;

CODE_03AD8F:        JSR.w CODE_03B680         ;
                    LDX.b #$00                ;
CODE_03AD94:        STX.b $9E                 ;
                    LDA.w $0E67               ;
                    BEQ   CODE_03AD9F         ;
                    CMP.b #$7F                ;
                    BEQ   CODE_03ADBD         ;
CODE_03AD9F:        JSR.w CODE_03C3B0         ;
                    LDA.w $0E67               ;
                    BNE   CODE_03ADAA         ;
                    JSR.w CODE_038B30         ;
CODE_03ADAA:        INX                       ;
                    CPX.b #$0A                ;
                    BNE   CODE_03AD94         ;
                    JSL.l CODE_05D300         ;
                    LDA.w $0E67               ;
                    BEQ   CODE_03ADBD         ;
                    LDA.b #$7F                ;
                    STA.w $0E67               ;
CODE_03ADBD:        JSR.w CODE_03FD9C         ;
                    JSR.w CODE_03FD13         ;
                    JSR.w CODE_03F710         ;
                    LDX.b #$01                ;
                    STX.b $9E                 ;
                    JSR.w CODE_03C01F         ;
                    DEX                       ;
                    STX.b $9E                 ;
                    JSR.w CODE_03C01F         ;
                    JSR.w CODE_03C084         ;
                    JSR.w CODE_03BCB9         ;
                    JSR.w CODE_03BAA2         ;
                    JSR.w CODE_03B84E         ;
                    JSR.w CODE_03B8F5         ;
                    JSR.w CODE_03B7DE         ;
                    JSR.w CODE_039352         ;
                    LDA.b $BB                 ;
                    CMP.b #$02                ;
                    BPL   CODE_03AE00         ;
                    LDA.w $07AF               ;
                    BEQ   CODE_03AE12         ;
                    CMP.b #$04                ;
                    BNE   CODE_03AE00         ;
                    LDA.w $0787               ;
                    BNE   CODE_03AE00         ;
                    JSL.l CODE_05C8FB         ;
CODE_03AE00:        LDA.b $09                 ;
                    PHY                       ;
                    LDY.w $07AF               ;
                    CPY.b #$08                ;
                    BCS   CODE_03AE0C         ;
                    LSR   A                   ;
                    LSR   A                   ;
CODE_03AE0C:        PLY                       ;
                    JSR.w CODE_03B2C4         ;
                    BRA   CODE_03AE26         ;

CODE_03AE12:        LDA.w $0787               ;
                    CMP.b #$01                ;
                    BNE   CODE_03AE23         ;
                    LDA.b $0F                 ;
                    CMP.b #$0C                ;
                    BEQ   CODE_03AE23         ;
                    JSL.l CODE_049A88         ;
CODE_03AE23:        JSR.w CODE_03B2FD         ;
CODE_03AE26:        LDA.b $0A                 ;
                    STA.b $0D                 ;
                    STZ.b $0C                 ;
CODE_03AE2C:        LDA.w $0773               ;
                    CMP.b #$06                ;
                    BEQ   CODE_03AE4D         ;
                    LDA.w $071F               ;
                    BNE   CODE_03AE4A         ;
                    LDA.w $073D               ;
                    CMP.b #$20                ;
                    BMI   CODE_03AE4D         ;
                    LDA.w $073D               ;
                    SBC.b #$20                ;
                    STA.w $073D               ;
                    STZ.w $1A00               ;
CODE_03AE4A:        JSR.w CODE_03A295         ;
CODE_03AE4D:        RTS                       ;

CODE_03AE4E:        LDA.w $06FF               ;
                    CLC                       ;
                    ADC.w $03A1               ;
                    STA.w $06FF               ;
                    LDA.w $0723               ;
                    BEQ   CODE_03AE60         ;
                    JMP.w CODE_03AED5         ;

CODE_03AE60:        LDA.w $0755               ;
                    CMP.b #$50                ;
                    BCC   CODE_03AED5         ;
                    LDA.w $078D               ;
                    BNE   CODE_03AED5         ;
                    LDY.w $06FF               ;
                    DEY                       ;
                    BMI   CODE_03AED5         ;
                    INY                       ;
                    CPY.b #$02                ;
                    BCC   CODE_03AE78         ;
                    DEY                       ;
CODE_03AE78:        LDA.w $0755               ;
                    CMP.b #$70                ;
                    BCC   CODE_03AE82         ;
                    LDY.w $06FF               ;
CODE_03AE82:        TYA                       ;
                    STA.w $0775               ;
                    CLC                       ;
                    ADC.w $073D               ;
                    STA.w $073D               ;
                    LDA.w $071C               ;
                    STA.b $00                 ;
                    LDA.w $071A               ;
                    STA.b $01                 ;
                    REP   #$30                ;
                    TYA                       ;
                    AND.w #$00FF              ;
                    CLC                       ;
                    ADC.b $00                 ;
                    STA.b $00                 ;
                    LSR   A                   ;
                    STA.w $0EFD               ;
                    LSR   A                   ;
                    STA.w $0EEE               ;
                    SEP   #$30                ;
                    LDA.b $00                 ;
                    STA.w $071C               ;
                    STA.w $073F               ;
                    STA.b $42                 ;
                    LDA.b $01                 ;
                    STA.w $071A               ;
                    STA.b $43                 ;
                    AND.b #$01                ;
                    STA.b $00                 ;
                    LDA.w $0778               ;
                    AND.b #$FE                ;
                    ORA.b $00                 ;
                    STA.w $0778               ;
                    JSR.w CODE_03AF0F         ;
                    LDA.b #$08                ;
                    STA.w $07A1               ;
                    BRA   CODE_03AED8         ;

CODE_03AED5:        STZ.w $0775               ;
CODE_03AED8:        LDX.b #$00                ;
                    JSR.w CODE_03FE1E         ;
                    STA.b $00                 ;
                    LDY.b #$00                ;
                    ASL   A                   ;
                    BCS   CODE_03AEEB         ;
                    INY                       ;
                    LDA.b $00                 ;
                    AND.b #$20                ;
                    BEQ   CODE_03AF05         ;
CODE_03AEEB:        LDA.w $071C,y             ;
                    SEC                       ;
                    SBC.w $AF0B,y             ;
                    STA.w $0219               ;
                    LDA.w $071A,y             ;
                    SBC.b #$00                ;
                    STA.b $78                 ;
                    LDA.b $0C                 ;
                    CMP.w $AF0D,y             ;
                    BEQ   CODE_03AF05         ;
                    STZ.b $5D                 ;
CODE_03AF05:        LDA.b #$00                ;
                    STA.w $03A1               ;
                    RTS                       ;

                    db $00,$10,$01,$02

CODE_03AF0F:        LDA.w $071C               ;
                    CLC                       ;
                    ADC.b #$FF                ;
                    STA.w $071D               ;
                    LDA.w $071A               ;
                    ADC.b #$00                ;
                    STA.w $071B               ;
                    RTS                       ;

CODE_03AF21:        LDA.b $0F                 ;
                    ASL   A                   ;
                    TAX                       ;
                    JMP.w (PNTR_03AF28,x)     ;

PNTR_03AF28:        dw CODE_039FBD
                    dw CODE_03B1E3
                    dw CODE_03B233
                    dw CODE_03B205
                    dw CODE_03B309
                    dw CODE_03B32B
                    dw CODE_03A060
                    dw CODE_03AF42
                    dw CODE_03AFF4
                    dw CODE_03B26E
                    dw CODE_03B280
                    dw CODE_03B2A4
                    dw CODE_03B2BA

CODE_03AF42:        LDA.w $0752               ;
                    CMP.b #$02                ;
                    BEQ   CODE_03AF85         ;
                    LDA.b #$00                ;
                    LDY.w $0237               ;
                    CPY.b #$30                ;
                    BCS   CODE_03AF55         ;
                    JMP.w CODE_03AFEA         ;

CODE_03AF55:        LDA.w $0710               ;
                    CMP.b #$06                ;
                    BEQ   CODE_03AF60         ;
                    CMP.b #$07                ;
                    BNE   CODE_03AFCF         ;
CODE_03AF60:        LDA.w $0256               ;
                    AND.b #$F0                ;
                    BEQ   CODE_03AF6C         ;
                    LDA.b #$01                ;
                    JMP.w CODE_03AFEA         ;

CODE_03AF6C:        JSR.w CODE_03B259         ;
                    DEC.w $06DE               ;
                    BNE   CODE_03AFE5         ;
                    LDA.b #$01                ;
                    STA.w $0E7F               ;
                    STA.w $0E4F               ;
                    INC.w $0769               ;
                    INC.w $0760               ;
                    JMP.w CODE_03B368         ;

CODE_03AF85:        LDA.w $0758               ;
                    BNE   CODE_03AFA6         ;
                    LDA.w $0237               ;
                    CMP.b #$B0                ;
                    BNE   CODE_03AF96         ;
                    LDA.b #$04                ;
                    STA.w $1600               ;
CODE_03AF96:        STA.w $0E4E               ;
                    LDA.b #$FF                ;
                    JSR.w CODE_03B22B         ;
                    LDA.w $0237               ;
                    CMP.b #$91                ;
                    BCC   CODE_03AFCF         ;
                    RTS                       ;

CODE_03AFA6:        LDA.w $0399               ;
                    CMP.b #$60                ;
                    BNE   CODE_03AFE5         ;
                    LDA.w $0237               ;
                    CMP.b #$99                ;
                    LDY.b #$00                ;
                    LDA.b #$01                ;
                    BCC   CODE_03AFC2         ;
                    LDA.b #$03                ;
                    STA.b $28                 ;
                    INY                       ;
                    LDA.b #$08                ;
                    STA.w $05B4               ;
CODE_03AFC2:        STY.w $0716               ;
                    JSR.w CODE_03AFEA         ;
                    LDA.w $0219               ;
                    CMP.b #$48                ;
                    BCC   CODE_03AFE5         ;
CODE_03AFCF:        STZ.w $0E4E               ;
                    LDA.b #$08                ;
                    STA.b $0F                 ;
                    LDA.b #$01                ;
                    STA.w $0202               ;
                    LSR   A                   ;
                    STA.w $0752               ;
                    STA.w $0716               ;
                    STA.w $0758               ;
CODE_03AFE5:        RTS                       ;

                    db $03,$FD,$00,$FF

CODE_03AFEA:        STA.w $0FF4               ;
                    LDA.b #$01                ;
                    STA.w $0B7A               ;
                    BRA   CODE_03AFF7         ;

CODE_03AFF4:        STZ.w $0B7A               ;
CODE_03AFF7:        LDA.b $0F                 ;
                    CMP.b #$0B                ;
                    BEQ   CODE_03B035         ;
                    LDA.b $5C                 ;
                    BNE   CODE_03B010         ;
                    LDY.b $BB                 ;
                    DEY                       ;
                    BNE   CODE_03B00D         ;
                    LDA.w $0237               ;
                    CMP.b #$D0                ;
                    BCC   CODE_03B010         ;
CODE_03B00D:        STZ.w $0FF4               ;
CODE_03B010:        LDA.w $0FF4               ;
                    AND.b #$C0                ;
                    STA.b $0A                 ;
                    LDA.w $0FF4               ;
                    AND.b #$03                ;
                    STA.b $0C                 ;
                    LDA.w $0FF4               ;
                    AND.b #$0C                ;
                    STA.b $0B                 ;
                    AND.b #$04                ;
                    BEQ   CODE_03B035         ;
                    LDA.b $28                 ;
                    BNE   CODE_03B035         ;
                    LDY.b $0C                 ;
                    BEQ   CODE_03B035         ;
                    STZ.b $0C                 ;
                    STZ.b $0B                 ;
CODE_03B035:        LDA.l $700007             ;
                    BNE   CODE_03B03E         ;
                    JMP.w CODE_03B129         ;

CODE_03B03E:        PHX                       ;
                    LDX.w $0EC3               ;
                    LDA.w $0FF8,x             ;
                    PLX                       ;
                    AND.b #$C0                ;
                    BEQ   CODE_03B060         ;
                    AND.b #$80                ;
                    BEQ   CODE_03B058         ;
                    STZ.w $0754               ;
                    LDA.b #$01                ;
                    STA.w $0756               ;
                    BRA   CODE_03B060         ;

CODE_03B058:        STZ.w $0754               ;
                    LDA.b #$02                ;
                    STA.w $0756               ;
CODE_03B060:        LDA.w $0FF6               ;
                    AND.b #$20                ;
                    BEQ   CODE_03B075         ;
                    EOR.w $0E73               ;
                    STA.w $0E73               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    STA.w $0716               ;
CODE_03B075:        LDA.w $0E73               ;
                    BNE   CODE_03B07D         ;
                    JMP.w CODE_03B129         ;

CODE_03B07D:        LDA.b #$10                ;
                    STA.w $07AF               ;
                    PHX                       ;
                    LDX.w $0753               ;
                    LDA.w $0FF8,x             ;
                    PLX                       ;
                    AND.b #$10                ;
                    BEQ   CODE_03B0CD         ;
                    LDA.b $09                 ;
                    AND.b #$07                ;
                    BNE   CODE_03B0CD         ;
                    LDA.w $0FF4               ;
                    LSR   A                   ;
                    BCS   CODE_03B0A6         ;
                    LSR   A                   ;
                    BCS   CODE_03B0B4         ;
                    LSR   A                   ;
                    BCS   CODE_03B0CA         ;
                    LSR   A                   ;
                    BCS   CODE_03B0C3         ;
                    JMP.w CODE_03B12C         ;

CODE_03B0A6:        LDA.b #$09                ;
                    STA.w $07EA               ;
                    STA.w $07EB               ;
                    STA.w $07E9               ;
                    JMP.w CODE_03B12C         ;

CODE_03B0B4:        STZ.w $07EA               ;
                    STZ.w $07EB               ;
                    STZ.w $07E9               ;
                    STZ.w $0E73               ;
                    JMP.w CODE_03B12C         ;

CODE_03B0C3:        JSL.l CODE_048596         ;Increase lives by one
                    JMP.w CODE_03B12C         ;

CODE_03B0CA:        JMP.w CODE_03B12C         ;

CODE_03B0CD:        LDA.b $09                 ;
                    AND.b #$07                ;
                    BNE   CODE_03B0EE         ;
                    LDA.w $0FF4               ;
                    AND.b #$80                ;
                    BEQ   CODE_03B0EE         ;
                    LDA.w $0754               ;
                    EOR.b #$01                ;
                    STA.w $0754               ;
                    LDA.w $0756               ;
                    EOR.b #$02                ;
                    STA.w $0756               ;
                    JSL.l CODE_049A88         ;
CODE_03B0EE:        LDA.w $0FF4               ;
                    AND.b #$03                ;
                    BEQ   CODE_03B10C         ;
                    TAY                       ;
                    LDA.b $0C                 ;
                    STA.w $0202               ;
                    LDA.w $0219               ;
                    CLC                       ;
                    ADC.w $AFE5,y             ;
                    STA.w $0219               ;
                    LDA.b $78                 ;
                    ADC.w $AFE7,y             ;
                    STA.b $78                 ;
CODE_03B10C:        LDA.w $0FF4               ;
                    AND.b #$0C                ;
                    BEQ   CODE_03B12C         ;
                    LSR   A                   ;
                    LSR   A                   ;
                    TAY                       ;
                    LDA.w $0237               ;
                    CLC                       ;
                    ADC.w $AFE5,y             ;
                    STA.w $0237               ;
                    LDA.b $BB                 ;
                    ADC.w $AFE7,y             ;
                    STA.b $BB                 ;
                    BRA   CODE_03B12C         ;

CODE_03B129:        JSR.w CODE_03B373         ;
CODE_03B12C:        LDY.b #$01                ;
                    LDA.w $0754               ;
                    BNE   CODE_03B13C         ;
                    LDY.b #$00                ;
                    LDA.w $0714               ;
                    BEQ   CODE_03B13C         ;
                    LDY.b #$02                ;
CODE_03B13C:        STY.w $048F               ;
                    LDA.b #$01                ;
                    LDY.b $5D                 ;
                    BEQ   CODE_03B14A         ;
                    BPL   CODE_03B148         ;
                    ASL   A                   ;
CODE_03B148:        STA.b $46                 ;
CODE_03B14A:        JSR.w CODE_03AE4E         ;
                    JSR.w CODE_03FD9C         ;
                    JSR.w CODE_03FD13         ;
                    LDX.b #$00                ;
                    JSR.w CODE_03EA2D         ;
                    JSR.w CODE_03E309         ;
                    LDA.w $0237               ;
                    CMP.b #$40                ;
                    BCC   CODE_03B189         ;
                    LDA.b $0F                 ;
                    CMP.b #$05                ;
                    BEQ   CODE_03B189         ;
                    CMP.b #$07                ;
                    BEQ   CODE_03B189         ;
                    CMP.b #$04                ;
                    BCC   CODE_03B189         ;
                    LDA.b $0F                 ;
                    CMP.b #$0B                ;
                    BNE   CODE_03B17F         ;
                    LDA.w $0256               ;
                    AND.b #$CE                ;
                    ORA.b #$30                ;
                    BRA   CODE_03B186         ;

CODE_03B17F:        LDA.w $0256               ;
                    AND.b #$CE                ;
                    ORA.b #$20                ;
CODE_03B186:        STA.w $0256               ;
CODE_03B189:        LDA.b $BB                 ;
                    CMP.b #$02                ;
                    BMI   CODE_03B1D8         ;
                    LDX.b #$01                ;
                    STX.w $0723               ;
                    LDY.b #$04                ;
                    STY.b $07                 ;
                    LDX.b #$00                ;
                    LDY.w $0759               ;
                    BNE   CODE_03B1A4         ;
                    LDY.w $0743               ;
                    BNE   CODE_03B1C8         ;
CODE_03B1A4:        INX                       ;
                    LDY.b $0F                 ;
                    CPY.b #$0B                ;
                    BEQ   CODE_03B1C8         ;
                    LDY.w $0712               ;
                    BNE   CODE_03B1C4         ;
                    INY                       ;
                    STY.w $0712               ;
                    LDY.b #$09                ;\Mario died music
                    STY.w $1602               ;/
                    STA.w $0E67               ;
                    LDA.b #$01                ;\Set Small Mario flag
                    STA.w $0754               ;/
                    STZ.w $0756               ;Small Mario power-up
CODE_03B1C4:        LDY.b #$06                ;
                    STY.b $07                 ;
CODE_03B1C8:        CMP.b $07                 ;
                    BMI   CODE_03B1D8         ;
                    DEX                       ;
                    BMI   CODE_03B1D9         ;
                    LDY.w $07B1               ;
                    BNE   CODE_03B1D8         ;
                    LDA.b #$06                ;\Set game mode: Fade out to image before level
                    STA.b $0F                 ;/
CODE_03B1D8:        RTS                       ;

CODE_03B1D9:        STZ.w $0758               ;
                    JSR.w CODE_03B1FD         ;
                    INC.w $0752               ;
                    RTS                       ;

CODE_03B1E3:        LDA.b $BB                 ;
                    BNE   CODE_03B1EE         ;
                    LDA.w $0237               ;
                    CMP.b #$E4                ;
                    BCC   CODE_03B1FD         ;
CODE_03B1EE:        LDA.b #$08                ;
                    STA.w $0758               ;
                    STA.w $0E67               ;
                    LDY.b #$03                ;
                    STY.b $28                 ;
                    JMP.w CODE_03AFEA         ;

CODE_03B1FD:        LDA.b #$02                ;
                    STA.w $0752               ;
                    JMP.w CODE_03B248         ;

CODE_03B205:        LDA.b #$01                ;
                    STA.w $0E4F               ;
                    STA.w $0218               ;
                    LDA.b $09                 ;
                    LSR   A                   ;
                    BCC   CODE_03B217         ;
                    LDA.b #$01                ;
                    JSR.w CODE_03B22B         ;
CODE_03B217:        JSR.w CODE_03AE4E         ;
                    LDY.b #$00                ;
                    LDA.w $06D6               ;
                    BNE   CODE_03B240         ;
                    INY                       ;
                    LDA.b $5C                 ;
                    CMP.b #$03                ;
                    BNE   CODE_03B240         ;
                    INY                       ;
                    BRA   CODE_03B240         ;

CODE_03B22B:        CLC                       ;
                    ADC.w $0237               ;
                    STA.w $0237               ;
                    RTS                       ;

CODE_03B233:        LDA.b #$01                ;
                    STA.w $0E67               ;
                    STA.w $0E4F               ;
                    JSR.w CODE_03B259         ;
                    LDY.b #$02                ;
CODE_03B240:        DEC.w $06DE               ;
                    BNE   CODE_03B258         ;
                    STY.w $0752               ;
CODE_03B248:        LDA.b #$01                ;
                    STA.w $0E7F               ;
                    STA.w $0E67               ;
                    LDA.b #$00                ;
                    STA.w $0772               ;
                    STA.w $0722               ;
CODE_03B258:        RTS                       ;

CODE_03B259:        LDA.b #$08                ;
                    STA.b $5D                 ;
                    LDY.b #$01                ;
                    LDA.w $0219               ;
                    AND.b #$0F                ;
                    BNE   CODE_03B269         ;
                    STA.b $5D                 ;
                    TAY                       ;
CODE_03B269:        TYA                       ;
                    JSR.w CODE_03AFEA         ;
                    RTS                       ;

CODE_03B26E:        LDA.w $0747               ;
                    CMP.b #$F8                ;
                    BNE   CODE_03B278         ;
                    JMP.w CODE_03B290         ;

CODE_03B278:        CMP.b #$C4                ;
                    BNE   CODE_03B27F         ;
                    JSR.w CODE_03B2AE         ;
CODE_03B27F:        RTS                       ;

CODE_03B280:        LDA.w $0747               ;
                    CMP.b #$F0                ;
                    BCS   CODE_03B28E         ;
                    CMP.b #$C8                ;
                    BEQ   CODE_03B2AE         ;
                    JMP.w CODE_03AFF4         ;

CODE_03B28E:        BNE   CODE_03B2A3         ;
CODE_03B290:        LDY.w $070B               ;
                    BNE   CODE_03B2A3         ;
                    STY.w $070D               ;
                    INC.w $070B               ;
                    LDA.w $0754               ;
                    EOR.b #$01                ;
                    STA.w $0754               ;
CODE_03B2A3:        RTS                       ;

CODE_03B2A4:        LDA.w $0747               ;
                    CMP.b #$F0                ;
                    BCS   CODE_03B308         ;
                    JMP.w CODE_03AFF4         ;

CODE_03B2AE:        STZ.w $0747               ;
                    JSL.l CODE_049A88         ;
                    LDA.b #$08                ;
                    STA.b $0F                 ;
                    RTS                       ;

CODE_03B2BA:        LDA.w $0747               ;
                    CMP.b #$C0                ;
                    BEQ   CODE_03B2FA         ;
                    EOR.b #$FF                ;
                    ASL   A                   ;
CODE_03B2C4:        ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    PHY                       ;
                    PHX                       ;
                    REP   #$30                ;
                    AND.w #$0060              ;
                    TAX                       ;
                    LDA.w $0753               ;
                    AND.w #$00FF              ;
                    BEQ   CODE_03B2DD         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0020              ;
                    TAX                       ;
CODE_03B2DD:        LDY.w #$01E0              ;
CODE_03B2E0:        LDA.l $05ED40,x           ;
                    STA.w $1000,y             ;
                    INX                       ;
                    INX                       ;
                    INY                       ;
                    INY                       ;
                    CPY.w #$0200              ;
                    BNE   CODE_03B2E0         ;
                    SEP   #$30                ;
                    PLX                       ;
                    PLY                       ;
                    LDA.b #$01                ;
                    STA.w $1200               ;
                    RTS                       ;

CODE_03B2FA:        JSR.w CODE_03B2AE         ;
CODE_03B2FD:        LDA.w $0256               ;
                    AND.b #$F1                ;
                    ORA.b #$0E                ;
                    STA.w $0256               ;
                    RTS                       ;

CODE_03B308:        RTS                       ;

CODE_03B309:        LDA.b $21                 ;
                    CMP.b #$30                ;
                    BNE   CODE_03B320         ;
                    LDA.b #$00                ;
                    STA.w $0713               ;
                    LDY.w $0237               ;
                    CPY.b #$9E                ;
                    BCS   CODE_03B31D         ;
                    LDA.b #$04                ;
CODE_03B31D:        JMP.w CODE_03AFEA         ;

CODE_03B320:        INC.b $0F                 ;
                    RTS                       ;

                    db $15,$23,$16,$1B,$17,$18,$23,$63

CODE_03B32B:        JSL.l CODE_05CBE5         ;
                    BEQ   CODE_03B340         ;
                    LDA.b #$01                ;
                    JSR.w CODE_03AFEA         ;
                    LDA.w $0237               ;
                    CMP.b #$AE                ;
                    BCC   CODE_03B340         ;
                    STZ.w $0723               ;
CODE_03B340:        LDA.w $0746               ;
                    CMP.b #$05                ;
                    BNE   CODE_03B372         ;
                    INC.w $075C               ;
                    LDA.w $075C               ;
                    CMP.b #$03                ;
                    BNE   CODE_03B35F         ;
                    LDY.w $075F               ;
                    LDA.w $0748               ;
                    CMP.w $B323,y             ;
                    BCC   CODE_03B35F         ;
                    INC.w $075D               ;
CODE_03B35F:        INC.w $0760               ;
                    STZ.w $075B               ;
                    JSR.w CODE_03A22B         ;
CODE_03B368:        JSL.l CODE_04C00B         ;
                    INC.w $0757               ;
                    JSR.w CODE_03B248         ;
CODE_03B372:        RTS                       ;

CODE_03B373:        LDA.b #$00                ;
                    LDY.w $0754               ;
                    BNE   CODE_03B382         ;
                    LDA.b $28                 ;
                    BNE   CODE_03B385         ;
                    LDA.b $0B                 ;
                    AND.b #$04                ;
CODE_03B382:        STA.w $0714               ;
CODE_03B385:        JSR.w CODE_03B4AD         ;
                    LDA.w $070B               ;
                    BNE   CODE_03B3A5         ;
                    LDA.b $28                 ;
                    CMP.b #$03                ;
                    BEQ   CODE_03B398         ;
                    LDY.b #$18                ;
                    STY.w $0791               ;
CODE_03B398:        ASL   A                   ;
                    TAX                       ;
                    JMP.w (PNTR_03B39D,x)     ;

PNTR_03B39D:        dw CODE_03B3A6
                    dw CODE_03B3C3
                    dw CODE_03B3BA
                    dw CODE_03B41F

CODE_03B3A5:        RTS

CODE_03B3A6:        JSR.w CODE_03B5F0
                    LDA.b $0C                 ;
                    BEQ   CODE_03B3B0         ;
                    STA.w $0202               ;
CODE_03B3B0:        JSR.w CODE_03B62B         ;
                    JSR.w CODE_03C0B4         ;
                    STA.w $06FF               ;
                    RTS                       ;

CODE_03B3BA:        LDA.w $070A               ;
                    STA.w $0709               ;
                    JMP.w CODE_03B3FC         ;

CODE_03B3C3:        LDY.b $A0                 ;
                    BPL   CODE_03B3DB         ;
                    LDA.b $0A                 ;
                    AND.b #$80                ;
                    AND.b $0D                 ;
                    BNE   CODE_03B3E1         ;
                    LDA.w $0708               ;
                    SEC                       ;
                    SBC.w $0237               ;
                    CMP.w $0706               ;
                    BCC   CODE_03B3E1         ;
CODE_03B3DB:        LDA.w $070A               ;
                    STA.w $0709               ;
CODE_03B3E1:        LDA.w $0704               ;
                    BEQ   CODE_03B3FC         ;
                    JSR.w CODE_03B5F0         ;
                    LDA.w $0237               ;
                    CMP.b #$14                ;
                    BCS   CODE_03B3F5         ;
                    LDA.b #$18                ;
                    STA.w $0709               ;
CODE_03B3F5:        LDA.b $0C                 ;
                    BEQ   CODE_03B3FC         ;
                    STA.w $0202               ;
CODE_03B3FC:        LDA.b $0C                 ;
                    BEQ   CODE_03B403         ;
                    JSR.w CODE_03B62B         ;
CODE_03B403:        JSR.w CODE_03C0B4         ;
                    STA.w $06FF               ;
                    LDA.b $0F                 ;\
                    CMP.b #$0B                ; |If Mario is not dying
                    BNE   CODE_03B414         ;/
                    LDA.b #$28                ;
                    STA.w $0709               ;
CODE_03B414:        JMP.w CODE_03C0FD         ;

                    db $0E,$04,$FC,$F2
                    db $00,$00,$FF,$FF

CODE_03B41F:        LDA.w $041C               ;
                    CLC                       ;
                    ADC.w $043C               ;
                    STA.w $041C               ;
                    LDY.b #$00                ;
                    LDA.b $A0                 ;
                    BPL   CODE_03B430         ;
                    DEY                       ;
CODE_03B430:        STY.b $00                 ;
                    ADC.w $0237               ;
                    STA.w $0237               ;
                    LDA.b $BB                 ;
                    ADC.b $00                 ;
                    STA.b $BB                 ;
                    LDA.b $0C                 ;
                    AND.w $0480               ;
                    BEQ   CODE_03B47D         ;
                    LDY.w $0791               ;
                    BNE   CODE_03B47C         ;
                    LDY.b #$18                ;
                    STY.w $0791               ;
                    LDX.b #$00                ;
                    LDY.w $0202               ;
                    LSR   A                   ;
                    BCS   CODE_03B460         ;
                    LDA.w $03AD               ;
                    CMP.b #$10                ;
                    BCC   CODE_03B47C         ;
                    INX                       ;
                    INX                       ;
CODE_03B460:        DEY                       ;
                    BEQ   CODE_03B464         ;
                    INX                       ;
CODE_03B464:        LDA.w $0219               ;
                    CLC                       ;
                    ADC.w $B417,x             ;
                    STA.w $0219               ;
                    LDA.b $78                 ;
                    ADC.w $B41B,x             ;
                    STA.b $78                 ;
                    LDA.b $0C                 ;
                    EOR.b #$03                ;
                    STA.w $0202               ;
CODE_03B47C:        RTS                       ;

CODE_03B47D:        STA.w $0791               ;
                    RTS                       ;

                    db $20,$20,$1E,$28,$28,$0D,$04

                    db $70,$70,$60,$90,$90,$0A,$09

                    db $FC,$FC,$FC,$FB,$FB,$FE,$FF

                    db $00,$00,$00,$00,$00,$80,$00

                    db $D8,$E8,$F0

                    db $28,$18,$10,$0C,$E4,$98,$D0

                    db $00,$FF,$01

                    db $00,$20,$FF

CODE_03B4AD:        LDA.b $28                 ;
                    CMP.b #$03                ;
                    BNE   CODE_03B4E3         ;
                    LDY.b #$00                ;
                    LDA.b $0B                 ;
                    AND.w $0480               ;
                    BEQ   CODE_03B4CF         ;
                    INY                       ;
                    AND.b #$08                ;
                    BEQ   CODE_03B4CE         ;
                    LDA.b $09                 ;\
                    AND.b #$07                ; |
                    BNE   CODE_03B4CF         ; |Each 7 frames,
                    LDA.b #$30                ; |
                    STA.w $1600               ;/Mario is climbing vine sound plays.
                    BRA   CODE_03B4CF         ;

CODE_03B4CE:        INY                       ;
CODE_03B4CF:        LDX.w $B4AA,y             ;
                    STX.w $043C               ;
                    LDA.b #$08                ;
                    LDX.w $B4A7,y             ;
                    STX.b $A0                 ;
                    BMI   CODE_03B4DF         ;
                    LSR   A                   ;
CODE_03B4DF:        STA.w $070C               ;
                    RTS                       ;

CODE_03B4E3:        LDA.w $070E               ;
                    BNE   CODE_03B4F2         ;
                    LDA.b $0A                 ;
                    AND.b #$80                ;
                    BEQ   CODE_03B4F2         ;
                    AND.b $0D                 ;
                    BEQ   CODE_03B4F5         ;
CODE_03B4F2:        JMP.w CODE_03B580         ;

CODE_03B4F5:        LDA.b $28                 ;
                    BEQ   CODE_03B50A         ;
                    LDA.w $0704               ;
                    BEQ   CODE_03B4F2         ;
                    LDA.w $078A               ;
                    BNE   CODE_03B50A         ;
                    LDA.b $A0                 ;
                    BPL   CODE_03B50A         ;
                    JMP.w CODE_03B580         ;

CODE_03B50A:        LDA.b #$20                ;
                    STA.w $078A               ;
                    LDY.b #$00                ;
                    STY.w $041C               ;
                    STY.w $043C               ;
                    LDA.b $BB                 ;
                    STA.w $0707               ;
                    LDA.w $0237               ;
                    STA.w $0708               ;
                    LDA.b #$01                ;
                    STA.b $28                 ;
                    LDA.w $0700               ;
                    CMP.b #$09                ;
                    BCC   CODE_03B53D         ;
                    INY                       ;
                    CMP.b #$10                ;
                    BCC   CODE_03B53D         ;
                    INY                       ;
                    CMP.b #$19                ;
                    BCC   CODE_03B53D         ;
                    INY                       ;
                    CMP.b #$1C                ;
                    BCC   CODE_03B53D         ;
                    INY                       ;
CODE_03B53D:        LDA.b #$01                ;
                    STA.w $0706               ;
                    LDA.w $0704               ;
                    BEQ   CODE_03B54F         ;
                    LDY.b #$05                ;
                    LDA.w $027D               ;
                    BEQ   CODE_03B54F         ;
                    INY                       ;
CODE_03B54F:        LDA.w $B481,y             ;
                    STA.w $0709               ;
                    LDA.w $B488,y             ;
                    STA.w $070A               ;
                    LDA.w $B496,y             ;
                    STA.w $043C               ;
                    LDA.w $B48F,y             ;
                    STA.b $A0                 ;
                    LDA.w $0704               ;
                    BEQ   CODE_03B57B         ;
                    LDA.b #$0E                ;\Mario is swimming sound
                    STA.w $1600               ;/
                    LDA.w $0237               ;
                    CMP.b #$14                ;
                    BCS   CODE_03B580         ;
                    STZ.b $A0                 ;
                    BRA   CODE_03B580         ;

CODE_03B57B:        LDA.b #$01                ;\Mario is jumping sound
                    STA.w $1601               ;/
CODE_03B580:        LDY.b #$00                ;
                    STY.b $00                 ;
                    LDA.b $28                 ;
                    BEQ   CODE_03B591         ;
                    LDA.w $0700               ;
                    CMP.b #$19                ;
                    BCS   CODE_03B5C0         ;
                    BCC   CODE_03B5A8         ;
CODE_03B591:        INY                       ;
                    LDA.b $5C                 ;
                    BEQ   CODE_03B5A8         ;
                    DEY                       ;
                    LDA.b $0C                 ;
                    CMP.b $46                 ;
                    BNE   CODE_03B5A8         ;
                    LDA.b $0A                 ;
                    AND.b #$40                ;
                    BNE   CODE_03B5BB         ;
                    LDA.w $078B               ;
                    BNE   CODE_03B5C0         ;
CODE_03B5A8:        INY                       ;
                    INC.b $00                 ;
                    LDA.w $0703               ;
                    BNE   CODE_03B5B7         ;
                    LDA.w $0700               ;
                    CMP.b #$21                ;
                    BCC   CODE_03B5C0         ;
CODE_03B5B7:        INC.b $00                 ;
                    BRA   CODE_03B5C0         ;

CODE_03B5BB:        LDA.b #$0A                ;
                    STA.w $078B               ;
CODE_03B5C0:        LDA.w $B49D,y             ;
                    STA.w $045D               ;
                    LDA.b $0F                 ;
                    CMP.b #$07                ;
                    BNE   CODE_03B5CE         ;
                    LDY.b #$03                ;
CODE_03B5CE:        LDA.w $B4A0,y             ;
                    STA.w $0463               ;
                    LDY.b $00                 ;
                    LDA.w $B4A4,y             ;
                    STA.w $0702               ;
                    STZ.w $0701               ;
                    LDA.w $0202               ;
                    CMP.b $46                 ;
                    BEQ   CODE_03B5EC         ;
                    ASL.w $0702               ;
                    ROL.w $0701               ;
CODE_03B5EC:        RTS                       ;

                    db $02,$04,$07

CODE_03B5F0:        LDY.b #$00                ;
                    LDA.w $0700               ;
                    CMP.b #$1C                ;
                    BCS   CODE_03B60E         ;
                    INY                       ;
                    CMP.b #$0E                ;
                    BCS   CODE_03B5FF         ;
                    INY                       ;
CODE_03B5FF:        LDA.w $0FF4               ;
                    AND.b #$7F                ;
                    BEQ   CODE_03B624         ;
                    AND.b #$03                ;
                    CMP.b $46                 ;
                    BNE   CODE_03B613         ;
                    LDA.b #$00                ;
CODE_03B60E:        STA.w $0703               ;
                    BRA   CODE_03B624         ;

CODE_03B613:        LDA.w $0700               ;
                    CMP.b #$0B                ;
                    BCS   CODE_03B624         ;
                    LDA.w $0202               ;
                    STA.b $46                 ;
                    STZ.b $5D                 ;
                    STZ.w $0705               ;
CODE_03B624:        LDA.w $B5ED,y             ;
                    STA.w $070C               ;
                    RTS                       ;

CODE_03B62B:        AND.w $0480               ;
                    BNE   CODE_03B638         ;
                    LDA.b $5D                 ;
                    BEQ   CODE_03B67C         ;
                    BPL   CODE_03B658         ;
                    BMI   CODE_03B63B         ;
CODE_03B638:        LSR   A                   ;
                    BCC   CODE_03B658         ;
CODE_03B63B:        LDA.w $0705               ;
                    CLC                       ;
                    ADC.w $0702               ;
                    STA.w $0705               ;
                    LDA.b $5D                 ;
                    ADC.w $0701               ;
                    STA.b $5D                 ;
                    CMP.w $0463               ;
                    BMI   CODE_03B673         ;
                    LDA.w $0463               ;
                    STA.b $5D                 ;
                    BRA   CODE_03B67C         ;

CODE_03B658:        LDA.w $0705               ;
                    SEC                       ;
                    SBC.w $0702               ;
                    STA.w $0705               ;
                    LDA.b $5D                 ;
                    SBC.w $0701               ;
                    STA.b $5D                 ;
                    CMP.w $045D               ;
                    BPL   CODE_03B673         ;
                    LDA.w $045D               ;
                    STA.b $5D                 ;
CODE_03B673:        CMP.b #$00                ;
                    BPL   CODE_03B67C         ;
                    EOR.b #$FF                ;
                    CLC                       ;
                    ADC.b #$01                ;
CODE_03B67C:        STA.w $0700               ;
                    RTS                       ;

CODE_03B680:        LDA.w $0756               ;
                    CMP.b #$02                ;
                    BCC   CODE_03B6CB         ;
                    LDA.b $0A                 ;
                    AND.b #$40                ;
                    BEQ   CODE_03B6C1         ;
                    AND.b $0D                 ;
                    BNE   CODE_03B6C1         ;
                    LDA.w $06CE               ;
                    AND.b #$01                ;
                    TAX                       ;
                    LDA.b $33,x               ;
                    BNE   CODE_03B6C1         ;
                    LDY.b $BB                 ;
                    DEY                       ;
                    BNE   CODE_03B6C1         ;
                    LDA.w $0714               ;
                    BNE   CODE_03B6C1         ;
                    LDA.b $28                 ;
                    CMP.b #$03                ;
                    BEQ   CODE_03B6C1         ;
                    LDA.b #$06                ;\Mario threw a fireball sound
                    STA.w $1603               ;/
                    LDA.b #$02                ;
                    STA.b $33,x               ;
                    LDY.w $070C               ;
                    STY.w $0711               ;
                    DEY                       ;
                    STY.w $0789               ;
                    INC.w $06CE               ;
CODE_03B6C1:        LDX.b #$00                ;
                    JSR.w CODE_03B6E6         ;
                    LDX.b #$01                ;
                    JSR.w CODE_03B6E6         ;
CODE_03B6CB:        LDA.b $5C                 ;
                    BNE   CODE_03B6E3         ;
                    LDX.b #$02                ;
CODE_03B6D1:        STX.b $9E                 ;
                    JSR.w CODE_03B780         ;
                    JSR.w CODE_03FD1A         ;
                    JSR.w CODE_03FDAD         ;
                    JSL.l CODE_05E2AA         ;
                    DEX                       ;
                    BPL   CODE_03B6D1         ;
CODE_03B6E3:        RTS                       ;

                    db $40,$C0                ;Fireball X-speed: Right, left

CODE_03B6E6:        STX.b $9E                 ;
                    LDA.b $33,x               ;
                    ASL   A                   ;
                    BCC   CODE_03B6F0         ;
                    JMP.w CODE_03B77A         ;

CODE_03B6F0:        LDY.b $33,x               ;\If fireball exists in any form,
                    BNE   CODE_03B6F7         ; |Go to fireball throw routine
                    JMP.w CODE_03B779         ;/Otherwise, return

CODE_03B6F7:        DEY                       ;
                    BEQ   CODE_03B726         ;

;This piece of code only triggers... |
;...when Mario throws a fireball.    V
                    LDA.w $0219               ;\Load Mario's X-pos (X-pos in single page)
                    ADC.b #$04                ; |Add $04/$05 to it (Depends on C flag)
                    STA.w $0224,x             ;/Store into Fireball creation X-pos
                    LDA.b $78                 ;\Load Mario's X-pos (Page # player is in)
                    ADC.b #$00                ; |Add $00/$01 to it (Depends on C flag)
                    STA.b $83,x               ;/Store into page of Fireball (not sure)
                    LDA.w $0237               ;\Load Mario's Y-pos
                    STA.w $0242,x             ;/Store into Y-pos of fireball
                    LDA.b #$01                ;\Set the "Mario threw a fireball" flag
                    STA.b $C6,x               ;/
                    LDY.w $0202               ;\Mario's direction
                    DEY                       ; |Decrease with 1
                    LDA.w $B6E4,y             ; |Load Horizontal speeds
                    STA.b $68,x               ;/Store into Fireball horizontal speed
                    LDA.b #$04                ;\Y-speed of the fireball when it gets thrown
                    STA.b $AB,x               ;/Which is of course, downwards
                    LDA.b #$07                ;
                    STA.w $049A,x             ;
                    DEC.b $33,x               ;Decrease fireball state timer
CODE_03B726:        TXA                       ;
                    CLC                       ;
                    ADC.b #$0B                ;
                    TAX                       ;
                    LDA.b #$50                ;
                    STA.b $00                 ;
                    LDA.b #$03                ;
                    STA.b $02                 ;
                    LDA.b #$00                ;
                    JSR.w CODE_03C18B         ;
                    JSR.w CODE_03C0BA         ;
                    LDX.b $9E                 ;
                    JSR.w CODE_03FD23         ;
                    JSR.w CODE_03FDA3         ;
                    JSR.w CODE_03E9B6         ;
                    JSR.w CODE_03E946         ;
                    LDA.w $03D2               ;
                    AND.b #$FC                ;
                    BEQ   CODE_03B76F         ;
                    AND.b #$F0                ;
                    BNE   CODE_03B775         ;
                    LDA.w $68,x             ;
                    BMI   CODE_03B764         ;
                    LDA.w $03D2               ;
                    AND.b #$0F                ;
                    CMP.b #$0F                ;
                    BEQ   CODE_03B775         ;
                    BRA   CODE_03B772         ;

CODE_03B764:        LDA.w $03D2               ;
                    AND.b #$0C                ;
                    CMP.b #$0C                ;
                    BEQ   CODE_03B775         ;
                    BRA   CODE_03B772         ;

CODE_03B76F:        JSR.w CODE_03DC70         ;
CODE_03B772:        JMP.w CODE_03F443         ;

CODE_03B775:        LDA.b #$00                ;
                    STA.b $33,x               ;
CODE_03B779:        RTS                       ;

CODE_03B77A:        JSR.w CODE_03FD23         ;
                    JMP.w CODE_03F4A8         ;

CODE_03B780:        LDA.w $07B8,x             ;
                    AND.b #$01                ;
                    STA.b $07                 ;
                    LDA.w $0251,x             ;
                    CMP.b #$F8                ;
                    BNE   CODE_03B7BF         ;
                    LDA.w $079E               ;
                    BNE   CODE_03B7D9         ;
CODE_03B793:        LDY.b #$00                ;
                    LDA.w $0202               ;
                    LSR   A                   ;
                    BCC   CODE_03B79D         ;
                    LDY.b #$08                ;
CODE_03B79D:        TYA                       ;
                    ADC.w $0219               ;
                    STA.w $0233,x             ;
                    LDA.b $78                 ;
                    ADC.b #$00                ;
                    STA.b $92,x               ;
                    LDA.w $0237               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0251,x             ;
                    LDA.b #$01                ;
                    STA.b $D5,x               ;
                    LDY.b $07                 ;
                    LDA.w $B7DC,y             ;
                    STA.w $079E               ;
CODE_03B7BF:        LDY.b $07                 ;
                    LDA.w $0436,x             ;
                    SEC                       ;
                    SBC.w $B7DA,y             ;
                    STA.w $0436,x             ;
                    LDA.w $0251,x             ;
                    SBC.b #$00                ;
                    CMP.b #$20                ;
                    BCS   CODE_03B7D6         ;
                    LDA.b #$F8                ;
CODE_03B7D6:        STA.w $0251,x             ;
CODE_03B7D9:        RTS                       ;

                    db $FF,$50
                    db $40,$20

CODE_03B7DE:        LDA.w $0770               ;
                    BEQ   CODE_03B838         ;
                    LDA.b $0F                 ;
                    CMP.b #$08                ;
                    BCC   CODE_03B838         ;
                    CMP.b #$0B                ;
                    BEQ   CODE_03B838         ;
                    LDA.b $BB                 ;
                    CMP.b #$02                ;
                    BPL   CODE_03B838         ;
                    LDA.w $078F               ;
                    BNE   CODE_03B838         ;
                    LDA.w $07E9               ;
                    ORA.w $07EA               ;
                    ORA.w $07EB               ;
                    BEQ   CODE_03B82F         ;
                    LDY.w $07E9               ;
                    DEY                       ;
                    BNE   CODE_03B816         ;
                    LDA.w $07EA               ;
                    ORA.w $07EB               ;
                    BNE   CODE_03B816         ;
                    LDA.b #$FF                ;\Time is running out! sound
                    STA.w $1600               ;/
CODE_03B816:        LDA.b #$18                ;
                    STA.w $078F               ;
                    LDY.b #$23                ;
                    LDA.b #$FF                ;
                    STA.w $014A               ;
                    LDA.w $0E73               ;
                    BNE   CODE_03B82A         ;
                    JSR.w CODE_039CF9         ;
CODE_03B82A:        LDA.b #$A4                ;
                    JMP.w CODE_039C82         ;

CODE_03B82F:        STA.w $0756               ;
                    JSR.w CODE_03DF52         ;
                    INC.w $0759               ;
CODE_03B838:        RTS                       ;

CODE_03B839:        LDA.w $0723               ;
                    BEQ   CODE_03B838         ;
                    LDA.w $0237               ;
                    AND.b $BB                 ;
                    BNE   CODE_03B838         ;
                    STA.w $0723               ;
                    INC.w $06D6               ;
                    JMP.w CODE_03CDE2         ;

CODE_03B84E:        LDA.b $5C                 ;
                    BNE   CODE_03B88F         ;
                    STA.w $027D               ;
                    JSL.l CODE_048378         ;
                    LDA.w $0747               ;
                    BNE   CODE_03B88F         ;
                    LDY.b #$04                ;
CODE_03B860:        LDA.w $0271,y             ;
                    CLC                       ;
                    ADC.w $0277,y             ;
                    STA.b $02                 ;
                    LDA.w $026B,y             ;
                    BEQ   CODE_03B88C         ;
                    ADC.b #$00                ;
                    STA.b $01                 ;
                    LDA.w $0219               ;
                    SEC                       ;
                    SBC.w $0271,y             ;
                    LDA.b $78                 ;
                    SBC.w $026B,y             ;
                    BMI   CODE_03B88C         ;
                    LDA.b $02                 ;
                    SEC                       ;
                    SBC.w $0219               ;
                    LDA.b $01                 ;
                    SBC.b $78                 ;
                    BPL   CODE_03B890         ;
CODE_03B88C:        DEY                       ;
                    BPL   CODE_03B860         ;
CODE_03B88F:        RTS                       ;

CODE_03B890:        LDA.w $0277,y             ;
                    LSR   A                   ;
                    STA.b $00                 ;
                    LDA.w $0271,y             ;
                    CLC                       ;
                    ADC.b $00                 ;
                    STA.b $01                 ;
                    LDA.w $026B,y             ;
                    ADC.b #$00                ;
                    STA.b $00                 ;
                    LDA.b $09                 ;
                    LSR   A                   ;
                    BCC   CODE_03B8DB         ;
                    LDA.b $01                 ;
                    SEC                       ;
                    SBC.w $0219               ;
                    LDA.b $00                 ;
                    SBC.b $78                 ;
                    BPL   CODE_03B8C6         ;
                    LDA.w $0219               ;
                    SEC                       ;
                    SBC.b #$01                ;
                    STA.w $0219               ;
                    LDA.b $78                 ;
                    SBC.b #$00                ;
                    JMP.w CODE_03B8D9         ;

CODE_03B8C6:        LDA.w $0480               ;
                    LSR   A                   ;
                    BCC   CODE_03B8DB         ;
                    LDA.w $0219               ;
                    CLC                       ;
                    ADC.b #$01                ;
                    STA.w $0219               ;
                    LDA.b $78                 ;
                    ADC.b #$00                ;
CODE_03B8D9:        STA.b $78                 ;
CODE_03B8DB:        LDA.b #$10                ;
                    STA.b $00                 ;
                    LDA.b #$01                ;
                    STA.w $027D               ;
                    STA.b $02                 ;
                    LSR   A                   ;
                    TAX                       ;
                    JMP.w CODE_03C18B         ;

                    db $05,$02,$08,$04,$01

                    db $03,$03,$04,$04,$04

CODE_03B8F5:        LDX.b #$05                ;
                    STX.b $9E                 ;
                    LDA.b $1C,x               ;
                    CMP.b #$30                ;
                    BEQ   CODE_03B902         ;
                    JMP.w CODE_03B98C         ;

CODE_03B902:        LDA.b $0F                 ;
                    CMP.b #$04                ;
                    BNE   CODE_03B93D         ;
                    LDA.b $28                 ;
                    CMP.b #$03                ;
                    BNE   CODE_03B93D         ;
                    LDA.w $0238,x             ;
                    CMP.b #$AA                ;
                    BCS   CODE_03B93F         ;
                    LDA.w $0237               ;
                    CMP.b #$A2                ;
                    BCS   CODE_03B93F         ;
                    LDA.w $041D,x             ;
                    ADC.b #$FF                ;
                    STA.w $041D,x             ;
                    LDA.w $0238,x             ;
                    ADC.b #$01                ;
                    STA.w $0238,x             ;
                    LDA.w $010E               ;
                    SEC                       ;
                    SBC.b #$FF                ;
                    STA.w $010E               ;
                    LDA.w $010D               ;
                    SBC.b #$01                ;
                    STA.w $010D               ;
CODE_03B93D:        BRA   CODE_03B982         ;

CODE_03B93F:        LDY.w $010F               ;
                    LDA.w $B8EB,y             ;
                    LDX.w $B8F0,y             ;
                    STA.w $0145,x             ;
                    JSR.w CODE_03BD55         ;
                    LDA.b #$05                ;
                    STA.b $0F                 ;
                    LDA.b #$0C                ;\Goal music
                    STA.w $1602               ;/
                    LDA.w $0202               ;
                    AND.b #$02                ;
                    BNE   CODE_03B962         ;
                    LDA.b #$6E                ;
                    BRA   CODE_03B964         ;

CODE_03B962:        LDA.b #$60                ;
CODE_03B964:        STA.w $02FD               ;
                    LDA.w $0219               ;
                    STA.w $03CC               ;
                    LDA.b $78                 ;
                    STA.w $03CD               ;
                    LDA.b #$20                ;
                    STA.w $03FB               ;
                    STA.w $03FA               ;
                    LDA.b #$20                ;
                    STA.w $03FB               ;
                    STA.w $03FA               ;
CODE_03B982:        JSR.w CODE_03FDCB         ;
                    JSR.w CODE_03FD39         ;
                    JSL.l CODE_05EAA0         ;
CODE_03B98C:        RTS                       ;

                    db $08,$10,$08,$00

CODE_03B991:        JSR.w CODE_03FDCB         ;
                    LDA.w $0747               ;
                    BNE   CODE_03B9E1         ;
                    LDA.w $070E               ;
                    BEQ   CODE_03B9E1         ;
                    TAY                       ;
                    DEY                       ;
                    TYA                       ;
                    AND.b #$02                ;
                    BNE   CODE_03B9AE         ;
                    INC.w $0237               ;
                    INC.w $0237               ;
                    JMP.w CODE_03B9B4         ;

CODE_03B9AE:        DEC.w $0237               ;
                    DEC.w $0237               ;
CODE_03B9B4:        LDA.b $5E,x               ;
                    CLC                       ;
                    ADC.w $B98D,y             ;
                    STA.w $0238,x             ;
                    CPY.b #$01                ;
                    BCC   CODE_03B9D0         ;
                    LDA.b $0A                 ;
                    AND.b #$80                ;
                    BEQ   CODE_03B9D0         ;
                    AND.b $0D                 ;
                    BNE   CODE_03B9D0         ;
                    LDA.b #$F4                ;
                    STA.w $06DB               ;
CODE_03B9D0:        CPY.b #$03                ;
                    BNE   CODE_03B9E1         ;
                    LDA.w $06DB               ;
                    STA.b $A0                 ;
                    STZ.w $070E               ;
                    LDA.b #$08                ;
                    STA.w $1603               ;
CODE_03B9E1:        JSR.w CODE_03FD39         ;
                    JSR.w CODE_03EEEF         ;
                    JSR.w CODE_03DC03         ;
                    LDA.w $070E               ;
                    BEQ   CODE_03B9FC         ;
                    LDA.w $078E               ;
                    BNE   CODE_03B9FC         ;
                    LDA.b #$04                ;
                    STA.w $078E               ;
                    INC.w $070E               ;
CODE_03B9FC:        RTS                       ;

CODE_03B9FD:        LDA.b #$2F                ;\Spawn a vine
                    STA.b $1C,x               ;/
                    LDA.b #$01                ;\
                    STA.b $10,x               ;/Sprite on screen
                    LDA.w $85,y             ;\Spawn in current screen of course
                    STA.b $79,x               ;/
                    LDA.w $0226,y             ;\Spawn at the brick
                    STA.w $021A,x             ;/
                    LDA.w $0244,y             ;\
                    BNE   CODE_03BA17         ; |If brick position is at the very top
                    LDA.b #$F0                ; |Spawn vine from the very bottom
CODE_03BA17:        STA.w $0238,x             ;/ (Used in level entrances with the vine animation?)
                    LDY.w $0398               ;
                    BNE   CODE_03BA22         ;
                    STA.w $039D               ;
CODE_03BA22:        TXA                       ;
                    STA.w $039A,y             ;
                    INC.w $0398               ;
                    LDA.b #$03                ;\
                    STA.w $1603               ;/Play vine sound
                    RTS                       ;Return

                    db $60,$90

CODE_03BA31:        CPX.b #$09                ;
                    BEQ   CODE_03BA36         ;
                    RTS                       ;

CODE_03BA36:        LDA.w $0236               ;
                    BNE   CODE_03BA40         ;
                    LDA.w $BA30               ;
                    BRA   CODE_03BA43         ;

CODE_03BA40:        LDA.w $BA2F               ;
CODE_03BA43:        CMP.w $0399               ;
                    BEQ   CODE_03BA58         ;
                    LDA.b $09                 ;
                    LSR   A                   ;
                    BCC   CODE_03BA58         ;
                    LDA.w $0241               ;
                    SBC.b #$01                ;
                    STA.w $0241               ;
                    INC.w $0399               ;
CODE_03BA58:        LDA.w $0399               ;
                    CMP.b #$08                ;
                    BCC   CODE_03BA9D         ;
                    JSR.w CODE_03FD39         ;
                    JSR.w CODE_03FDCB         ;
                    LDY.b #$00                ;
                    JSL.l CODE_05DA72         ;
                    LDA.w $03D1               ;
                    AND.b #$0F                ;
                    CMP.b #$0F                ;
                    BNE   CODE_03BA7F         ;
                    LDX.b #$09                ;
                    JSR.w CODE_03CDE2         ;
                    STA.w $0398               ;
                    STA.w $0399               ;
CODE_03BA7F:        LDA.w $0399               ;
                    CMP.b #$20                ;
                    BCC   CODE_03BA9D         ;
                    LDX.b #$0A                ;
                    LDA.b #$01                ;
                    LDY.b #$1B                ;
                    JSR.w CODE_03EB83         ;
                    LDY.b $02                 ;
                    CPY.b #$D0                ;
                    BCS   CODE_03BA9D         ;
                    LDA.b ($06),y             ;
                    BNE   CODE_03BA9D         ;
                    LDA.b #$2A                ;
                    STA.b ($06),y             ;
CODE_03BA9D:        LDX.b $9E                 ;
                    RTS                       ;

                    db $0F,$07

CODE_03BAA2:        LDA.b $5C                 ;
                    BEQ   CODE_03BB15         ;
                    LDX.b #$02                ;
CODE_03BAA8:        STX.b $9E                 ;
                    LDA.b $10,x               ;
                    BNE   CODE_03BAFF         ;
                    LDA.w $07B8,x             ;
                    LDY.w $06CC               ;
                    AND.w $BAA0,y             ;
                    CMP.b #$06                ;
                    BCS   CODE_03BAFF         ;
                    TAY                       ;
                    LDA.w $026B,y             ;
                    BEQ   CODE_03BAFF         ;
                    LDA.w $027D,y             ;
                    BEQ   CODE_03BACD         ;
                    SBC.b #$00                ;
                    STA.w $027D,y             ;
                    BRA   CODE_03BAFF         ;

CODE_03BACD:        LDA.w $0747               ;
                    BNE   CODE_03BAFF         ;
                    LDA.b #$0E                ;
                    STA.w $027D,y             ;
                    LDA.w $026B,y             ;
                    STA.b $79,x               ;
                    LDA.w $0271,y             ;
                    STA.w $021A,x             ;
                    LDA.w $0277,y             ;
                    SEC                       ;
                    SBC.b #$08                ;
                    STA.w $0238,x             ;
                    LDA.b #$01                ;
                    STA.b $BC,x               ;
                    STA.b $10,x               ;
                    LSR   A                   ;
                    STA.b $29,x               ;
                    LDA.b #$09                ;
                    STA.w $0490,x             ;
                    LDA.b #$33                ;
                    STA.b $1C,x               ;
                    BRA   CODE_03BB12         ;

CODE_03BAFF:        LDA.b $1C,x               ;
                    CMP.b #$33                ;
                    BNE   CODE_03BB12         ;
                    JSR.w CODE_03DC03         ;
                    LDA.b $10,x               ;
                    BEQ   CODE_03BB12         ;
                    JSR.w CODE_03FDCB         ;
                    JSR.w CODE_03BB18         ;
CODE_03BB12:        DEX                       ;
                    BPL   CODE_03BAA8         ;
CODE_03BB15:        RTS                       ;

                    db $18,$E8

CODE_03BB18:        LDA.w $0747               ;
                    BNE   CODE_03BB70         ;
                    LDA.b $29,x               ;
                    BNE   CODE_03BB53         ;
                    LDA.w $03D1               ;
                    AND.b #$0C                ;
                    CMP.b #$0C                ;
                    BEQ   CODE_03BB7F         ;
                    LDY.b #$01                ;
                    JSR.w CODE_03E8BC         ;
                    BMI   CODE_03BB32         ;
                    INY                       ;
CODE_03BB32:        STY.b $47,x               ;
                    DEY                       ;
                    LDA.w $BB16,y             ;
                    STA.b $5E,x               ;
                    LDA.b $00                 ;
                    ADC.b #$28                ;
                    CMP.b #$50                ;
                    BCC   CODE_03BB7F         ;
                    LDA.b #$01                ;
                    STA.b $29,x               ;
                    LDA.b #$0A                ;
                    STA.w $0792,x             ;
                    LDA.b #$4A                ;
                    STA.w $1603               ;
                    JSR.w CODE_03C27B         ;
CODE_03BB53:        LDA.w $03D1               ;
                    AND.b #$F0                ;
                    CMP.b #$F0                ;
                    BEQ   CODE_03BB7F         ;
                    LDA.b $29,x               ;
                    AND.b #$20                ;
                    BEQ   CODE_03BB65         ;
                    JSR.w CODE_03C113         ;
CODE_03BB65:        LDA.w $0E67               ;
                    BNE   CODE_03BB70         ;
                    JSR.w CODE_03C0AD         ;
                    JSR.w CODE_03C1FA         ;
CODE_03BB70:        JSR.w CODE_03FDCB         ;
                    JSR.w CODE_03FD39         ;
                    JSR.w CODE_03E9CC         ;
                    JSR.w CODE_03DE55         ;
                    JMP.w CODE_03EEEF         ;

CODE_03BB7F:        JSR.w CODE_03CDE2         ;
                    RTS                       ;

                    db $04,$04,$04,$05,$05,$05,$06,$06
                    db $06

                    db $10,$F0

CODE_03BB8E:        LDA.w $07B8               ;
                    AND.b #$07                ;
                    BNE   CODE_03BB9A         ;
                    LDA.w $07B8               ;
                    AND.b #$08                ;
CODE_03BB9A:        TAY                       ;
                    LDA.w $39,y             ;
                    BNE   CODE_03BBB9         ;
                    LDX.w $BB83,y             ;
                    LDA.b $10,x               ;
                    BNE   CODE_03BBB9         ;
                    LDX.b $9E                 ;
                    TXA                       ;
                    STA.w $06AE,y             ;
                    LDA.b #$90                ;
                    STA.w $39,y             ;
                    LDA.b #$07                ;
                    STA.w $049C,y             ;
                    SEC                       ;
                    RTS                       ;

CODE_03BBB9:        LDX.b $9E                 ;\
                    CLC                       ; |Get sprite index and clear carry flag
                    RTS                       ;/

CODE_03BBBD:        LDA.w $0747               ;
                    BEQ   CODE_03BBC5         ;
                    JMP.w CODE_03BC4B         ;

CODE_03BBC5:        LDA.b $39,x               ;
                    AND.b #$7F                ;
                    LDY.w $06AE,x             ;
                    CMP.b #$02                ;
                    BEQ   CODE_03BBF0         ;
                    BCS   CODE_03BC06         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.b #$11                ;
                    TAX                       ;
                    LDA.b #$10                ;
                    STA.b $00                 ;
                    LDA.b #$0F                ;
                    STA.b $01                 ;
                    LDA.b #$04                ;
                    STA.b $02                 ;
                    LDA.b #$00                ;
                    JSR.w CODE_03C18B         ;
                    JSR.w CODE_03C0BA         ;
                    LDX.b $9E                 ;
                    JMP.w CODE_03BC48         ;

CODE_03BBF0:        LDA.b #$FE                ;
                    STA.b $B1,x               ;
                    LDA.w $29,y             ;
                    AND.b #$F7                ;
                    STA.w $29,y             ;
                    LDX.b $47,y               ;
                    DEX                       ;
                    LDA.w $BB8C,x             ;
                    LDX.b $9E                 ;
                    STA.b $6E,x               ;
CODE_03BC06:        DEC.b $39,x               ;
                    LDA.b $39,x               ;
                    CMP.b #$81                ;
                    BNE   CODE_03BC13         ;
                    LDA.b #$37                ;\Hammer thrown sound
                    STA.w $1600               ;/
CODE_03BC13:        LDA.w $1C,y             ;
                    CMP.b #$2D                ;
                    BNE   CODE_03BC1E         ;
                    LDA.b #$08                ;
                    BRA   CODE_03BC2B         ;

CODE_03BC1E:        LDA.w $47,y             ;
                    CMP.b #$02                ;
                    BNE   CODE_03BC29         ;
                    LDA.b #$06                ;
                    BRA   CODE_03BC2B         ;

CODE_03BC29:        LDA.b #$02                ;
CODE_03BC2B:        CLC                       ;
                    ADC.w $021A,y             ;
                    STA.w $022A,x             ;
                    LDA.w $79,y             ;
                    ADC.b #$00                ;
                    STA.b $89,x               ;
                    LDA.w $0238,y             ;
                    SEC                       ;
                    SBC.b #$0A                ;
                    STA.w $0248,x             ;
                    LDA.b #$01                ;
                    STA.b $CC,x               ;
                    BNE   CODE_03BC4B         ;
CODE_03BC48:        JSR.w CODE_03DDBE         ;
CODE_03BC4B:        JSR.w CODE_03FDB7         ;
                    JSR.w CODE_03FD30         ;
                    JSR.w CODE_03E9BF         ;
                    JSL.l CODE_05DD07         ;
                    RTS                       ;

CODE_03BC59:        JSR.w CODE_03BCA7         ;
                    LDA.b $85,x               ;
                    STA.w $89,y             ;
                    LDA.w $0226,x             ;
                    ORA.b #$05                ;
                    STA.w $022A,y             ;
                    LDA.w $0244,x             ;
                    SBC.b #$10                ;
                    STA.w $0248,y             ;
                    BRA   CODE_03BC8E         ;

CODE_03BC73:        JSR.w CODE_03BCA7         ;
                    LDA.w $03EC,x             ;
                    STA.w $89,y             ;
                    LDA.b $06                 ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ORA.b #$05                ;
                    STA.w $022A,y             ;
                    LDA.b $02                 ;
                    ADC.b #$20                ;
                    STA.w $0248,y             ;
CODE_03BC8E:        LDA.b #$FB                ;
                    STA.w $B1,y             ;
                    LDA.b #$01                ;
                    STA.w $CC,y             ;
                    STA.w $39,y             ;
                    STA.w $1603               ;
                    STX.b $9E                 ;
                    JSR.w CODE_03BD2C         ;
                    INC.w $0748               ;
                    RTS                       ;

CODE_03BCA7:        LDY.b #$08                ;
CODE_03BCA9:        LDA.w $39,y             ;
                    BEQ   CODE_03BCB5         ;
                    DEY                       ;
                    CPY.b #$05                ;
                    BNE   CODE_03BCA9         ;
                    LDY.b #$08                ;
CODE_03BCB5:        STY.w $06B7               ;
                    RTS                       ;

CODE_03BCB9:        LDX.b #$08                ;
CODE_03BCBB:        STX.b $9E                 ;
                    LDA.b $39,x               ;
                    BEQ   CODE_03BD22         ;
                    ASL   A                   ;
                    BCC   CODE_03BCCA         ;
                    JSR.w CODE_03BBBD         ;
                    JMP.w CODE_03BD22         ;

CODE_03BCCA:        LDY.b $39,x               ;
                    DEY                       ;
                    BEQ   CODE_03BCEE         ;
                    INC.b $39,x               ;
                    LDA.w $022A,x             ;
                    CLC                       ;
                    ADC.w $0775               ;
                    STA.w $022A,x             ;
                    LDA.b $89,x               ;
                    ADC.b #$00                ;
                    STA.b $89,x               ;
                    LDA.b $39,x               ;
                    CMP.b #$30                ;
                    BNE   CODE_03BD0D         ;
                    LDA.b #$00                ;
                    STA.b $39,x               ;
                    JMP.w CODE_03BD22         ;

CODE_03BCEE:        TXA                       ;
                    CLC                       ;
                    ADC.b #$11                ;
                    TAX                       ;
                    LDA.b #$50                ;
                    STA.b $00                 ;
                    LDA.b #$06                ;
                    STA.b $02                 ;
                    LSR   A                   ;
                    STA.b $01                 ;
                    LDA.b #$00                ;
                    JSR.w CODE_03C18B         ;
                    LDX.b $9E                 ;
                    LDA.b $B1,x               ;
                    CMP.b #$05                ;
                    BNE   CODE_03BD0D         ;
                    INC.b $39,x               ;
CODE_03BD0D:        LDA.b $B1,x               ;
                    BNE   CODE_03BD15         ;
                    JSL.l CODE_05DC7E         ;
CODE_03BD15:        JSR.w CODE_03FD30         ;
                    JSR.w CODE_03FDB7         ;
                    JSR.w CODE_03E9BF         ;
                    JSL.l CODE_05DCA0         ;
CODE_03BD22:        DEX                       ;
                    BPL   CODE_03BCBB         ;
                    RTS                       ;

DATA_03BD26:        db $17,$1D

DATA_03BD28:        db $0B,$11

DATA_03BD2A:        db $02,$13

CODE_03BD2C:        LDA.b #$01                ;
                    STA.w $014A               ;
                    LDX.w $0753               ;
                    LDY.w DATA_03BD26,x       ;
                    JSR.w CODE_039CF9         ;
                    INC.w $075E               ;
                    LDA.w $075E               ;
                    CMP.b #$64                ;
                    BNE   CODE_03BD50         ;
                    STZ.w $075E               ;
                    JSL.l CODE_048596         ;Increase lives by one
                    LDA.b #$05                ;
                    STA.w $1603               ;
CODE_03BD50:        LDA.b #$02                ;
                    STA.w $0149               ;
CODE_03BD55:        LDX.w $0753               ;
                    LDY.w DATA_03BD28,x       ;
                    JSR.w CODE_039CF9         ;
CODE_03BD5E:        LDY.w $0EC3               ;
                    LDA.w DATA_03BD2A,y       ;
CODE_03BD64:        JSR.w CODE_039C82         ;
                    LDY.w $1700               ;
                    LDA.w $16F6,y             ;
                    BNE   CODE_03BD7D         ;
                    LDA.b #$28                ;
                    LDX.w $16F2,y             ;
                    CPX.b #$02                ;
                    BNE   CODE_03BD7A         ;
                    LDA.b #$24                ;
CODE_03BD7A:        STA.w $16F6,y             ;
CODE_03BD7D:        LDX.b $9E                 ;
                    RTS                       ;

CODE_03BD80:        LDA.b #$2E                ;
                    STA.b $25                 ;
                    LDA.b $85,x               ;
                    STA.b $82                 ;
                    LDA.w $0226,x             ;
                    STA.w $0223               ;
                    LDA.b #$01                ;
                    STA.b $C5                 ;
                    LDA.w $0244,x             ;
                    SEC                       ;
                    SBC.b #$08                ;
                    STA.w $0241               ;
CODE_03BD9B:        LDA.b #$01                ;
                    STA.b $32                 ;
                    STA.b $19                 ;
                    LDA.b #$03                ;
                    STA.w $0499               ;
                    LDA.w $020C               ;
                    CMP.b #$02                ;
                    BCS   CODE_03BDB8         ;
                    LDA.w $0756               ;
                    CMP.b #$02                ;
                    BCC   CODE_03BDB5         ;
                    LSR   A                   ;
CODE_03BDB5:        STA.w $020C               ;
CODE_03BDB8:        LDA.b #$30                ;
                    STA.w $0260               ;
                    LDA.b #$02                ;
                    STA.w $1603               ;
                    RTS                       ;

CODE_03BDC3:        LDX.b #$09                ;
                    STX.b $9E                 ;
                    LDA.b $32                 ;
                    BNE   CODE_03BDCE         ;
                    JMP.w CODE_03BE72         ;

CODE_03BDCE:        ASL   A                   ;
                    BCC   CODE_03BDF5         ;
                    LDA.w $0747               ;
                    BNE   CODE_03BE1E         ;
                    LDA.w $020C               ;
                    BEQ   CODE_03BDEC         ;
                    CMP.b #$03                ;
                    BEQ   CODE_03BDEC         ;
                    CMP.b #$02                ;
                    BNE   CODE_03BE1E         ;
                    JSR.w CODE_03CF8A         ;
                    JSR.w CODE_03E8E1         ;
                    JMP.w CODE_03BE1E         ;

CODE_03BDEC:        JSR.w CODE_03CF08         ;
                    JSR.w CODE_03E72E         ;
                    JMP.w CODE_03BE1E         ;

CODE_03BDF5:        LDA.b $09                 ;
                    AND.b #$03                ;
                    BNE   CODE_03BE15         ;
                    DEC.w $0241               ;
                    LDA.b $32                 ;
                    INC.b $32                 ;
                    CMP.b #$11                ;
                    BCC   CODE_03BE15         ;
                    LDA.b #$10                ;
                    STA.b $5E,x               ;
                    LDA.b #$80                ;
                    STA.b $32                 ;
                    ASL   A                   ;
                    STA.w $0260               ;
                    ROL   A                   ;
                    STA.b $47,x               ;
CODE_03BE15:        LDA.b $32                 ;
                    CMP.b #$06                ;
                    BCS   CODE_03BE1E         ;
                    JMP.w CODE_03BE72         ;

CODE_03BE1E:        JMP.w CODE_03BE60         ;

                    LDA.b $79,x               ;
                    STA.b $E9                 ;
                    LDA.w $021A,x             ;
                    STA.b $E8                 ;
                    REP   #$20                ;
                    LDA.b $E8                 ;
                    CMP.b $42                 ;
                    BCS   CODE_03BE43         ;
                    CLC                       ;
                    ADC.w #$000C              ;
                    STA.b $E6                 ;
                    SEP   #$20                ;
                    LDA.b $E6                 ;
                    STA.w $021A,x             ;
                    LDA.b $E7                 ;
                    STA.b $79,x               ;
CODE_03BE43:        SEP   #$20                ;
                    JSR.w CODE_03FD39         ;
                    JSR.w CODE_03FDCB         ;
                    JSR.w CODE_03E9CC         ;
                    JSR.w CODE_03ED03         ;
                    JSR.w CODE_03DE55         ;
                    JSR.w CODE_03DC03         ;
                    LDA.b $E8                 ;
                    STA.w $021A,x             ;
                    LDA.b $E9                 ;
                    STA.b $79,x               ;
CODE_03BE60:        JSR.w CODE_03FD39         ;
                    JSR.w CODE_03FDCB         ;
                    JSR.w CODE_03E9CC         ;
                    JSR.w CODE_03ED03         ;
                    JSR.w CODE_03DE55         ;
                    JSR.w CODE_03DC03         ;
CODE_03BE72:        RTS                       ;

                    TSB.b $12                 ;
CODE_03BE75:        PHA                       ;
                    LDA.b #$11                ;
                    LDX.w $03F0               ;
                    LDY.w $0754               ;
                    BNE   CODE_03BE82         ;
                    LDA.b #$12                ;
CODE_03BE82:        STA.b $35,x               ;
                    JSR.w CODE_03938E         ;
                    LDX.w $03F0               ;
                    LDA.b $02                 ;
                    STA.w $03E6,x             ;
                    TAY                       ;
                    LDA.b $06                 ;
                    STA.w $03E8,x             ;
                    LDA.b ($06),y             ;
                    JSR.w CODE_03BF95         ;
                    STA.b $00                 ;
                    LDY.w $0754               ;
                    BNE   CODE_03BEA2         ;
                    TYA                       ;
CODE_03BEA2:        BCC   CODE_03BEC9         ;
                    LDY.b #$11                ;
                    STY.b $35,x               ;
                    LDA.b #$FC                ;
                    LDY.b $00                 ;
                    CPY.b #$5B                ;
                    BEQ   CODE_03BEB4         ;
                    CPY.b #$60                ;
                    BNE   CODE_03BEC9         ;
CODE_03BEB4:        LDA.w $06BC               ;
                    BNE   CODE_03BEC1         ;
                    LDA.b #$0B                ;
                    STA.w $07AD               ;
                    INC.w $06BC               ;
CODE_03BEC1:        LDA.w $07AD               ;
                    BNE   CODE_03BEC8         ;
                    LDY.b #$FC                ;
CODE_03BEC8:        TYA                       ;
CODE_03BEC9:        STA.w $03EA,x             ;
                    JSR.w CODE_03BF0D         ;
                    LDY.b $02                 ;
                    LDA.b #$27                ;
                    STA.b ($06),y             ;
                    LDA.b #$10                ;
                    STA.w $078C               ;
                    PLA                       ;
                    STA.b $05                 ;
                    LDY.b #$00                ;
                    LDA.w $0714               ;
                    BNE   CODE_03BEE9         ;
                    LDA.w $0754               ;
                    BEQ   CODE_03BEEA         ;
CODE_03BEE9:        INY                       ;
CODE_03BEEA:        LDA.w $0237               ;
                    CLC                       ;
                    ADC.w $BE73,y             ;
                    AND.b #$F0                ;
                    STA.w $0244,x             ;
                    LDY.b $35,x               ;
                    CPY.b #$11                ;
                    BEQ   CODE_03BF01         ;
                    JSR.w CODE_03BFA1         ;
                    BRA   CODE_03BF04         ;

CODE_03BF01:        JSR.w CODE_03BF2C         ;
CODE_03BF04:        LDA.w $03F0               ;
                    EOR.b #$01                ;
                    STA.w $03F0               ;
                    RTS                       ;

CODE_03BF0D:        LDA.w $0219               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    AND.b #$F0                ;
                    STA.w $0226,x             ;
                    STA.w $0E16               ;
                    LDA.b $78                 ;
                    ADC.b #$00                ;
                    STA.b $85,x               ;
                    STA.w $03EC,x             ;
                    STA.w $0E17               ;
                    LDA.b $BB                 ;
                    STA.b $C8,x               ;
                    RTS                       ;

CODE_03BF2C:        JSR.w CODE_03BFC6         ;
                    LDA.b #$01                ;\"Mario hits ceiling/shell hits wall" sound
                    STA.w $1600               ;/
                    STZ.b $6A,x               ;Horizontal speed of bounce blocks: none
                    STZ.w $0449,x             ;
                    STZ.b $A0                 ;No vertical speed of Mario
                    LDA.b #$FE                ;\Vertical speed of bounce blocks
                    STA.b $AD,x               ;/
                    LDA.b $05                 ;
                    JSR.w CODE_03BF95         ;
                    BCC   CODE_03BF86         ;
                    TYA                       ;
                    CMP.b #$09                ;
                    BCC   CODE_03BF4D         ;
                    SBC.b #$05                ;
CODE_03BF4D:        ASL   A                   ;
                    TAY                       ;
                    LDA   PNTR_03BF5C,y    ;
                    STA.b $04                 ;
                    LDA.w $BF5D,y             ;
                    STA.b $05                 ;
                    JMP.w ($0004)             ;

;Looks like a pointer table of what the ? blocks spawn

PNTR_03BF5C:        dw CODE_03BF6E            ;Spawn Mushroom
                    dw CODE_03BC59            ;Spawn Coin
                    dw CODE_03BC59            ;Spawn Coin
                    dw CODE_03BF76            ;Spawn 1UP
                    dw CODE_03BF6E            ;Spawn Mushroom (again)
                    dw CODE_03BF7E            ;Spawn Vine
                    dw CODE_03BF72            ;Spawn Star
                    dw CODE_03BC59            ;Spawn Coin
                    dw CODE_03BF76            ;Spawn 1UP

CODE_03BF6E:        LDA.b #$00                ;\Spawn Mushroom
                    BRA   CODE_03BF78         ;/

CODE_03BF72:        LDA.b #$02                ;\Spawn Star
                    BRA   CODE_03BF78         ;/

CODE_03BF76:        LDA.b #$03                ;\Spawn 1-Up
CODE_03BF78:        STA.w $020C               ;/
                    JMP.w CODE_03BD80         ;

CODE_03BF7E:        LDX.b #$09                ;\Spawn vine?
                    LDY.w $03F0               ; |Sprite index: $09
                    JSR.w CODE_03B9FD         ;/ Y = ???
CODE_03BF86:        RTS                       ;

                    db $E8,$E7,$62,$63,$58,$59,$5A,$5B
                    db $5C,$5D,$5E,$5F,$60,$61

CODE_03BF95:        LDY.b #$0D                ;
CODE_03BF97:        CMP.w $BF87,y             ;
                    BEQ   CODE_03BFA0         ;
                    DEY                       ;
                    BPL   CODE_03BF97         ;
                    CLC                       ;
CODE_03BFA0:        RTS                       ;

CODE_03BFA1:        JSR.w CODE_03BFC6         ;
                    LDA.b #$01                ;
                    STA.w $03EE,x             ;
                    LDA.w $1603               ;
                    BNE   CODE_03BFB3         ;
                    LDA.b #$07                ;
                    STA.w $1603               ;
CODE_03BFB3:        JSR.w CODE_03BFED         ;
                    LDA.b #$FE                ;
                    STA.b $A0                 ;
                    LDA.b #$05                ;
                    STA.w $014A               ;
                    JSR.w CODE_03BD55         ;
                    LDX.w $03F0               ;
                    RTS                       ;

CODE_03BFC6:        LDX.w $03F0               ;
                    LDY.b $02                 ;
                    BEQ   CODE_03BFEC         ;
                    TYA                       ;
                    SEC                       ;
                    SBC.b #$10                ;
                    STA.b $02                 ;
                    TAY                       ;
                    LDA.b ($06),y             ;
                    CMP.b #$E9                ;
                    BNE   CODE_03BFEC         ;
                    LDA.b #$00                ;
                    STA.b ($06),y             ;
                    LDA.b #$01                ;
                    STA.w $1603               ;
                    JSR.w CODE_039373         ;
                    LDX.w $03F0               ;
                    JSR.w CODE_03BC73         ;
CODE_03BFEC:        RTS                       ;

CODE_03BFED:        LDA.w $0226,x             ;
                    STA.w $03F3,x             ;
                    LDA.b #$F0                ;
                    STA.b $6A,x               ;
                    STA.b $6C,x               ;
                    LDA.b #$FA                ;
                    STA.b $AD,x               ;
                    LDA.b #$FC                ;
                    STA.b $AF,x               ;
                    STZ.w $0449,x             ;
                    STZ.w $044B,x             ;
                    LDA.b $85,x               ;
                    STA.b $87,x               ;
                    LDA.w $0226,x             ;
                    STA.w $0228,x             ;
                    LDA.w $0244,x             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0246,x             ;
                    LDA.b #$FA                ;
                    STA.b $AD,x               ;
                    RTS                       ;

CODE_03C01F:        LDA.b $35,x               ;
                    BEQ   CODE_03C083         ;
                    AND.b #$0F                ;
                    PHA                       ;
                    TAY                       ;
                    TXA                       ;
                    CLC                       ;
                    ADC.b #$0D                ;
                    TAX                       ;
                    DEY                       ;
                    BEQ   CODE_03C062         ;
                    JSR.w CODE_03C153         ;
                    JSR.w CODE_03C0BA         ;
                    INX                       ;
                    INX                       ;
                    JSR.w CODE_03C153         ;
                    JSR.w CODE_03C0BA         ;
                    LDX.b $9E                 ;
                    JSR.w CODE_03FD40         ;
                    JSR.w CODE_03FDD1         ;
                    JSR.w CODE_03F3AC         ;
                    PLA                       ;
                    LDY.b $C8,x               ;
                    BEQ   CODE_03C083         ;
                    PHA                       ;
                    LDA.b #$F0                ;
                    CMP.w $0246,x             ;
                    BCS   CODE_03C058         ;
                    STA.w $0246,x             ;
CODE_03C058:        LDA.w $0244,x             ;
                    CMP.b #$F0                ;
                    PLA                       ;
                    BCC   CODE_03C083         ;
                    BCS   CODE_03C081         ;
CODE_03C062:        JSR.w CODE_03C153         ;
                    LDX.b $9E                 ;
                    JSR.w CODE_03FD40         ;
                    JSR.w CODE_03FDD1         ;
                    JSR.w CODE_03F358         ;
                    PLA                       ;
                    STA.b $35,x               ;
                    LDA.w $0244,x             ;
                    AND.b #$0F                ;
                    CMP.b #$05                ;
                    BCS   CODE_03C083         ;
                    LDA.b #$01                ;
                    STA.w $03EE,x             ;
CODE_03C081:        STZ.b $35,x               ;
CODE_03C083:        RTS                       ;

CODE_03C084:        LDX.b #$01                ;
CODE_03C086:        STX.b $9E                 ;
                    LDA.w $03EE,x             ;
                    BEQ   CODE_03C0A9         ;
                    LDA.w $03E8,x             ;
                    STA.b $06                 ;
                    LDA.b #$05                ;
                    STA.b $07                 ;
                    LDA.w $03E6,x             ;
                    STA.b $02                 ;
                    TAY                       ;
                    LDA.w $03EA,x             ;
                    STA.b ($06),y             ;
                    JSR.w CODE_039384         ;
                    LDA.b #$00                ;
                    STA.w $03EE,x             ;
CODE_03C0A9:        DEX                       ;
                    BPL   CODE_03C086         ;
                    RTS                       ;

CODE_03C0AD:        INX                       ;
                    JSR.w CODE_03C0BA         ;
                    LDX.b $9E                 ;
                    RTS                       ;

CODE_03C0B4:        LDA.w $070E               ;
                    BNE   CODE_03C0FC         ;
                    TAX                       ;
CODE_03C0BA:        LDA.b $5D,x               ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    STA.b $01                 ;
                    LDA.b $5D,x               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    CMP.b #$08                ;
                    BCC   CODE_03C0CE         ;
                    ORA.b #$F0                ;
CODE_03C0CE:        STA.b $00                 ;
                    STA.w $0EB6               ;
                    LDY.b #$00                ;
                    CMP.b #$00                ;
                    BPL   CODE_03C0DA         ;
                    DEY                       ;
CODE_03C0DA:        STY.b $02                 ;
                    LDA.w $0401,x             ;
                    CLC                       ;
                    ADC.b $01                 ;
                    STA.w $0401,x             ;
                    LDA.b #$00                ;
                    ROL   A                   ;
                    PHA                       ;
                    ROR   A                   ;
                    LDA.w $0219,x             ;
                    ADC.b $00                 ;
                    STA.w $0219,x             ;
                    LDA.b $78,x               ;
                    ADC.b $02                 ;
                    STA.b $78,x               ;
                    PLA                       ;
                    CLC                       ;
                    ADC.b $00                 ;
CODE_03C0FC:        RTS                       ;

CODE_03C0FD:        LDX.b #$00                ;
                    LDA.w $0747               ;
                    BNE   CODE_03C109         ;
                    LDA.w $070E               ;
                    BNE   CODE_03C0FC         ;
CODE_03C109:        LDA.w $0709               ;
                    STA.b $00                 ;
                    LDA.b #$04                ;
                    JMP.w CODE_03C15C         ;

CODE_03C113:        LDY.b #$3D                ;\
                    LDA.b $29,x               ; |
                    CMP.b #$05                ; |If sprite state is #$05, Y = $20, else, Y = $3D
                    BNE   CODE_03C142         ; |
CODE_03C11B:        LDY.b #$20                ; |
                    BRA   CODE_03C142         ;/

CODE_03C11F:        LDY.b #$00                ;
                    BRA   CODE_03C125         ;

CODE_03C123:        LDY.b #$01                ;
CODE_03C125:        INX                       ;
                    LDA.b #$03                ;
                    STA.b $00                 ;
                    LDA.b #$06                ;
                    STA.b $01                 ;
                    LDA.b #$02                ;
                    STA.b $02                 ;
                    TYA                       ;
                    JMP.w CODE_03C181         ;

CODE_03C136:        LDY.b #$7F                ;
                    BNE   CODE_03C13C         ;
CODE_03C13A:        LDY.b #$0F                ;
CODE_03C13C:        LDA.b #$02                ;
                    BNE   CODE_03C144         ;
CODE_03C140:        LDY.b #$1C                ;
CODE_03C142:        LDA.b #$03                ;
CODE_03C144:        STY.b $00                 ;
                    INX                       ;
                    JSR.w CODE_03C15C         ;
                    LDX.b $9E                 ;
                    RTS                       ;

                    db $06,$08

                    LDY.b #$00                ;
                    BRA   CODE_03C153         ;

CODE_03C153:        LDY.b #$01                ;
                    LDA.b #$50                ;
                    STA.b $00                 ;
                    LDA.w $C14D,y             ;
CODE_03C15C:        STA.b $02                 ;
                    LDA.b #$00                ;
                    JMP.w CODE_03C18B         ;

CODE_03C163:        LDA.b #$00                ;
                    BRA   CODE_03C169         ;

CODE_03C167:        LDA.b #$01                ;
CODE_03C169:        PHA                       ;
                    LDY.b $1C,x               ;
                    INX                       ;
                    LDA.b #$05                ;
                    CPY.b #$29                ;
                    BNE   CODE_03C175         ;
                    LDA.b #$09                ;
CODE_03C175:        STA.b $00                 ;
                    LDA.b #$0A                ;
                    STA.b $01                 ;
                    LDA.b #$03                ;
                    STA.b $02                 ;
                    PLA                       ;
                    TAY                       ;
CODE_03C181:        JSR.w CODE_03C18B         ;
                    LDX.b $9E                 ;
                    RTS                       ;

CODE_03C187:        JSR.w CODE_03C18B         ;
                    RTL                       ;

CODE_03C18B:        PHA                       ;
                    LDA.w $041C,x             ;
                    CLC                       ;
                    ADC.w $043C,x             ;
                    STA.w $041C,x             ;
                    LDY.b #$00                ;
                    LDA.b $A0,x               ;
                    BPL   CODE_03C19D         ;
                    DEY                       ;
CODE_03C19D:        STY.b $07                 ;
                    ADC.w $0237,x             ;
                    STA.w $0237,x             ;
                    LDA.b $BB,x               ;
                    ADC.b $07                 ;
                    STA.b $BB,x               ;
                    LDA.w $043C,x             ;
                    CLC                       ;
                    ADC.b $00                 ;
                    STA.w $043C,x             ;
                    LDA.b $A0,x               ;
                    ADC.b #$00                ;
                    STA.b $A0,x               ;
                    CMP.b $02                 ;
                    BMI   CODE_03C1CC         ;
                    LDA.w $043C,x             ;
                    CMP.b #$80                ;
                    BCC   CODE_03C1CC         ;
                    LDA.b $02                 ;
                    STA.b $A0,x               ;
                    STZ.w $043C,x             ;
CODE_03C1CC:        PLA                       ;
                    BEQ   CODE_03C1F9         ;
                    LDA.b $02                 ;
                    EOR.b #$FF                ;
                    INC   A                   ;
                    STA.b $07                 ;
                    LDA.w $043C,x             ;
                    SEC                       ;
                    SBC.b $01                 ;
                    STA.w $043C,x             ;
                    LDA.b $A0,x               ;
                    SBC.b #$00                ;
                    STA.b $A0,x               ;
                    CMP.b $07                 ;
                    BPL   CODE_03C1F9         ;
                    LDA.w $043C,x             ;
                    CMP.b #$80                ;
                    BCS   CODE_03C1F9         ;
                    LDA.b $07                 ;
                    STA.b $A0,x               ;
                    LDA.b #$FF                ;
                    STA.w $043C,x             ;
CODE_03C1F9:        RTS                       ;

CODE_03C1FA:        LDA.w $0E9D,x             ;
                    BEQ   CODE_03C261         ;
                    INC.w $0EA2,x             ;
                    LDA.w $0EA2,x             ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    CMP.b #$03                ;
                    BEQ   CODE_03C262         ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.b #$40                ;
                    STA.b $E4                 ;
                    LDA.w $0EAC,x             ;
                    STA.b $E5                 ;
                    LDA.w $0EA7,x             ;
                    STA.b $E6                 ;
                    REP   #$20                ;
                    LDA.b $E5                 ;
                    SEC                       ;
                    SBC.b $42                 ;
                    PHA                       ;
                    LDA.w $0EB5               ;
                    BMI   CODE_03C230         ;
                    PLA                       ;
                    CLC                       ;
                    ADC.w #$000C              ;
                    BRA   CODE_03C235         ;

CODE_03C230:        PLA                       ;
                    SEC                       ;
                    SBC.w #$000C              ;
CODE_03C235:        STA.b $E5                 ;
                    SEP   #$20                ;
                    PHY                       ;
                    LDY.w $0B46,x             ;
                    LDA.b $E5                 ;
                    STA.w $0900,y             ;
                    LDA.w $0EB1,x             ;
                    STA.w $0901,y             ;
                    LDA.b $E4                 ;
                    STA.w $0902,y             ;
                    LDA.b #$2D                ;
                    STA.w $0903,y             ;
                    LDA.b #$02                ;
                    STA.w $0D00,y             ;
                    LDA.b $E6                 ;
                    BEQ   CODE_03C260         ;
                    LDA.b #$03                ;
                    STA.w $0D00,y             ;
CODE_03C260:        PLY                       ;
CODE_03C261:        RTS                       ;

CODE_03C262:        STZ.w $0E9D,x             ;
                    TXA                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    STA.b $E8                 ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.b $E8                 ;
                    PHX                       ;
                    TAX                       ;
                    LDA.b #$F0                ;
                    STA.w $0901,x             ;
                    STZ.w $0D00,x             ;
                    PLX                       ;
                    RTS                       ;

CODE_03C27B:        STA.w $0E9D,x             ;
                    STZ.w $0EA2,x             ;
                    LDA.w $021A,x             ;
                    STA.w $0EAC,x             ;
                    LDA.b $79,x               ;
                    STA.w $0EA7,x             ;
                    LDA.w $0238,x             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0EB1,x             ;
                    RTS                       ;

CODE_03C296:        LDA.w $0E7F               ;
                    LSR   A                   ;
                    BCC   CODE_03C2EB         ;
                    LDA.w $1201               ;
                    BMI   CODE_03C2E1         ;
                    LDA.w $1680               ;
                    BEQ   CODE_03C2AB         ;
                    LDA.w $1201               ;
                    BEQ   CODE_03C2B0         ;
CODE_03C2AB:        DEC.w $1201               ;
                    BNE   CODE_03C317         ;
CODE_03C2B0:        LDA.b #$80                ;
                    STA.w $2100               ;
                    STA.w $1201               ;
                    STZ.w $420C               ;
                    STZ.w $1203               ;
                    STZ.w $0B75               ;
                    STZ.w $1680               ;
                    LDA.l $701FF2             ;
                    BEQ   CODE_03C2D7         ;
                    LDA.w $0EC8               ;
                    BNE   CODE_03C2D3         ;
                    JML.l CODE_008139         ;

CODE_03C2D3:        JML.l CODE_0080DE         ;

CODE_03C2D7:        JSL.l CODE_048000         ;
                    JSR.w CODE_03C33B         ;
                    JSR.w CODE_03C366         ;
CODE_03C2E1:        STZ.w $0E7F               ;
                    LDA.b #$01                ;
                    STA.w $0774               ;
                    BRA   CODE_03C317         ;

CODE_03C2EB:        LDA.w $0E66               ;
                    BNE   CODE_03C2FB         ;
                    LDA.b $0E                 ;
                    BNE   CODE_03C2FB         ;
                    LDA.b #$01                ;
                    STA.b $0E                 ;
                    JSR.w CODE_03AD70         ;
CODE_03C2FB:        STZ.w $0E67               ;
                    LDA.w $1201               ;
                    CMP.b #$0F                ;
                    BEQ   CODE_03C30F         ;
                    INC.w $1201               ;
                    LDA.w $1201               ;
                    CMP.b #$0F                ;
                    BNE   CODE_03C317         ;
CODE_03C30F:        STZ.w $0E7F               ;
                    STZ.w $0774               ;
                    STZ.b $0E                 ;
CODE_03C317:        LDA.w $0E4F               ;
                    BEQ   CODE_03C33A         ;
                    JSR.w CODE_03C33B         ;
                    LDA.w $1201               ;\ Load brightness
                    EOR.b #$0F                ; |Inverse the last nibble
                    ASL   A                   ; |\<<4
                    ASL   A                   ; | |
                    ASL   A                   ; | |
                    ASL   A                   ; |/
                    ORA.b #$0F                ; | Affect all the layers
                    STA.w $0E7E               ;/Store into mosaic register
                    JSR.w CODE_03C354         ;
                    LDA.w $1201               ;
                    CMP.b #$0F                ;
                    BNE   CODE_03C33A         ;
                    STZ.w $0E4F               ;
CODE_03C33A:        RTS                       ;

CODE_03C33B:        PHX                       ;
                    LDX.b #$00                ;
                    LDA.b #$F0                ;
CODE_03C340:        STA.w $0801,x             ;
                    STA.w $0901,x             ;
                    STZ.w $0C00,x             ;
                    STZ.w $0D00,x             ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    BNE   CODE_03C340         ;
                    PLX                       ;
                    RTS                       ;

CODE_03C354:        PHY                       ;
                    LDY.b #$D0                ;
                    LDA.b #$F0                ;
CODE_03C359:        STA.w $0801,y             ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    CPY.b #$F0                ;
                    BNE   CODE_03C359         ;
                    PLY                       ;
                    RTS                       ;

CODE_03C366:        JSL.l CODE_04ED2E         ;
                    STZ.w $0BA5               ;
                    STZ.w $0F06               ;
                    STZ.w $0ED1               ;
                    STZ.w $0E40               ;
                    STZ.w $0E41               ;
                    STZ.w $0E42               ;
                    STZ.w $0EDC               ;
                    LDA.w $0E66               ;
                    BNE   CODE_03C392         ;
                    LDA.w $0237               ;
                    STA.w $03B8               ;
                    LDA.w $0219               ;
                    STA.w $03AD               ;
                    BRA   CODE_03C395         ;

CODE_03C392:        STZ.w $0E66               ;
CODE_03C395:        STZ.b $0E                 ;
                    RTS                       ;

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ;Looks like some empty space.
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

CODE_03C3B0:        LDA.b $10,x               ;
                    PHA                       ;
                    ASL   A                   ;
                    BCS   CODE_03C3C8         ;
                    PLA                       ;
                    BEQ   CODE_03C3BC         ;
                    JMP.w CODE_03CCA8         ;

CODE_03C3BC:        LDA.w $071F               ;
                    AND.b #$07                ;
                    CMP.b #$07                ;
                    BEQ   CODE_03C3D3         ;
                    JMP.w CODE_03C43C         ;

CODE_03C3C8:        PLA                       ;
                    AND.b #$0F                ;
                    TAY                       ;
                    LDA.w $10,y             ;
                    BNE   CODE_03C3D3         ;
                    STA.b $10,x               ;
CODE_03C3D3:        RTS                       ;

                    db $03,$03,$06,$06,$06,$06,$06,$06
                    db $07,$07,$07

                    db $05,$09,$04,$05,$06,$08,$09,$0A
                    db $07,$0B,$10

                    db $40,$B0,$B0,$80,$40,$40,$80,$40
                    db $F0,$F0,$F0

CODE_03C3F5:        LDA.b $78                 ;
                    SEC                       ;
                    SBC.b #$04                ;
                    STA.b $78                 ;
                    LDA.w $0725               ;
                    SEC                       ;
                    SBC.b #$04                ;
                    STA.w $0725               ;
                    LDA.w $071A               ;
                    SEC                       ;
                    SBC.b #$04                ;
                    STA.w $071A               ;
                    LDA.w $071B               ;
                    SEC                       ;
                    SBC.b #$04                ;
                    STA.w $071B               ;
                    LDA.w $072A               ;
                    SEC                       ;
                    SBC.b #$04                ;
                    STA.w $072A               ;
                    LDA.b #$00                ;
                    STA.w $073B               ;
                    STA.w $072B               ;
                    STA.w $0739               ;
                    STA.w $073A               ;
                    PHX                       ;
                    TYX                       ;
                    LDA.l $04C000,x           ;
                    STA.w $072C               ;
                    PLX                       ;
                    STZ.w $0EDB               ;
                    RTS                       ;

CODE_03C43C:        LDA.w $0745               ;
                    BNE   CODE_03C444         ;
                    JMP.w CODE_03C4C7         ;

CODE_03C444:        LDA.w $0726               ;
                    BNE   CODE_03C4C7         ;
                    LDY.b #$0B                ;
CODE_03C44B:        DEY                       ;
                    BMI   CODE_03C4C7         ;
                    LDA.w $075F               ;
                    CMP.w $C3D4,y             ;
                    BNE   CODE_03C44B         ;
                    LDA.w $0725               ;
                    CMP.w $C3DF,y             ;
                    BNE   CODE_03C44B         ;
                    LDA.w $0237               ;
                    CMP.w $C3EA,y             ;
                    BNE   CODE_03C4A2         ;
                    LDA.b $28                 ;
                    CMP.b #$00                ;
                    BNE   CODE_03C4A2         ;
                    LDA.w $0EDB               ;
                    BNE   CODE_03C48F         ;
                    LDA.b #$29                ;
                    STA.w $1603               ;
                    LDA.w $075F               ;
                    CMP.b #$06                ;
                    BNE   CODE_03C4BC         ;
                    INC.w $06D9               ;
                    BRA   CODE_03C48F         ;

CODE_03C482:        LDA.w $0EDB               ;
                    BNE   CODE_03C48F         ;
                    LDA.b #$2A                ;
                    STA.w $1603               ;
                    STA.w $0EDB               ;
CODE_03C48F:        INC.w $06DA               ;
                    LDA.w $06DA               ;
                    CMP.b #$03                ;
                    BNE   CODE_03C4C4         ;
                    LDA.w $06D9               ;
                    CMP.b #$03                ;
                    BNE   CODE_03C4B6         ;
                    BRA   CODE_03C4BC         ;

CODE_03C4A2:        LDA.w $075F               ;
                    CMP.b #$06                ;
                    BEQ   CODE_03C482         ;
                    LDA.w $0EDB               ;
                    BNE   CODE_03C4B6         ;
                    LDA.b #$2A                ;
                    STA.w $1603               ;
                    STA.w $0EDB               ;
CODE_03C4B6:        JSR.w CODE_03C3F5         ;
                    JSR.w CODE_03D56B         ;
CODE_03C4BC:        LDA.b #$00                ;
                    STA.w $06DA               ;
                    STA.w $06D9               ;
CODE_03C4C4:        STZ.w $0745               ;
CODE_03C4C7:        LDA.w $06CD               ;
                    BEQ   CODE_03C4DA         ;
                    STA.b $1C,x               ;
                    LDA.b #$01                ;
                    STA.b $10,x               ;
                    STZ.b $29,x               ;
                    STZ.w $06CD               ;
                    JMP.w CODE_03C5CA         ;

CODE_03C4DA:        LDY.w $0739               ;
                    LDA.b [$FD],y             ;
                    CMP.b #$FF                ;
                    BNE   CODE_03C4E6         ;
                    JMP.w CODE_03C5B6         ;

CODE_03C4E6:        AND.b #$0F                ;
                    CMP.b #$0E                ;
                    BEQ   CODE_03C4FA         ;
                    CPX.b #$08                ;
                    BCC   CODE_03C4FA         ;
                    INY                       ;
                    LDA.b [$FD],y             ;
                    AND.b #$3F                ;
                    CMP.b #$2E                ;
                    BEQ   CODE_03C4FA         ;
                    RTS                       ;

CODE_03C4FA:        LDA.w $071D               ;
                    CLC                       ;
                    ADC.b #$30                ;
                    AND.b #$F0                ;
                    STA.b $07                 ;
                    LDA.w $071B               ;
                    ADC.b #$00                ;
                    STA.b $06                 ;
                    LDY.w $0739               ;
                    INY                       ;
                    LDA.b [$FD],y             ;
                    ASL   A                   ;
                    BCC   CODE_03C51F         ;
                    LDA.w $073B               ;
                    BNE   CODE_03C51F         ;
                    INC.w $073B               ;
                    INC.w $073A               ;
CODE_03C51F:        DEY                       ;
                    LDA.b [$FD],y             ;
                    AND.b #$0F                ;
                    CMP.b #$0F                ;
                    BNE   CODE_03C541         ;
                    LDA.w $073B               ;
                    BNE   CODE_03C541         ;
                    INY                       ;
                    LDA.b [$FD],y             ;
                    AND.b #$3F                ;
                    STA.w $073A               ;
                    INC.w $0739               ;
                    INC.w $0739               ;
                    INC.w $073B               ;
                    JMP.w CODE_03C43C         ;

CODE_03C541:        LDA.w $073A               ;
                    STA.b $79,x               ;
                    LDA.b [$FD],y             ;
                    AND.b #$F0                ;
                    STA.w $021A,x             ;
                    CMP.w $071D               ;
                    LDA.b $79,x               ;
                    SBC.w $071B               ;
                    BCS   CODE_03C562         ;
                    LDA.b [$FD],y             ;
                    AND.b #$0F                ;
                    CMP.b #$0E                ;
                    BEQ   CODE_03C5D3         ;
                    JMP.w CODE_03C5F1         ;

CODE_03C562:        LDA.b $07                 ;
                    CMP.w $021A,x             ;
                    LDA.b $06                 ;
                    SBC.b $79,x               ;
                    BCC   CODE_03C5B6         ;
                    LDA.b #$01                ;
                    STA.b $BC,x               ;
                    LDA.b [$FD],y             ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    STA.w $0238,x             ;
                    CMP.b #$E0                ;
                    BEQ   CODE_03C5D3         ;
                    INY                       ;
                    LDA.b [$FD],y             ;
                    AND.b #$40                ;
                    BEQ   CODE_03C58A         ;
                    LDA.w $06CC               ;
                    BEQ   CODE_03C5FF         ;
CODE_03C58A:        LDA.b [$FD],y             ;
                    AND.b #$3F                ;
                    CMP.b #$37                ;
                    BCC   CODE_03C596         ;
                    CMP.b #$3F                ;
                    BCC   CODE_03C5D0         ;
CODE_03C596:        CMP.b #$06                ;
                    BNE   CODE_03C5A1         ;
                    LDY.w $076A               ;
                    BEQ   CODE_03C5A1         ;
                    LDA.b #$02                ;
CODE_03C5A1:        STA.b $1C,x               ;
                    CMP.b #$2D                ;
                    BNE   CODE_03C5AA         ;
                    STZ.w $0F4C               ;
CODE_03C5AA:        LDA.b #$01                ;
                    STA.b $10,x               ;
                    JSR.w CODE_03C5CA         ;
                    LDA.b $10,x               ;
                    BNE   CODE_03C5FF         ;
                    RTS                       ;

CODE_03C5B6:        LDA.w $06CB               ;
                    BNE   CODE_03C5C4         ;
                    LDA.w $0398               ;
                    CMP.b #$01                ;
                    BNE   CODE_03C5CF         ;
                    LDA.b #$00                ;
CODE_03C5C4:        CPX.b #$09                ;
                    BEQ   CODE_03C5CA         ;
                    STA.b $1C,x               ;
CODE_03C5CA:        STZ.b $29,x               ;
                    JSR.w CODE_03C60B         ;
CODE_03C5CF:        RTS                       ;

CODE_03C5D0:        JMP.w CODE_03CB2B         ;

CODE_03C5D3:        INY                       ;
                    INY                       ;
                    LDA.b [$FD],y             ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    CMP.w $075F               ;
                    BNE   CODE_03C5EF         ;
                    DEY                       ;
                    LDA.b [$FD],y             ;
                    STA.w $0750               ;
                    INY                       ;
                    LDA.b [$FD],y             ;
                    AND.b #$1F                ;
                    STA.w $0751               ;
CODE_03C5EF:        BRA   CODE_03C5FC         ;

CODE_03C5F1:        LDY.w $0739               ;
                    LDA.b [$FD],y             ;
                    AND.b #$0F                ;
                    CMP.b #$0E                ;
                    BNE   CODE_03C5FF         ;
CODE_03C5FC:        INC.w $0739               ;
CODE_03C5FF:        INC.w $0739               ;
                    INC.w $0739               ;
                    STZ.w $073B               ;
                    LDX.b $9E                 ;
                    RTS                       ;

CODE_03C60B:        LDA.b $1C,x               ;Load Sprite number into A
                    CMP.b #$15                ;\If it is #15 or greater
                    BCS   CODE_03C620         ; |Branch
                    TAY                       ;/Transfer A to Y
                    LDA.w $0238,x             ;\ no need for CLC since the CMP above did that.
                    ADC.b #$08                ; |Add 8 pixels to the sprite Y position
                    STA.w $0238,x             ;/
                    LDA.b #$01                ;\
                    STA.w $03D9,x             ;/Set off-screen flag?
                    TYA                       ;\
CODE_03C620:        ASL   A                   ; |Sprite number*2, for index purposes
                    TAY                       ;/
                    LDA.w $C62F,y             ;\
                    STA.b $04                 ; |
                    LDA.w $C630,y             ; |Load sprite pointers and jump to them
                    STA.b $05                 ; |for the INIT routine
                    JMP.w ($0004)             ;/

;SMB1 SPRITE INIT POINTER TABLE

                    dw CODE_03C6D3            ;00 - Green Koopa
                    dw CODE_03C6D3            ;01 - Red Koopa (Falls from edges)
                    dw CODE_03C6D3            ;02 - Buzzy Beetle
                    dw CODE_03C6E3            ;03 - Red Koopa (Stays on edges)
                    dw CODE_03C69D            ;04 - Green Koopa (Doesn't move)
                    dw CODE_03C6ED            ;05 - Hammer Bros
                    dw CODE_03C69E            ;06 - Goomba
                    dw CODE_03C705            ;07 - Blooper
                    dw CODE_03C72E            ;08 - Bullet Bill
                    dw CODE_03C69D            ;09 - Yellow Paratroopa (Doesn't move)
                    dw CODE_03C738            ;0A - Green Cheep-Cheep
                    dw CODE_03C738            ;0B - Red Cheep-Cheep
                    dw CODE_03C6A4            ;0C - Podoboo
                    dw CODE_03CB99            ;0D - Piranha Plant
                    dw CODE_03CBF2            ;0E - Green Paratroopa
                    dw CODE_03C70B            ;0F - Red Vertical Flying Paratroopa
                    dw CODE_03C700            ;10 - Green Horizontal Flying Paratroopa
                    dw CODE_03C749            ;11 - Lakitu
                    dw CODE_03CBB5            ;12 - Spiny
                    dw CODE_03C69D            ;13 - Nothing?
                    dw CODE_03CBB5            ;14 - Red Flying Cheep-Cheep Generator
                    dw CODE_03CBB5            ;15 - Bowser's Fire Generator
                    dw CODE_03CBB5            ;16 - Firework Generator
                    dw CODE_03CBB5            ;17 - Bullet Bill/Cheep-Cheep Generator
                    dw CODE_03CBD9            ;18 - Disable Lakitu Generator
                    dw CODE_03C69D            ;19 - Nothing
                    dw CODE_03C69D            ;1A - Nothing
                    dw CODE_03C821            ;1B - Fire-bar (Clockwise)
                    dw CODE_03C821            ;1C - Fast Fire-bar (Clockwise)
                    dw CODE_03C821            ;1D - Fire-bar (Counter-Clockwise)
                    dw CODE_03C821            ;1E - Fast Fire-bar (Counter-Clockwise)
                    dw CODE_03C81E            ;1F - Long Fire-bar (Clockwise)
                    dw CODE_03C69D            ;20 - Nothing? Related to the fire-bars above?
                    dw CODE_03C69D            ;21 - Nothing? Related to the fire-bars above?
                    dw CODE_03C69D            ;22 - Nothing? Related to the fire-bars above?
                    dw CODE_03C69D            ;23 - Nothing?
                    dw CODE_03CC00            ;24 - Balance Lift
                    dw CODE_03CC35            ;25 - Lift (Up then down)
                    dw CODE_03CC63            ;26 - Lift (Up)
                    dw CODE_03CC69            ;27 - Lift (Down)
                    dw CODE_03CC2E            ;28 - Lift (Left then right and so on)
                    dw CODE_03CC26            ;29 - Lift (Fall)
                    dw CODE_03CC2E            ;2A - Lift (Right)
                    dw CODE_03CC6F            ;2B - Short Lift (Up)
                    dw CODE_03CC7B            ;2C - Short Lift (Down)
                    dw CODE_03C918            ;2D - Bowser
                    dw CODE_03BD9B            ;2E - ???
                    dw CODE_03B9FD            ;2F - Vine???
                    dw CODE_03C69D            ;30 - Nothing
                    dw CODE_03C69D            ;31 - ???
                    dw CODE_03C69D            ;32 - ???
                    dw CODE_03C69D            ;33 - ???
                    dw CODE_03C69D            ;34 - Warp Zone
                    dw CODE_03C6C0            ;35 - Toad (World 1-7), Princess (World 8)
                    dw CODE_03CCA7            ;36 - ??? what is this i don't even?

CODE_03C69D:        RTS                       ;

CODE_03C69E:        JSR.w CODE_03C6D3         ;
                    JMP.w CODE_03C707         ;

CODE_03C6A4:        LDA.b #$D0                ;\Podoboo init
                    STA.w $0238,x             ;/Set Y-pos to bottom of the screen
                    LDA.b #$01                ;
                    STA.b $BC,x               ;
                    STA.w $07A2,x             ;
                    STZ.b $29,x               ;
                    STA.w $0B00,x             ;
                    STZ.w $0B09,x             ;
                    LDA.b #$27                ;\Play podoboo sound
                    STA.w $1603               ;/
                    JMP.w CODE_03C707         ;

CODE_03C6C0:        LDA.w $075F               ;\INIT routine of Toad/Peach. Load current world
                    CMP.b #$07                ; |If you are NOT in world 8
                    BNE   CODE_03C6CD         ; |Set Y-pos of sprite to $B8 (floor)
                    LDA.b #$70                ;\|Otherwise, set Y-pos to $70 (inside cage)
CODE_03C6C9:        STA.w $0238,x             ;/
                    RTS                       ;Return

CODE_03C6CD:        LDA.b #$B8                ;\Set Y-pos of sprite to $B8
                    BRA   CODE_03C6C9         ;/

                    db $F8,$F4                ;Sprite initial x-speed. Format: Normal difficulty, hard difficulty

CODE_03C6D3:        LDY.b #$01                ;\
                    LDA.w $076A               ; |INIT routine for most walking sprites
                    BNE   CODE_03C6DB         ; |Set sprite initial X-speed depending on difficulty
                    DEY                       ; |
CODE_03C6DB:        LDA.w $C6D1,y             ; |
CODE_03C6DE:        STA.b $5E,x               ;/
                    JMP.w CODE_03C71D         ;

CODE_03C6E3:        JSR.w CODE_03C6D3         ;
                    LDA.b #$01                ;
                    STA.b $29,x               ;
                    RTS                       ;

                    db $80,$50

CODE_03C6ED:        STZ.w $03A2,x             ;
                    STZ.b $5E,x               ;
                    LDY.w $06CC               ;
                    LDA.w $C6EB,y             ;
                    STA.w $07A2,x             ;
                    LDA.b #$0B                ;
                    JMP.w CODE_03C71F         ;

CODE_03C700:        LDA.b #$00                ;
                    JMP.w CODE_03C6DE         ;

CODE_03C705:        STZ.b $5E,x               ;
CODE_03C707:        LDA.b #$09                ;
                    BNE   CODE_03C71F         ;
CODE_03C70B:        LDY.b #$30                ;
                    LDA.w $0238,x             ;
                    STA.w $0402,x             ;
                    BPL   CODE_03C717         ;
                    LDY.b #$E0                ;
CODE_03C717:        TYA                       ;
                    ADC.w $0238,x             ;
                    STA.b $5E,x               ;
CODE_03C71D:        LDA.b #$03                ;
CODE_03C71F:        STA.w $0490,x             ;
                    LDA.b #$02                ;
                    STA.b $47,x               ;
CODE_03C726:        LDA.b #$00                ;
                    STA.b $A1,x               ;
                    STA.w $043D,x             ;
                    RTS                       ;

CODE_03C72E:        LDA.b #$02                ;\INIT routine of bullet bill
                    STA.b $47,x               ;/Set direction of sprite to left
                    LDA.b #$09                ;
                    STA.w $0490,x             ;
                    RTS                       ;

CODE_03C738:        JSR.w CODE_03C707         ;
                    LDA.w $07B7,x             ;
                    AND.b #$10                ;
                    STA.b $5E,x               ;
                    LDA.w $0238,x             ;
                    STA.w $043D,x             ;
                    RTS                       ;

CODE_03C749:        LDA.w $06CB               ;
                    BNE   CODE_03C759         ;
CODE_03C74E:        LDA.b #$00                ;
                    STA.w $06D1               ;
                    JSR.w CODE_03C700         ;
                    JMP.w CODE_03CBFA         ;

CODE_03C759:        JMP.w CODE_03CDE2         ;

                    db $26,$2C,$32,$38,$20,$22,$24,$26
                    db $13,$14,$15,$16

CODE_03C768:        LDA.w $079B               ;
                    BNE   CODE_03C7A7         ;
                    CPX.b #$09                ;
                    BCS   CODE_03C7A7         ;
                    LDA.b #$80                ;
                    STA.w $079B               ;
                    LDY.b #$08                ;
CODE_03C778:        LDA.w $1C,y             ;
                    CMP.b #$11                ;
                    BEQ   CODE_03C7A8         ;
                    DEY                       ;
                    BPL   CODE_03C778         ;
                    INC.w $06D1               ;
                    LDA.w $06D1               ;
                    CMP.b #$07                ;
                    BCC   CODE_03C7A7         ;
                    LDX.b #$08                ;
CODE_03C78E:        LDA.b $10,x               ;
                    BEQ   CODE_03C797         ;
                    DEX                       ;
                    BPL   CODE_03C78E         ;
                    BMI   CODE_03C7A5         ;
CODE_03C797:        STZ.b $29,x               ;
                    LDA.b #$11                ;
                    STA.b $1C,x               ;
                    JSR.w CODE_03C74E         ;
                    LDA.b #$20                ;
                    JSR.w CODE_03C9E8         ;
CODE_03C7A5:        LDX.b $9E                 ;
CODE_03C7A7:        RTS                       ;

CODE_03C7A8:        LDA.w $0237               ;
                    CMP.b #$2C                ;
                    BCC   CODE_03C7A7         ;
                    LDA.w $29,y             ;
                    BNE   CODE_03C7A7         ;
                    LDA.w $79,y             ;
                    STA.b $79,x               ;
                    LDA.w $021A,y             ;
                    STA.w $021A,x             ;
                    LDA.b #$01                ;
                    STA.b $BC,x               ;
                    LDA.w $0238,y             ;
                    SEC                       ;
                    SBC.b #$08                ;
                    STA.w $0238,x             ;
                    LDA.w $07B7,x             ;
                    AND.b #$03                ;
                    TAY                       ;
                    LDX.b #$02                ;
CODE_03C7D4:        LDA.w $C75C,y             ;
                    STA.b $01,x               ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    DEX                       ;
                    BPL   CODE_03C7D4         ;
                    LDX.b $9E                 ;
                    JSR.w CODE_03D420         ;
                    LDY.b $5D                 ;
                    CPY.b #$08                ;
                    BCS   CODE_03C7F9         ;
                    TAY                       ;
                    LDA.w $07B8,x             ;
                    AND.b #$03                ;
                    BEQ   CODE_03C7F8         ;
                    TYA                       ;
                    EOR.b #$FF                ;
                    TAY                       ;
                    INY                       ;
CODE_03C7F8:        TYA                       ;
CODE_03C7F9:        JSR.w CODE_03C707         ;
                    LDY.b #$02                ;
                    STA.b $5E,x               ;
                    CMP.b #$00                ;
                    BMI   CODE_03C805         ;
                    DEY                       ;
CODE_03C805:        STY.b $47,x               ;
                    LDA.b #$FD                ;
                    STA.b $A1,x               ;
                    LDA.b #$01                ;
                    STA.b $10,x               ;
                    LDA.b #$05                ;
                    STA.b $29,x               ;
CODE_03C813:        RTS                       ;

DATA_03C814:        db $28,$38,$28,$38,$28    ;Castle fire-bar rotation speed data. Format:
                                              ;Fire-bar (clock), Fast Fire-bar (clock)
                                              ;Fire-bar (C-Clock), Fast Fire-bar (C-Clock)
                                              ;Long Fire-bar (Clock)

DATA_03C819:        db $00,$00,$10,$10,$00    ;When bit 4 is set, the fire-bar will rotate C-Clockwise
                                              ;Same format as above

CODE_03C81E:        JSR.w CODE_03C946         ;
CODE_03C821:        STZ.b $5E,x               ;No sprite horizontal speed.
                    LDA.b $1C,x               ;\Load sprite number
                    SEC                       ; |Subtract $1B from it so we get index to 5 fire types
                    SBC.b #$1B                ; |Prepare for indexing
                    TAY                       ;/
                    LDA   DATA_03C814,y       ;\Get fire-bar rotation speed
                    STA.w $0388,x             ;/Store in spinning speed of fire-bars
                    LDA   DATA_03C819,y       ;\Get fire-bar rotation direction...
                    STA.w $0203,x             ;/
                    LDA.w $0238,x             ;\
                    CLC                       ; |Sprite Y-pos is 4px higher
                    ADC.b #$04                ; |So it will become centered in 1 16x16 block
                    STA.w $0238,x             ;/
                    LDA.w $021A,x             ;\
                    CLC                       ; |Sprite X-pos is 4px more to the right
                    ADC.b #$04                ; |So it will become centered in 1 16x16 block
                    STA.w $021A,x             ;/
                    LDA.b $79,x               ;\
                    ADC.b #$00                ; |Handle page boundary stuff or whatever.
                    STA.b $79,x               ;/
                    JMP.w CODE_03CBFA         ;

DATA_03C850:        db $80,$30,$40,$80,$30,$50,$50,$70
                    db $20,$40,$80,$A0,$70,$40,$90,$68
                    db $0E,$05,$06,$0E,$1C,$20,$10,$0C
                    db $1E,$22,$18,$14

DATA_03C86C:        db $10,$60,$20,$48

CODE_03C870:        LDA.w $079B               ;
                    BNE   CODE_03C813         ;
                    JSR.w CODE_03C707         ;
                    LDA.w $07B8,x             ;
                    AND.b #$03                ;
                    TAY                       ;
                    LDA.w DATA_03C86C,y       ;
                    STA.w $079B               ;
                    LDY.b #$03                ;
                    LDA.w $06CC               ;
                    BEQ   CODE_03C88C         ;
                    INY                       ;
CODE_03C88C:        STY.b $00                 ;
                    CPX.b $00                 ;
                    BCC   CODE_03C895         ;
                    JMP.w CODE_03C813         ;

CODE_03C895:        LDA.w $07B7,x             ;
                    AND.b #$03                ;
                    STA.b $00                 ;
                    STA.b $01                 ;
                    LDA.b #$FB                ;
                    STA.b $A1,x               ;
                    LDA.b #$00                ;
                    LDY.b $5D                 ;
                    BEQ   CODE_03C8AF         ;
                    LDA.b #$04                ;
                    CPY.b #$19                ;
                    BCC   CODE_03C8AF         ;
                    ASL   A                   ;
CODE_03C8AF:        PHA                       ;
                    CLC                       ;
                    ADC.b $00                 ;
                    STA.b $00                 ;
                    LDA.w $07B8,x             ;
                    AND.b #$03                ;
                    BEQ   CODE_03C8C3         ;
                    LDA.w $07B9,x             ;
                    AND.b #$0F                ;
                    STA.b $00                 ;
CODE_03C8C3:        PLA                       ;
                    CLC                       ;
                    ADC.b $01                 ;
                    TAY                       ;
                    LDA.w DATA_03C850+$10,y   ;
                    STA.b $5E,x               ;
                    LDA.b #$01                ;
                    STA.b $47,x               ;
                    LDA.b $5D                 ;
                    BNE   CODE_03C8E7         ;
                    LDY.b $00                 ;
                    TYA                       ;
                    AND.b #$02                ;
                    BEQ   CODE_03C8E7         ;
                    LDA.b $5E,x               ;
                    EOR.b #$FF                ;
                    CLC                       ;
                    ADC.b #$01                ;
                    STA.b $5E,x               ;
                    INC.b $47,x               ;
CODE_03C8E7:        TYA                       ;
                    AND.b #$02                ;
                    BEQ   CODE_03C8FC         ;
                    LDA.w $0219               ;
                    CLC                       ;
                    ADC.w DATA_03C850,y       ;
                    STA.w $021A,x             ;
                    LDA.b $78                 ;
                    ADC.b #$00                ;
                    BRA   CODE_03C90A         ;

CODE_03C8FC:        LDA.w $0219               ;
                    SEC                       ;
                    SBC.w DATA_03C850,y       ;
                    STA.w $021A,x             ;
                    LDA.b $78                 ;
                    SBC.b #$00                ;
CODE_03C90A:        STA.b $79,x               ;
                    LDA.b #$01                ;
                    STA.b $10,x               ;
                    STA.b $BC,x               ;
                    LDA.b #$F8                ;
                    STA.w $0238,x             ;
                    RTS                       ;

CODE_03C918:        JSR.w CODE_03C946         ;
                    STX.w $0368               ;
                    STZ.w $0363               ;
                    STZ.w $0369               ;
                    LDA.w $021A,x             ;
                    STA.w $0366               ;
                    LDA.b #$DF                ;
                    STA.w $079C               ;
                    STA.b $47,x               ;
                    LDA.b #$20                ;
                    STA.w $0364               ;
                    STA.w $0792,x             ;
                    STA.w $0257,x             ;
                    LDA.b #$05                ;
                    STA.w $0283               ;
                    LSR   A                   ;
                    STA.w $0365               ;
                    RTS                       ;

CODE_03C946:        LDY.b #$FF                ;\
CODE_03C948:        INY                       ; |Find a free sprite slot
                    LDA.w $10,y             ; |
                    BNE   CODE_03C948         ;/
                    STY.w $06CF               ;Store the index of the free sprite slot?
                    TXA                       ;Sprite index -> to accumulator
                    ORA.b #$80                ; OR 0x80
                    STA.w $10,y             ;Store into sprite on-screen flag
                    LDA.b $79,x               ;\Sprite x-pos high byte
                    STA.w $79,y             ;/
                    LDA.w $021A,x             ;\
                    STA.w $021A,y             ;/Sprite x-pos low byte
                    LDA.b #$01                ;\
                    STA.b $10,x               ;/Sprite off-screen flag?
                    STA.w $BC,y             ;"position of sprites"
                    LDA.w $0238,x             ;\
                    STA.w $0238,y             ;/Sprite Y-pos
CODE_03C96F:        RTS                       ;

                    db $90,$80,$70,$90        ;Bowser's fireball possible Y positions

                    db $FF,$01                ;Fireball Y Speed (both directions, but fireball goes 1-way only?)

CODE_03C976:        LDA.w $079B               ;\Bowser Fire generator. Timer to spawn next sprite (generators)
                    BNE   CODE_03C96F         ;/If $079B != 00, return
                    STA.w $043D,x             ;Sprite vertical speed = 00
                    LDA.b #$06                ;
                    STA.w $014B               ;
                    LDA.b #$18                ;
                    STA.w $0F4C               ;
                    STX.w $0F4D               ;
                    LDY.w $0368               ;\Index of bowser sprite
                    LDA.w $1C,y             ; |
                    CMP.b #$2D                ; |If there's a bowser sprite present, branch
                    BEQ   CODE_03C9E4         ;/
                    JSR.w CODE_03D6F9         ;\Get timer delay of next fireball spawn
                    CLC                       ; |make them spawn #$20 frames later by default.
                    ADC.b #$20                ;/
                    LDY.w $06CC               ;\If hard flag (levels after 5-3)
                    BEQ   CODE_03C9A3         ; |
                    SEC                       ; |make fireballs spawn #$10 frames later instead of #$20
                    SBC.b #$10                ; |
CODE_03C9A3:        STA.w $079B               ;/Timer to spawn next sprite
                    LDA.w $07B7,x             ;\
                    AND.b #$03                ; |Get random value and make the range $00-$03
                    STA.w $041D,x             ; |
                    TAY                       ; |
                    LDA.w $C970,y             ; |Store bowser fireball Y position and into $041D,x
                    STA.w $0238,x             ;/
                    LDA.w $071D               ;\
                    CLC                       ; |X-Position of fireball = right border of screen + #$20
                    ADC.b #$20                ; |
                    STA.w $021A,x             ; |
                    LDA.w $071B               ; |
                    ADC.b #$00                ; |
                    STA.b $79,x               ;/
                    STZ.w $0F4C               ;Zero out how long bowser holds his breath for firing
                    STZ.w $0F4D               ;
                    STZ.w $014B               ;
                    LDA.b #$17                ;\Play fire sound effect
                    STA.w $1603               ;/(note: NOT fire -breath-)
                    LDA.b #$08                ;
                    STA.w $0490,x             ;
                    LDA.b #$01                ;
                    STA.b $BC,x               ;
                    STA.b $10,x               ;Set sprite on-screen flag
                    LSR   A                   ;A = 00
                    STA.w $0402,x             ;
                    STA.b $29,x               ;
CODE_03C9E4:        STX.w $0F4E               ;Generated sprite index to $0F4E
                    RTS                       ;

CODE_03C9E8:        STA.w $0238,x             ;
                    LDA.w $071D               ;
                    CLC                       ;
                    ADC.b #$20                ;
                    STA.w $021A,x             ;
                    LDA.w $071B               ;
                    ADC.b #$00                ;
                    STA.b $79,x               ;
                    JMP.w CODE_03CA32         ;

                    LDA.w $021A,y             ;
                    SEC                       ;
                    SBC.b #$0E                ;
                    STA.w $021A,x             ;
                    LDA.w $79,y             ;
                    STA.b $79,x               ;
                    LDA.w $0238,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0238,x             ;
                    LDA.w $07B7,x             ;
                    AND.b #$03                ;
                    STA.w $041D,x             ;
                    TAY                       ;
                    LDA.w $C970,y             ;
                    LDY.b #$00                ;
                    CMP.w $0238,x             ;
                    BCC   CODE_03CA29         ;
                    INY                       ;
CODE_03CA29:        LDA.w $C974,y             ;
                    STA.w $043D,x             ;
                    STZ.w $06CB               ;
CODE_03CA32:        LDA.b #$08                ;
                    STA.w $0490,x             ;
                    LDA.b #$01                ;
                    STA.b $BC,x               ;
                    STA.b $10,x               ;
                    LSR   A                   ;
                    STA.w $0402,x             ;
                    STA.b $29,x               ;
                    RTS                       ;

                    db $00,$30,$60,$60,$00,$20,$60

                    db $40,$70,$40,$60,$30

CODE_03CA50:        LDA.w $079B               ;
                    BNE   CODE_03CA9E         ;
                    LDA.b #$20                ;
                    STA.w $079B               ;
                    DEC.w $06D7               ;
                    LDY.b #$0A                ;
CODE_03CA5F:        DEY                       ;
                    LDA.w $1C,y             ;
                    CMP.b #$31                ;
                    BNE   CODE_03CA5F         ;
                    LDA.w $021A,y             ;
                    SEC                       ;
                    SBC.b #$30                ;
                    PHA                       ;
                    LDA.w $79,y             ;
                    SBC.b #$00                ;
                    STA.b $00                 ;
                    LDA.w $06D7               ;
                    CLC                       ;
                    ADC.w $0029,y             ;
                    TAY                       ;
                    PLA                       ;
                    CLC                       ;
                    ADC.w $CA44,y             ;
                    STA.w $021A,x             ;
                    LDA.b $00                 ;
                    ADC.b #$00                ;
                    STA.b $79,x               ;
                    LDA.w $CA4A,y             ;
                    STA.w $0238,x             ;
                    LDA.b #$01                ;
                    STA.b $BC,x               ;
                    STA.b $10,x               ;
                    LSR   A                   ;
                    STA.b $5E,x               ;
                    LDA.b #$08                ;
                    STA.b $A1,x               ;
CODE_03CA9E:        RTS                       ;

                    db $01,$02,$04,$08,$10,$20,$40,$80

                    db $40,$30,$90,$50,$20,$60,$A0,$70

                    db $0A,$0B

CODE_03CAB1:        LDA.w $079B               ;
                    BNE   CODE_03CB21         ;
                    LDA.b $5C                 ;
                    BNE   CODE_03CB0E         ;
                    CPX.b #$03                ;
                    BCS   CODE_03CB21         ;
                    LDY.b #$00                ;
                    LDA.w $07B7,x             ;
                    CMP.b #$AA                ;
                    BCC   CODE_03CAC8         ;
                    INY                       ;
CODE_03CAC8:        LDA.w $075F               ;
                    CMP.b #$01                ;
                    BEQ   CODE_03CAD0         ;
                    INY                       ;
CODE_03CAD0:        TYA                       ;
                    AND.b #$01                ;
                    TAY                       ;
                    LDA.w $CAAF,y             ;
CODE_03CAD7:        STA.b $1C,x               ;
                    LDA.w $06DD               ;
                    CMP.b #$FF                ;
                    BNE   CODE_03CAE3         ;
                    STZ.w $06DD               ;
CODE_03CAE3:        LDA.w $07B7,x             ;
                    AND.b #$07                ;
CODE_03CAE8:        TAY                       ;
                    LDA.w $CA9F,y             ;
                    BIT.w $06DD               ;
                    BEQ   CODE_03CAF7         ;
                    INY                       ;
                    TYA                       ;
                    AND.b #$07                ;
                    BRA   CODE_03CAE8         ;

CODE_03CAF7:        ORA.w $06DD               ;
                    STA.w $06DD               ;
                    LDA.w $CAA7,y             ;
                    JSR.w CODE_03C9E8         ;
                    STA.w $041D,x             ;
                    LDA.b #$20                ;
                    STA.w $079B               ;
                    JMP.w CODE_03C60B         ;

CODE_03CB0E:        LDY.b #$FF                ;
CODE_03CB10:        INY                       ;
                    CPY.b #$09                ;
                    BCS   CODE_03CB22         ;
                    LDA.w $10,y             ;
                    BEQ   CODE_03CB10         ;
                    LDA.w $1C,y             ;
                    CMP.b #$08                ;
                    BNE   CODE_03CB10         ;
CODE_03CB21:        RTS                       ;

CODE_03CB22:        LDA.b #$09                ;
                    STA.w $1603               ;
                    LDA.b #$08                ;
                    BNE   CODE_03CAD7         ;
CODE_03CB2B:        LDY.b #$00                ;
                    SEC                       ;
                    SBC.b #$37                ;
                    PHA                       ;
                    CMP.b #$04                ;
                    BCS   CODE_03CB40         ;
                    PHA                       ;
                    LDY.b #$06                ;
                    LDA.w $076A               ;
                    BEQ   CODE_03CB3F         ;
                    LDY.b #$02                ;
CODE_03CB3F:        PLA                       ;
CODE_03CB40:        STY.b $01                 ;
                    LDY.b #$B0                ;
                    AND.b #$02                ;
                    BEQ   CODE_03CB4A         ;
                    LDY.b #$70                ;
CODE_03CB4A:        STY.b $00                 ;
                    LDA.w $071B               ;
                    STA.b $02                 ;
                    LDA.w $071D               ;
                    STA.b $03                 ;
                    LDY.b #$02                ;
                    PLA                       ;
                    LSR   A                   ;
                    BCC   CODE_03CB5D         ;
                    INY                       ;
CODE_03CB5D:        STY.w $06D3               ;
CODE_03CB60:        LDX.b #$FF                ;
CODE_03CB62:        INX                       ;
                    CPX.b #$09                ;
                    BCS   CODE_03CB96         ;
                    LDA.b $10,x               ;
                    BNE   CODE_03CB62         ;
                    LDA.b $01                 ;
                    STA.b $1C,x               ;
                    LDA.b $02                 ;
                    STA.b $79,x               ;
                    LDA.b $03                 ;
                    STA.w $021A,x             ;
                    CLC                       ;
                    ADC.b #$18                ;
                    STA.b $03                 ;
                    LDA.b $02                 ;
                    ADC.b #$00                ;
                    STA.b $02                 ;
                    LDA.b $00                 ;
                    STA.w $0238,x             ;
                    LDA.b #$01                ;
                    STA.b $BC,x               ;
                    STA.b $10,x               ;
                    JSR.w CODE_03C60B         ;
                    DEC.w $06D3               ;
                    BNE   CODE_03CB60         ;
CODE_03CB96:        JMP.w CODE_03C5FF         ;

CODE_03CB99:        LDA.b #$01                ;
                    STA.b $5E,x               ;
                    LSR   A                   ;
                    STA.b $29,x               ;
                    STA.b $A1,x               ;
                    LDA.w $0238,x             ;
                    STA.w $043D,x             ;
                    SEC                       ;
                    SBC.b #$18                ;
                    STA.w $041D,x             ;
                    LDA.b #$09                ;
                    LDA.b #$0C                ;
                    JMP.w CODE_03CBFC         ;

CODE_03CBB5:        LDA.b $1C,x               ;\ Generator to create
                    STA.w $06CB               ;/ Store in this RAM address
                    SEC                       ;\ Subtract sprite by $12
                    SBC.b #$12                ;/
                    ASL   A                   ;\ Multiply by 2
                    TAY                       ;/ To use it as an index
                    LDA.w $CBCC,y             ;\
                    STA.b $04                 ; |
                    LDA.w $CBCD,y             ; | Jump to pointer tables below.
                    STA.b $05                 ; |
                    JMP.w ($0004)             ;/

;MAIN Routines for generators 12-17 (redirected from INIT routine pointer table)
                    dw CODE_03C768            ;12 - Lakitu generator (?)
                    dw CODE_03CBD8            ;13 - Nothing at all (crashes)
                    dw CODE_03C870            ;14 - Red flying cheep-cheep generator
                    dw CODE_03C976            ;15 - Bowser's fire generator
                    dw CODE_03CA50            ;16 - Fireworks generator
                    dw CODE_03CAB1            ;17 - Bullet bill/swimming cheep-cheep generator

CODE_03CBD8:        RTS                       ;Return

CODE_03CBD9:        LDY.b #$09                ;\ Disable lakitu generator sprite
CODE_03CBDB:        LDA.w $1C,y             ; |Find a lakitu, any of them
                    CMP.b #$11                ; |
                    BNE   CODE_03CBE7         ; |
                    LDA.b #$01                ; |Tell them to go off-screen to the left without doing
                    STA.w $29,y             ; |anything.
CODE_03CBE7:        DEY                       ; |
                    BPL   CODE_03CBDB         ; |
                    LDA.b #$00                ; |
                    STA.w $06CB               ; |
                    STA.b $10,x               ; |Disable on-screen flag?
                    RTS                       ;/Return

CODE_03CBF2:        LDA.b #$02                ;
                    STA.b $47,x               ;
                    LDA.b #$F8                ;
                    STA.b $5E,x               ;
CODE_03CBFA:        LDA.b #$03                ;
CODE_03CBFC:        STA.w $0490,x             ;
                    RTS                       ;

CODE_03CC00:        DEC.w $0238,x             ;
                    DEC.w $0238,x             ;
                    LDY.w $06CC               ;
                    BNE   CODE_03CC10         ;
                    LDY.b #$02                ;
                    JSR.w CODE_03CC95         ;
CODE_03CC10:        LDY.b #$FF                ;
                    LDA.w $03A0               ;
                    STA.b $29,x               ;
                    BPL   CODE_03CC1B         ;
                    TXA                       ;
                    TAY                       ;
CODE_03CC1B:        STY.w $03A0               ;
                    LDA.b #$00                ;
                    STA.b $47,x               ;
                    TAY                       ;
                    JSR.w CODE_03CC95         ;
CODE_03CC26:        LDA.b #$FF                ;
                    STA.w $03A2,x             ;
                    JMP.w CODE_03CC4D         ;

CODE_03CC2E:        LDA.b #$00                ;
                    STA.b $5E,x               ;
                    JMP.w CODE_03CC4D         ;

CODE_03CC35:        LDY.b #$40                ;
                    LDA.w $0238,x             ;
                    BPL   CODE_03CC43         ;
                    EOR.b #$FF                ;
                    CLC                       ;
                    ADC.b #$01                ;
                    LDY.b #$C0                ;
CODE_03CC43:        STA.w $0402,x             ;
                    TYA                       ;
                    CLC                       ;
                    ADC.w $0238,x             ;
                    STA.b $5E,x               ;
CODE_03CC4D:        JSR.w CODE_03C726         ;
CODE_03CC50:        LDA.b #$05                ;
                    LDY.b $5C                 ;
                    CPY.b #$03                ;
                    BEQ   CODE_03CC5F         ;
                    LDY.w $06CC               ;
                    BNE   CODE_03CC5F         ;
                    LDA.b #$06                ;
CODE_03CC5F:        STA.w $0490,x             ;
                    RTS                       ;

CODE_03CC63:        JSR.w CODE_03CC6F         ;
                    JMP.w CODE_03CC6C         ;

CODE_03CC69:        JSR.w CODE_03CC7B         ;
CODE_03CC6C:        JMP.w CODE_03CC50         ;

CODE_03CC6F:        LDA.b #$10                ;
                    STA.w $043D,x             ;
                    LDA.b #$FF                ;
                    STA.b $A1,x               ;
                    JMP.w CODE_03CC84         ;

CODE_03CC7B:        LDA.b #$F0                ;
                    STA.w $043D,x             ;
                    LDA.b #$00                ;
                    STA.b $A1,x               ;
CODE_03CC84:        LDY.b #$01                ;
                    JSR.w CODE_03CC95         ;
                    LDA.b #$04                ;
                    STA.w $0490,x             ;
                    RTS                       ;

                    db $08,$0C,$F8

                    db $00,$00,$FF

CODE_03CC95:        LDA.w $021A,x             ;
                    CLC                       ;
                    ADC.w $CC8F,y             ;
                    STA.w $021A,x             ;
                    LDA.b $79,x               ;
                    ADC.w $CC92,y             ;
                    STA.b $79,x               ;
                    RTS                       ;

CODE_03CCA7:        RTS                       ;

CODE_03CCA8:        LDX.b $9E                 ;Get sprite index
                    LDA.b #$00                ;load 00 into A
                    LDY.b $1C,x               ;Load current sprite number
                    CPY.b #$15                ;\If it is smaller than 15 (00-14)
                    BCC   CODE_03CCB5         ;/Skip the next 2 lines.
                    TYA                       ;Transfer Y to A
                    SBC.b #$14                ;Sprites start from 14
CODE_03CCB5:        ASL   A                   ;Get index to next table
                    TAY                       ;A -> Y
                    LDA.w $CCC4,y             ;\
                    STA.b $04                 ; |Load 16-bit pointer tables
                    LDA.w $CCC5,y             ; |
                    STA.b $05                 ; |
                    JMP.w ($0004)             ;/

;MAIN ROUTINES for sprites $14-$35
                    dw CODE_03CD12            ;14 - Red flying cheep-cheep generator
                    dw CODE_03CD73            ;15 - Bowser's fire generator
                    dw CODE_03D761            ;16 - Fireworks generator
                    dw CODE_03CD08            ;17 - Bullet Bill/Cheep-cheep generator
                    dw CODE_03CD08            ;18 - Disable Lakitu generator (nothing in MAIN though)
                    dw CODE_03CD08            ;19 - Nothing
                    dw CODE_03CD08            ;1A - Nothing
                    dw CODE_03CD85            ;1B - Fire-bar (Clockwise)
                    dw CODE_03CD85            ;1C - Fast Fire-bar (Clockwise)
                    dw CODE_03CD85            ;1D - Fire-bar (Counter-Clockwise)
                    dw CODE_03CD85            ;1E - Fast Fire-bar (Counter-Clockwise)
                    dw CODE_03CD85            ;1F - Long Fire Bar (Clockwise)
                    dw CODE_03CD85            ;20 - Nothing? Related to the fire-bars above?
                    dw CODE_03CD85            ;21 - Nothing? Related to the fire-bars above?
                    dw CODE_03CD85            ;22 - Nothing? Related to the fire-bars above?
                    dw CODE_03CD08            ;23 - Nothing.
                    dw CODE_03CDA3            ;24 - Lift (Balance)
                    dw CODE_03CDA3            ;25 - Lift (Down then Up)
                    dw CODE_03CDA3            ;26 - Lift (Continuous up)
                    dw CODE_03CDA3            ;27 - Lift (Continuous down)
                    dw CODE_03CDA3            ;28 - Lift (Left the Right)
                    dw CODE_03CDA3            ;29 - Lift (Fall)
                    dw CODE_03CDA3            ;2A - Lift (Continuous right)
                    dw CODE_03CD8B            ;2B - Short lift (Up)
                    dw CODE_03CD8B            ;2C - Short lift (Down)
                    dw CODE_03D55E            ;2D - Bowser
                    dw CODE_03BDC3            ;2E - ???
                    dw CODE_03BA31            ;2F - ???
                    dw CODE_03CD08            ;30 - Flagpole?
                    dw CODE_03D7AF            ;31 - Timer->Score and level end controller sprite + end level flag?
                    dw CODE_03B991            ;32 - Red springboard
                    dw CODE_03CD08            ;33 - Nothing
                    dw CODE_03B839            ;34 - Warp Zone
                    dw CODE_03CD09            ;35 - Toad/Princess

CODE_03CD08:        RTS                       ;

CODE_03CD09:        JSR.w CODE_03FDCB         ;
                    JSR.w CODE_03FD39         ;
                    JMP.w CODE_03EEEF         ;

CODE_03CD12:        LDA.b #$20                ;
                    STA.w $0257,x             ;
                    JSR.w CODE_03FDCB         ;
                    JSR.w CODE_03FD39         ;
                    JSR.w CODE_03EEEF         ;
                    JSR.w CODE_03E9CC         ;
                    JSR.w CODE_03E72E         ;
                    JSR.w CODE_03E0C4         ;
                    JSR.w CODE_03DE55         ;
                    LDY.w $0747               ;
                    BNE   CODE_03CD34         ;
                    JSR.w CODE_03CD37         ;
CODE_03CD34:        JMP.w CODE_03DC03         ;

CODE_03CD37:        LDA.b $1C,x               ;Load sprite number
                    ASL   A                   ;*2
                    TAY                       ;Use as index
                    LDA.w $CD48,y             ;\
                    STA.b $04                 ; |
                    LDA.w $CD49,y             ; |Jump to the sprite routines
                    STA.b $05                 ; |
                    JMP.w ($0004)             ;/

;MAIN routines for general sprites - updates behavior? OAM code is elsewhere?

                    dw CODE_03CF08            ;00 - Green koopa
                    dw CODE_03CF08            ;01 - Red koopa (walks off ledges)
                    dw CODE_03CF08            ;02 - Buzzy beetle
                    dw CODE_03CF08            ;03 - Red koopa (stays on ledges)
                    dw CODE_03CF08            ;04 - Green koopa (doesn't move)
                    dw CODE_03CE67            ;05 - Hammer bros
                    dw CODE_03CF08            ;06 - Goomba
                    dw CODE_03D01F            ;07 - Blooper
                    dw CODE_03D0D5            ;08 - Bullet Bill
                    dw CODE_03CD72            ;09 - Yellow paratroopa (doesn't move)
                    dw CODE_03D0E9            ;0A - Green cheep-cheep (slow)
                    dw CODE_03D0E9            ;0B - Red cheep-cheep (fast)
                    dw CODE_03CE1A            ;0C - Podoboo
                    dw CODE_03D891            ;0D - Piranha plant
                    dw CODE_03CF8A            ;0E - Green paratroopa (leaping)
                    dw CODE_03CF90            ;0F - Red paratroopa (down & up)
                    dw CODE_03CFB9            ;10 - Green paratroopa (left & right)
                    dw CODE_03D3DE            ;11 - Lakitu
                    dw CODE_03CF08            ;12 - Spiny (not recommended for direct use)
                    dw CODE_03CD72            ;13 - "DO NOT USE" (this points to an RTS)
                    dw CODE_03D397            ;14 - Red Flying Cheep-Cheep

CODE_03CD72:        RTS                       ;

CODE_03CD73:        JSR.w CODE_03D70B         ;
                    JSR.w CODE_03FDCB         ;
                    JSR.w CODE_03FD39         ;
                    JSR.w CODE_03E9CC         ;
                    JSR.w CODE_03DE55         ;
                    JMP.w CODE_03DC03         ;

CODE_03CD85:        JSR.w CODE_03D1E1         ;
                    JMP.w CODE_03DC03         ;

CODE_03CD8B:        JSR.w CODE_03FDCB         ;
                    JSR.w CODE_03FD39         ;
                    JSR.w CODE_03E9D5         ;
                    JSR.w CODE_03E21E         ;
                    JSR.w CODE_03FD39         ;
                    JSR.w CODE_03F5B2         ;
                    JSR.w CODE_03DBD9         ;
                    JMP.w CODE_03DC03         ;

CODE_03CDA3:        JSR.w CODE_03FDCB         ;
                    JSR.w CODE_03FD39         ;
                    JSR.w CODE_03EA04         ;
                    JSR.w CODE_03E1E7         ;
                    LDA.w $0747               ;
                    BNE   CODE_03CDB7         ;
                    JSR.w CODE_03CDC0         ;
CODE_03CDB7:        JSR.w CODE_03FD39         ;
                    JSR.w CODE_03EC5E         ;
                    JMP.w CODE_03DC03         ;

CODE_03CDC0:        LDA.b $1C,x               ;\Load sprite number
                    SEC                       ; |Sprite number - $24
                    SBC.b #$24                ; |
                    ASL   A                   ;/|*2
                    TAY                       ;/Use as index. Sprite $24 will have index $00
                    LDA.w $CDD4,y             ;\
                    STA.b $04                 ; |
                    LDA.w $CDD5,y             ; |
                    STA.b $05                 ; |Jump to pointer tables
                    JMP.w ($0004)             ;/

;lift movement handler (move by itself, move when stepped on by player, etc)

                    dw CODE_03D914            ;24 - Lift (Balance)
                    dw CODE_03DB54            ;25 - Lift (Down then up)
                    dw CODE_03DBD3            ;26 - Lift (Up)
                    dw CODE_03DBD3            ;27 - Lift (Down)
                    dw CODE_03DB8A            ;28 - Lift (Left then right)
                    dw CODE_03DBB5            ;28 - Lift (Fall)
                    dw CODE_03DBC1            ;29 - Lift (Right)

CODE_03CDE2:        STZ.w $07A2,x             ;
CODE_03CDE5:        CPX.b #$09                ;
                    BNE   CODE_03CE00         ;
                    LDA.b #$F0                ;
                    STA.w $09E1               ;
                    STA.w $09E5               ;
                    STA.w $09E9               ;
                    STA.w $09ED               ;
                    LDA.b $DB                 ;
                    CMP.b #$22                ;
                    BNE   CODE_03CE00         ;
                    STZ.w $0743               ;
CODE_03CE00:        STZ.b $10,x               ;
                    STZ.b $1C,x               ;
                    STZ.b $29,x               ;
                    STZ.w $0110,x             ;
                    STZ.w $012E,x             ;
                    STZ.w $0792,x             ;
                    STZ.w $03A2,x             ;
                    LDA.b #$20                ;
                    STA.w $0257,x             ;
                    LDA.b #$00                ;
                    RTS                       ;

CODE_03CE1A:        LDA.w $07A2,x             ;
                    BNE   CODE_03CE35         ;
                    JSR.w CODE_03C6A4         ;
                    LDA.w $07B8,x             ;
                    ORA.b #$80                ;
                    STA.w $043D,x             ;
                    AND.b #$0F                ;
                    ORA.b #$06                ;
                    STA.w $07A2,x             ;
                    LDA.b #$F9                ;
                    STA.b $A1,x               ;
CODE_03CE35:        LDA.w $A1,x             ;
                    BMI   CODE_03CE53         ;
                    LDA.w $0238,x             ;
                    CMP.b #$C0                ;
                    BCC   CODE_03CE53         ;
                    LDA.w $0B00,x             ;
                    CMP.b #$02                ;
                    BNE   CODE_03CE53         ;
                    INC.w $0B00,x             ;
                    STZ.w $0B09,x             ;
                    LDA.b #$27                ;
                    STA.w $1603               ;
CODE_03CE53:        INC.w $0B09,x             ;
                    JSL.l CODE_05D614         ;
                    JMP.w CODE_03C140         ;

                    db $30,$1C

                    db $00,$E8,$00,$18,$08,$F8,$0C,$F4

CODE_03CE67:        LDA.b $29,x               ;\MAIN routine of hammer bros
                    AND.b #$20                ; |If not dying, branch
                    BEQ   CODE_03CE70         ;/
                    JMP.w CODE_03CF76         ;Else, jump if dying.

CODE_03CE70:        LDA.w $020F,x             ;\ Hammer bros jump timer
                    BEQ   CODE_03CEA3         ; |If jump timer reached 00, make hammer bros jump
                    DEC.w $020F,x             ;/ else, decrease timer and continue.
                    LDA.w $03D1               ;\
                    AND.b #$0C                ; |If $04,$08 or $0C
                    BNE   CODE_03CEE9         ;/Branch
                    LDA.w $03A2,x             ;\If hammer throw timer ($03A2) is not 00
                    BNE   CODE_03CE9B         ;/Branch
                    LDY.w $06CC               ;
                    LDA.w $CE5D,y             ;
                    STA.w $03A2,x             ;
                    JSR.w CODE_03BB8E         ;
                    BCC   CODE_03CE9B         ;
                    LDA.b $29,x               ;
                    ORA.b #$08                ;
                    STA.b $29,x               ;
                    JMP.w CODE_03CEE9         ;

CODE_03CE9B:        DEC.w $03A2,x             ;
                    JMP.w CODE_03CEE9         ;

                    db $20,$37

CODE_03CEA3:        LDA.b $29,x               ;
                    AND.b #$07                ;
                    CMP.b #$01                ;
                    BEQ   CODE_03CEE9         ;
                    STZ.b $00                 ;
                    LDY.b #$FA                ;
                    LDA.w $0238,x             ;
                    BMI   CODE_03CEC7         ;
                    LDY.b #$FD                ;
                    CMP.b #$70                ;
                    INC.b $00                 ;
                    BCC   CODE_03CEC7         ;
                    DEC.b $00                 ;
                    LDA.w $07B8,x             ;
                    AND.b #$01                ;
                    BNE   CODE_03CEC7         ;
                    LDY.b #$FA                ;
CODE_03CEC7:        STY.b $A1,x               ;
                    LDA.b $29,x               ;
                    ORA.b #$01                ;
                    STA.b $29,x               ;
                    LDA.b $00                 ;
                    AND.w $07B9,x             ;
                    TAY                       ;
                    LDA.w $06CC               ;
                    BNE   CODE_03CEDB         ;
                    TAY                       ;
CODE_03CEDB:        LDA.w $CEA1,y             ;
                    STA.w $0792,x             ;
                    LDA.w $07B8,x             ;
                    ORA.b #$C0                ;
                    STA.w $020F,x             ;
CODE_03CEE9:        LDY.b #$FC                ;
                    LDA.b $09                 ;
                    AND.b #$40                ;
                    BNE   CODE_03CEF3         ;
                    LDY.b #$04                ;
CODE_03CEF3:        STY.b $5E,x               ;
                    LDY.b #$01                ;
                    JSR.w CODE_03E8BC         ;
                    BMI   CODE_03CF06         ;
                    INY                       ;
                    LDA.w $07A2,x             ;
                    BNE   CODE_03CF06         ;
                    LDA.b #$F8                ;
                    STA.b $5E,x               ;
CODE_03CF06:        STY.b $47,x               ;
CODE_03CF08:        LDY.b #$00                ;
                    LDA.b $29,x               ;
                    AND.b #$40                ;
                    BNE   CODE_03CF29         ;
                    LDA.b $29,x               ;
                    ASL   A                   ;
                    BCS   CODE_03CF45         ;
                    LDA.b $29,x               ;
                    AND.b #$20                ;
                    BNE   CODE_03CF76         ;
                    LDA.b $29,x               ;
                    AND.b #$07                ;
                    BEQ   CODE_03CF45         ;
                    CMP.b #$05                ;
                    BEQ   CODE_03CF29         ;
                    CMP.b #$03                ;
                    BCS   CODE_03CF59         ;
CODE_03CF29:        JSR.w CODE_03C113         ;
                    LDY.b #$00                ;
                    LDA.b $29,x               ;
                    CMP.b #$02                ;
                    BEQ   CODE_03CF40         ;
                    AND.b #$40                ;
                    BEQ   CODE_03CF45         ;
                    LDA.b $1C,x               ;
                    CMP.b #$2E                ;
                    BEQ   CODE_03CF45         ;
                    BNE   CODE_03CF43         ;
CODE_03CF40:        JMP.w CODE_03C0AD         ;

CODE_03CF43:        LDY.b #$01                ;
CODE_03CF45:        LDA.b $5E,x               ;
                    PHA                       ;
                    BPL   CODE_03CF4C         ;
                    INY                       ;
                    INY                       ;
CODE_03CF4C:        CLC                       ;
                    ADC.w $CE5F,y             ;
                    STA.b $5E,x               ;
                    JSR.w CODE_03C0AD         ;
                    PLA                       ;
                    STA.b $5E,x               ;
                    RTS                       ;

CODE_03CF59:        LDA.w $07A2,x             ;
                    BNE   CODE_03CF7C         ;
                    STA.b $29,x               ;
                    LDA.b $09                 ;
                    AND.b #$01                ;
                    TAY                       ;
                    INY                       ;
                    STY.b $47,x               ;
                    DEY                       ;
                    LDA.w $076A               ;
                    BEQ   CODE_03CF70         ;
                    INY                       ;
                    INY                       ;
CODE_03CF70:        LDA.w $CE63,y             ;
                    STA.b $5E,x               ;
                    RTS                       ;

CODE_03CF76:        JSR.w CODE_03C113         ;
                    JMP.w CODE_03C0AD         ;

CODE_03CF7C:        CMP.b #$0E                ;
                    BNE   CODE_03CF89         ;
                    LDA.b $1C,x               ;
                    CMP.b #$06                ;
                    BNE   CODE_03CF89         ;
                    JSR.w CODE_03CDE2         ;
CODE_03CF89:        RTS                       ;

CODE_03CF8A:        JSR.w CODE_03C140         ;
                    JMP.w CODE_03C0AD         ;

CODE_03CF90:        LDA.b $A1,x               ;
                    ORA.w $043D,x             ;
                    BNE   CODE_03CFAC         ;
                    STA.w $041D,x             ;
                    LDA.w $0238,x             ;
                    CMP.w $0402,x             ;
                    BCS   CODE_03CFAC         ;
                    LDA.b $09                 ;
                    AND.b #$07                ;
                    BNE   CODE_03CFAB         ;
                    INC.w $0238,x             ;
CODE_03CFAB:        RTS                       ;

CODE_03CFAC:        LDA.w $0238,x             ;
                    CMP.b $5E,x               ;
                    BCC   CODE_03CFB6         ;
                    JMP.w CODE_03C123         ;

CODE_03CFB6:        JMP.w CODE_03C11F         ;

CODE_03CFB9:        JSR.w CODE_03CFDB         ;
                    JSR.w CODE_03CFFC         ;
                    LDY.b #$01                ;
                    LDA.b $09                 ;
                    AND.b #$03                ;
                    BNE   CODE_03CFDA         ;
                    LDA.b $09                 ;
                    AND.b #$40                ;
                    BNE   CODE_03CFCF         ;
                    LDY.b #$FF                ;
CODE_03CFCF:        STY.b $00                 ;
                    LDA.w $0238,x             ;
                    CLC                       ;
                    ADC.b $00                 ;
                    STA.w $0238,x             ;
CODE_03CFDA:        RTS                       ;

CODE_03CFDB:        LDA.b #$13                ;
CODE_03CFDD:        STA.b $01                 ;
                    LDA.b $09                 ;
                    AND.b #$03                ;
                    BNE   CODE_03CFF2         ;
                    LDY.b $5E,x               ;
                    LDA.b $A1,x               ;
                    LSR   A                   ;
                    BCS   CODE_03CFF6         ;
                    CPY.b $01                 ;
                    BEQ   CODE_03CFF3         ;
                    INC.b $5E,x               ;
CODE_03CFF2:        RTS                       ;

CODE_03CFF3:        INC.b $A1,x               ;
                    RTS                       ;

CODE_03CFF6:        TYA                       ;
                    BEQ   CODE_03CFF3         ;
                    DEC.b $5E,x               ;
                    RTS                       ;

CODE_03CFFC:        LDA.b $5E,x               ;
                    PHA                       ;
                    LDY.b #$01                ;
                    LDA.b $A1,x               ;
                    AND.b #$02                ;
                    BNE   CODE_03D012         ;
                    LDA.b $5E,x               ;
                    EOR.b #$FF                ;
                    CLC                       ;
                    ADC.b #$01                ;
                    STA.b $5E,x               ;
                    LDY.b #$02                ;
CODE_03D012:        STY.b $47,x               ;
                    JSR.w CODE_03C0AD         ;
                    STA.b $00                 ;
                    PLA                       ;
                    STA.b $5E,x               ;
                    RTS                       ;

                    db $3F,$03

CODE_03D01F:        LDA.b $29,x               ;0 S:01FF P:EnvMXdIzc HC:0870 VC:000 FC:00 I:00
                    AND.b #$20                ;0 S:01FF P:EnvMXdIzc HC:0886 VC:000 FC:00 I:00
                    BNE   CODE_03D078         ;0 S:01FF P:EnvMXdIzc HC:0902 VC:000 FC:00 I:00
                    LDY.w $06CC               ;
                    LDA.w $07B8,x             ;
                    AND.w $D01D,y             ;
                    BNE   CODE_03D042         ;
                    TXA                       ;
                    LSR   A                   ;
                    BCC   CODE_03D038         ;
                    LDY.b $46                 ;
                    BCS   CODE_03D040         ;
CODE_03D038:        LDY.b #$02                ;
                    JSR.w CODE_03E8BC         ;
                    BPL   CODE_03D040         ;
                    DEY                       ;
CODE_03D040:        STY.b $47,x               ;
CODE_03D042:        JSR.w CODE_03D07B         ;
                    LDA.w $0238,x             ;
                    SEC                       ;
                    SBC.w $043D,x             ;
                    CMP.b #$20                ;
                    BCC   CODE_03D053         ;
                    STA.w $0238,x             ;
CODE_03D053:        LDY.b $47,x               ;
                    DEY                       ;
                    BNE   CODE_03D068         ;
                    LDA.w $021A,x             ;
                    CLC                       ;
                    ADC.b $5E,x               ;
                    STA.w $021A,x             ;
                    LDA.b $79,x               ;
                    ADC.b #$00                ;
                    STA.b $79,x               ;
                    RTS                       ;

CODE_03D068:        LDA.w $021A,x             ;
                    SEC                       ;
                    SBC.b $5E,x               ;
                    STA.w $021A,x             ;
                    LDA.b $79,x               ;
                    SBC.b #$00                ;
                    STA.b $79,x               ;
                    RTS                       ;

CODE_03D078:        JMP.w CODE_03C13A         ;

CODE_03D07B:        LDA.b $A1,x               ;
                    AND.b #$02                ;
                    BNE   CODE_03D0B8         ;
                    LDA.b $09                 ;
                    AND.b #$07                ;
                    PHA                       ;
                    LDA.b $A1,x               ;
                    LSR   A                   ;
                    BCS   CODE_03D0A0         ;
                    PLA                       ;
                    BNE   CODE_03D09F         ;
                    LDA.w $043D,x             ;
                    CLC                       ;
                    ADC.b #$01                ;
                    STA.w $043D,x             ;
                    STA.b $5E,x               ;
                    CMP.b #$02                ;
                    BNE   CODE_03D09F         ;
                    INC.b $A1,x               ;
CODE_03D09F:        RTS                       ;

CODE_03D0A0:        PLA                       ;
                    BNE   CODE_03D0B7         ;
                    LDA.w $043D,x             ;
                    SEC                       ;
                    SBC.b #$01                ;
                    STA.w $043D,x             ;
                    STA.b $5E,x               ;
                    BNE   CODE_03D0B7         ;
                    INC.b $A1,x               ;
                    LDA.b #$02                ;
                    STA.w $07A2,x             ;
CODE_03D0B7:        RTS                       ;

CODE_03D0B8:        LDA.w $07A2,x             ;
                    BEQ   CODE_03D0C6         ;
CODE_03D0BD:        LDA.b $09                 ;
                    LSR   A                   ;
                    BCS   CODE_03D0C5         ;
                    INC.w $0238,x             ;
CODE_03D0C5:        RTS                       ;

CODE_03D0C6:        LDA.w $0238,x             ;
                    ADC.b #$10                ;
                    CMP.w $0237               ;
                    BCC   CODE_03D0BD         ;
                    LDA.b #$00                ;
                    STA.b $A1,x               ;
                    RTS                       ;

CODE_03D0D5:        LDA.b $29,x               ;
                    AND.b #$20                ;
                    BEQ   CODE_03D0DE         ;
                    JMP.w CODE_03C140         ;

CODE_03D0DE:        LDA.b #$E8                ;
                    STA.b $5E,x               ;
                    JMP.w CODE_03C0AD         ;

                    db $40,$80,$04,$04

CODE_03D0E9:        LDA.b $29,x               ;
                    AND.b #$20                ;
                    BEQ   CODE_03D0F2         ;
                    JMP.w CODE_03C13A         ;

CODE_03D0F2:        STA.b $03                 ;
                    LDA.b $1C,x               ;
                    SEC                       ;
                    SBC.b #$0A                ;
                    TAY                       ;
                    LDA.w $D0E5,y             ;
                    STA.b $02                 ;
                    LDA.w $0402,x             ;
                    SEC                       ;
                    SBC.b $02                 ;
                    STA.w $0402,x             ;
                    LDA.w $021A,x             ;
                    SBC.b #$00                ;
                    STA.w $021A,x             ;
                    LDA.b $79,x               ;
                    SBC.b #$00                ;
                    STA.b $79,x               ;
                    LDA.b #$20                ;
                    STA.b $02                 ;
                    CPX.b #$02                ;
                    BCC   CODE_03D16B         ;
                    LDA.b $5E,x               ;
                    CMP.b #$10                ;
                    BCC   CODE_03D13B         ;
                    LDA.w $041D,x             ;
                    CLC                       ;
                    ADC.b $02                 ;
                    STA.w $041D,x             ;
                    LDA.w $0238,x             ;
                    ADC.b $03                 ;
                    STA.w $0238,x             ;
                    LDA.b $BC,x               ;
                    ADC.b #$00                ;
                    BRA   CODE_03D150         ;

CODE_03D13B:        LDA.w $041D,x             ;
                    SEC                       ;
                    SBC.b $02                 ;
                    STA.w $041D,x             ;
                    LDA.w $0238,x             ;
                    SBC.b $03                 ;
                    STA.w $0238,x             ;
                    LDA.b $BC,x               ;
                    SBC.b #$00                ;
CODE_03D150:        STA.b $BC,x               ;
                    LDY.b #$00                ;
                    LDA.w $0238,x             ;
                    SEC                       ;
                    SBC.w $043D,x             ;
                    BPL   CODE_03D164         ;
                    LDY.b #$10                ;
                    EOR.b #$FF                ;
                    CLC                       ;
                    ADC.b #$01                ;
CODE_03D164:        CMP.b #$0F                ;
                    BCC   CODE_03D16B         ;
                    TYA                       ;
                    STA.b $5E,x               ;
CODE_03D16B:        RTS                       ;

                    db $00,$01,$03,$04,$05,$06,$07,$07
                    db $08,$00,$03,$06,$09,$0B,$0D,$0E
                    db $0F,$10,$00,$04,$09,$0D,$10,$13
                    db $16,$17,$18,$00,$06,$0C,$12,$16
                    db $1A,$1D,$1F,$20,$00,$07,$0F,$16
                    db $1C,$21,$25,$27,$28,$00,$09,$12
                    db $1B,$21,$27,$2C,$2F,$30,$00,$0B
                    db $15,$1F,$27,$2E,$33,$37,$38,$00
                    db $0C,$18,$24,$2D,$35,$3B,$3E,$40
                    db $00,$0E,$1B,$28,$32,$3B,$42,$46
                    db $48,$00,$0F,$1F,$2D,$38,$42,$4A
                    db $4E,$50,$00,$11,$22,$31,$3E,$49
                    db $51,$56,$58

                    db $01,$03,$02,$00

                    db $00,$09,$12,$1B,$24,$2D,$36,$3F
                    db $48,$51,$5A,$63

                    db $0C,$18

CODE_03D1E1:        JSR.w CODE_03FDCB         ;
                    LDA.w $03D1               ;
                    AND.b #$08                ;
                    BNE   CODE_03D25D         ;
                    LDA.w $0747               ;
                    BNE   CODE_03D1FA         ;
                    LDA.w $0388,x             ;
                    JSR.w CODE_03D8F1         ;
                    AND.b #$1F                ;
                    STA.b $A1,x               ;
CODE_03D1FA:        LDA.b $A1,x               ;
                    LDY.b $1C,x               ;
                    CPY.b #$1F                ;
                    BCC   CODE_03D20F         ;
                    CMP.b #$08                ;
                    BEQ   CODE_03D20A         ;
                    CMP.b #$18                ;
                    BNE   CODE_03D20F         ;
CODE_03D20A:        CLC                       ;
                    ADC.b #$01                ;
                    STA.b $A1,x               ;
CODE_03D20F:        STA.b $EF                 ;
                    JSR.w CODE_03FD39         ;
                    JSR.w CODE_03D346         ;
                    LDY.w $0B46,x             ;
                    LDA.w $03B9               ;
                    STA.w $0901,y             ;
                    STA.b $07                 ;
                    LDA.w $03AE               ;
                    STA.w $0900,y             ;
                    STA.b $06                 ;
                    LDA.b #$01                ;
                    STA.b $00                 ;
                    JSR.w CODE_03D2BB         ;
                    LDY.b #$05                ;
                    LDA.b $1C,x               ;
                    CMP.b #$1F                ;
                    BCC   CODE_03D23B         ;
                    LDY.b #$0B                ;
CODE_03D23B:        STY.b $ED                 ;
                    STZ.b $00                 ;
CODE_03D23F:        LDA.b $EF                 ;
                    JSR.w CODE_03D346         ;
                    JSR.w CODE_03D25E         ;
                    LDA.b $00                 ;
                    CMP.b #$04                ;
                    BNE   CODE_03D255         ;
                    LDY.w $06CF               ;
                    LDA.w $0B46,y             ;
                    STA.b $06                 ;
CODE_03D255:        INC.b $00                 ;
                    LDA.b $00                 ;
                    CMP.b $ED                 ;
                    BCC   CODE_03D23F         ;
CODE_03D25D:        RTS                       ;

CODE_03D25E:        LDA.b $03                 ;
                    STA.b $05                 ;
                    LDY.b $06                 ;
                    LDA.b $01                 ;
                    LSR.b $05                 ;
                    BCS   CODE_03D26E         ;
                    EOR.b #$FF                ;
                    ADC.b #$01                ;
CODE_03D26E:        CLC                       ;
                    ADC.w $03AE               ;
                    STA.w $0900,y             ;
                    STA.b $06                 ;
                    CMP.w $03AE               ;
                    BCS   CODE_03D285         ;
                    LDA.w $03AE               ;
                    SEC                       ;
                    SBC.b $06                 ;
                    JMP.w CODE_03D289         ;

CODE_03D285:        SEC                       ;
                    SBC.w $03AE               ;
CODE_03D289:        CMP.b #$59                ;
                    BCC   CODE_03D291         ;
                    LDA.b #$F8                ;
                    BNE   CODE_03D2A6         ;
CODE_03D291:        LDA.w $03B9               ;
                    CMP.b #$F8                ;
                    BEQ   CODE_03D2A6         ;
                    LDA.b $02                 ;
                    LSR.b $05                 ;
                    BCS   CODE_03D2A2         ;
                    EOR.b #$FF                ;
                    ADC.b #$01                ;
CODE_03D2A2:        CLC                       ;
                    ADC.w $03B9               ;
CODE_03D2A6:        STA.w $0901,y             ;
                    STA.b $07                 ;
                    CMP.b #$F0                ;
                    BCC   CODE_03D2B6         ;
                    LDA.b #$01                ;
                    STA.w $0D00,y             ;
                    BRA   CODE_03D2BB         ;

CODE_03D2B6:        LDA.b #$00                ;
                    STA.w $0D00,y             ;
CODE_03D2BB:        JSR.w CODE_03F48B         ;
                    TYA                       ;
                    PHA                       ;
                    LDA.w $07AF               ;
                    ORA.w $0747               ;
                    BNE   CODE_03D33D         ;
                    STA.b $05                 ;
                    LDY.b $BB                 ;
                    DEY                       ;
                    BNE   CODE_03D33D         ;
                    LDY.w $0237               ;
                    LDA.w $0754               ;
                    BNE   CODE_03D2DC         ;
                    LDA.w $0714               ;
                    BEQ   CODE_03D2E5         ;
CODE_03D2DC:        INC.b $05                 ;
                    INC.b $05                 ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b #$18                ;
                    TAY                       ;
CODE_03D2E5:        TYA                       ;
CODE_03D2E6:        SEC                       ;
                    SBC.b $07                 ;
                    BPL   CODE_03D2F0         ;
                    EOR.b #$FF                ;
                    CLC                       ;
                    ADC.b #$01                ;
CODE_03D2F0:        CMP.b #$08                ;
                    BCS   CODE_03D310         ;
                    LDA.b $06                 ;
                    CMP.b #$F0                ;
                    BCS   CODE_03D310         ;
                    LDA.w $03AD               ;
                    CLC                       ;
                    ADC.b #$04                ;
                    STA.b $04                 ;
                    SEC                       ;
                    SBC.b $06                 ;
                    BPL   CODE_03D30C         ;
                    EOR.b #$FF                ;
                    CLC                       ;
                    ADC.b #$01                ;
CODE_03D30C:        CMP.b #$08                ;
                    BCC   CODE_03D324         ;
CODE_03D310:        LDA.b $05                 ;
                    CMP.b #$02                ;
                    BEQ   CODE_03D33D         ;
                    LDY.b $05                 ;
                    LDA.w $0237               ;
                    CLC                       ;
                    ADC.w $D1DF,y             ;
                    INC.b $05                 ;
                    JMP.w CODE_03D2E6         ;

CODE_03D324:        LDX.b #$01                ;
                    LDA.b $04                 ;
                    CMP.b $06                 ;
                    BCS   CODE_03D32D         ;
                    INX                       ;
CODE_03D32D:        TXA                       ;
                    LDX.b $9E                 ;
                    STA.b $47                 ;
                    LDX.b #$00                ;
                    LDA.b $00                 ;
                    PHA                       ;
                    JSR.w CODE_03DF4D         ;
                    PLA                       ;
                    STA.b $00                 ;
CODE_03D33D:        PLA                       ;
                    CLC                       ;
                    ADC.b #$04                ;
                    STA.b $06                 ;
                    LDX.b $9E                 ;
                    RTS                       ;

CODE_03D346:        PHA                       ;
                    AND.b #$0F                ;
                    CMP.b #$09                ;
                    BCC   CODE_03D352         ;
                    EOR.b #$0F                ;
                    CLC                       ;
                    ADC.b #$01                ;
CODE_03D352:        STA.b $01                 ;
                    LDY.b $00                 ;
                    LDA.w $D1D3,y             ;
                    CLC                       ;
                    ADC.b $01                 ;
                    TAY                       ;
                    LDA.w $D16C,y             ;
                    STA.b $01                 ;
                    PLA                       ;
                    PHA                       ;
                    CLC                       ;
                    ADC.b #$08                ;
                    AND.b #$0F                ;
                    CMP.b #$09                ;
                    BCC   CODE_03D372         ;
                    EOR.b #$0F                ;
                    CLC                       ;
                    ADC.b #$01                ;
CODE_03D372:        STA.b $02                 ;
                    LDY.b $00                 ;
                    LDA.w $D1D3,y             ;
                    CLC                       ;
                    ADC.b $02                 ;
                    TAY                       ;
                    LDA.w $D16C,y             ;
                    STA.b $02                 ;
                    PLA                       ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    TAY                       ;
                    LDA.w $D1CF,y             ;
                    STA.b $03                 ;
                    RTS                       ;

                    db $F8,$A0,$70,$BD,$00

                    db $00,$00,$00,$20,$20

CODE_03D397:        LDA.b $29,x               ;0 S:01FF P:EnvMXdIzc HC:0206 VC:000 FC:00 I:00
                    AND.b #$20                ;0 S:01FF P:EnvMXdIzc HC:0222 VC:000 FC:00 I:00
                    BEQ   CODE_03D3A5         ;0 S:01FF P:EnvMXdIzc HC:0238 VC:000 FC:00 I:00
                    LDA.b #$20                ;
                    STA.w $0257,x             ;
                    JMP.w CODE_03C140         ;

CODE_03D3A5:        JSR.w CODE_03C0AD         ;
                    LDY.b #$0D                ;
                    LDA.b #$05                ;
                    JSR.w CODE_03C144         ;
                    LDA.w $043D,x             ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    TAY                       ;
                    LDA.w $0238,x             ;
                    SEC                       ;
                    SBC.w $D38D,y             ;
                    BPL   CODE_03D3C5         ;
                    EOR.b #$FF                ;
                    CLC                       ;
                    ADC.b #$01                ;
CODE_03D3C5:        CMP.b #$08                ;
                    BCS   CODE_03D3D4         ;
                    LDA.w $043D,x             ;
                    CLC                       ;
                    ADC.b #$10                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    TAY                       ;
CODE_03D3D4:        LDA.w $D392,y             ;
                    STA.w $0257,x             ;
                    RTS                       ;

                    db $15,$30,$40

CODE_03D3DE:        LDA.b $29,x               ;\
                    AND.b #$20                ; |If not dying, branch
                    BEQ   CODE_03D3E7         ;/
                    JMP.w CODE_03C113         ;Otherwise, take jump when dying.

CODE_03D3E7:        LDA.b $29,x               ;
                    BEQ   CODE_03D3F4         ;
                    STZ.b $A1,x               ;
                    STZ.w $06CB               ;
                    LDA.b #$10                ;
                    BNE   CODE_03D407         ;
CODE_03D3F4:        LDA.b #$12                ;
                    STA.w $06CB               ;
                    LDY.b #$02                ;
CODE_03D3FB:        LDA.w $D3DB,y             ;
                    STA.w $01,y             ;
                    DEY                       ;
                    BPL   CODE_03D3FB         ;
                    JSR.w CODE_03D420         ;
CODE_03D407:        STA.b $5E,x               ;
                    LDY.b #$01                ;
                    LDA.b $A1,x               ;
                    AND.b #$01                ;
                    BNE   CODE_03D41B         ;
                    LDA.b $5E,x               ;
                    EOR.b #$FF                ;
                    CLC                       ;
                    ADC.b #$01                ;
                    STA.b $5E,x               ;
                    INY                       ;
CODE_03D41B:        STY.b $47,x               ;
                    JMP.w CODE_03C0AD         ;

CODE_03D420:        LDY.b #$00                ;
                    JSR.w CODE_03E8BC         ;
                    BPL   CODE_03D431         ;
                    INY                       ;
                    LDA.b $00                 ;
                    EOR.b #$FF                ;
                    CLC                       ;
                    ADC.b #$01                ;
                    STA.b $00                 ;
CODE_03D431:        LDA.b $00                 ;
                    CMP.b #$3C                ;
                    BCC   CODE_03D453         ;
                    LDA.b #$3C                ;
                    STA.b $00                 ;
                    LDA.b $1C,x               ;
                    CMP.b #$11                ;
                    BNE   CODE_03D453         ;
                    TYA                       ;
                    CMP.b $A1,x               ;
                    BEQ   CODE_03D453         ;
                    LDA.b $A1,x               ;
                    BEQ   CODE_03D450         ;
                    DEC.b $5E,x               ;
                    LDA.b $5E,x               ;
                    BNE   CODE_03D490         ;
CODE_03D450:        TYA                       ;
                    STA.b $A1,x               ;
CODE_03D453:        LDA.b $00                 ;
                    AND.b #$3C                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    STA.b $00                 ;
                    LDY.b #$00                ;
                    LDA.b $5D                 ;
                    BEQ   CODE_03D485         ;
                    LDA.w $0775               ;
                    BEQ   CODE_03D485         ;
                    INY                       ;
                    LDA.b $5D                 ;
                    CMP.b #$19                ;
                    BCC   CODE_03D475         ;
                    LDA.w $0775               ;
                    CMP.b #$02                ;
                    BCC   CODE_03D475         ;
                    INY                       ;
CODE_03D475:        LDA.b $1C,x               ;
                    CMP.b #$12                ;
                    BNE   CODE_03D47F         ;
                    LDA.b $5D                 ;
                    BNE   CODE_03D485         ;
CODE_03D47F:        LDA.b $A1,x               ;
                    BNE   CODE_03D485         ;
                    LDY.b #$00                ;
CODE_03D485:        LDA.w $01,y             ;
                    LDY.b $00                 ;
CODE_03D48A:        SEC                       ;
                    SBC.b #$01                ;
                    DEY                       ;
                    BPL   CODE_03D48A         ;
CODE_03D490:        RTS                       ;

                    db $1A,$58,$98,$96,$94,$92,$90,$8E
                    db $8C,$8A,$88,$86,$84,$82,$80

CODE_03D4A0:        PHX                       ;
                    LDX.w $0369               ;
                    DEX                       ;
                    DEX                       ;
                    STX.w $0334               ;
                    AND.b #$80                ;
                    BEQ   CODE_03D4CE         ;
                    STZ.w $030D,x             ;
                    LDA.b #$01                ;
                    STA.w $0300,x             ;
                    LDA.b $04                 ;
                    AND.b #$1F                ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    STA.b $E4                 ;
                    LDA.b #$00                ;
                    SEC                       ;
                    SBC.b $42                 ;
                    CLC                       ;
                    ADC.b $E4                 ;
                    STA.w $031A,x             ;
                    LDA.b #$03                ;
                    STA.w $0327,x             ;
CODE_03D4CE:        PLX                       ;
                    RTS                       ;

CODE_03D4D0:        LDX.w $0368               ;
                    LDA.b $1C,x               ;
                    CMP.b #$2D                ;
                    BNE   CODE_03D4EA         ;
                    STX.b $9E                 ;
                    LDA.b $29,x               ;
                    BEQ   CODE_03D503         ;
                    AND.b #$40                ;
                    BEQ   CODE_03D4EA         ;
                    LDA.w $0238,x             ;
                    CMP.b #$E0                ;
                    BCC   CODE_03D4FD         ;
CODE_03D4EA:        LDA.w $95               ;
                    BNE   CODE_03D4F7         ;
                    LDA.b #$0B                ;\Toad/Princess saved fanfare music
                    STA.w $1602               ;/
                    STA.w $95               ;
CODE_03D4F7:        INC.w $0772               ;
                    JMP.w CODE_03D56B         ;

CODE_03D4FD:        JSR.w CODE_03C13A         ;
                    JMP.w CODE_03D679         ;

CODE_03D503:        DEC.w $0364               ;
                    BNE   CODE_03D557         ;
                    LDA.b #$04                ;
                    STA.w $0364               ;
                    LDA.w $0363               ;
                    EOR.b #$01                ;
                    STA.w $0363               ;
                    LDA.b #$02                ;
                    STA.b $05                 ;
                    LDY.w $0369               ;
                    LDA.w $D491,y             ;
                    STA.b $04                 ;
                    JSR.w CODE_03D4A0         ;
                    LDY.w $1700               ;
                    INY                       ;
                    LDX.b #$18                ;
                    JSR.w CODE_0393F3         ;
                    LDX.b $9E                 ;
                    JSR.w CODE_0393B2         ;
                    LDA.b #$16                ;
                    STA.w $1603               ;
                    LDA.w $0369               ;
                    BNE   CODE_03D546         ;
                    LDA.b #$08                ;
                    STA.w $014B               ;
                    LDA.b #$FF                ;
                    STA.w $0F4C               ;
CODE_03D546:        INC.w $0369               ;
                    LDA.w $0369               ;
                    CMP.b #$0F                ;
                    BNE   CODE_03D557         ;
                    JSR.w CODE_03C726         ;
                    LDA.b #$40                ;
                    STA.b $29,x               ;
CODE_03D557:        JMP.w CODE_03D679         ;

                    db $21,$41,$11,$31

CODE_03D55E:        LDA.b $29,x               ;
                    AND.b #$20                ;
                    BEQ   CODE_03D579         ;
                    LDA.w $0238,x             ;
                    CMP.b #$E0                ;
                    BCC   CODE_03D4FD         ;
CODE_03D56B:        LDX.b #$08                ;
CODE_03D56D:        JSR.w CODE_03CDE2         ;
                    DEX                       ;
                    BPL   CODE_03D56D         ;
                    STA.w $06CB               ;
                    LDX.b $9E                 ;
                    RTS                       ;

CODE_03D579:        STZ.w $06CB               ;
                    LDA.w $0747               ;
                    BEQ   CODE_03D584         ;
                    JMP.w CODE_03D636         ;

CODE_03D584:        LDA.w $0363               ;
                    BPL   CODE_03D58C         ;
                    JMP.w CODE_03D60B         ;

CODE_03D58C:        DEC.w $0364               ;
                    BNE   CODE_03D59E         ;
                    LDA.b #$20                ;
                    STA.w $0364               ;
                    LDA.w $0363               ;
                    EOR.b #$01                ;
                    STA.w $0363               ;
CODE_03D59E:        LDA.b $09                 ;
                    AND.b #$0F                ;
                    BNE   CODE_03D5A8         ;
                    LDA.b #$02                ;
                    STA.b $47,x               ;
CODE_03D5A8:        LDA.w $0792,x             ;
                    BEQ   CODE_03D5CA         ;
                    JSR.w CODE_03E8BC         ;
                    BPL   CODE_03D5CA         ;
                    LDA.b #$01                ;
                    STA.b $47,x               ;
                    LDA.b #$02                ;
                    STA.w $0365               ;
                    LDA.b #$20                ;
                    STA.w $0792,x             ;
                    STA.w $079C               ;
                    LDA.w $021A,x             ;
                    CMP.b #$B0                ;
                    BCS   CODE_03D60B         ;
CODE_03D5CA:        LDA.b $09                 ;
                    AND.b #$03                ;
                    BNE   CODE_03D60B         ;
                    LDA.w $021A,x             ;
                    CMP.w $0366               ;
                    BNE   CODE_03D5E4         ;
                    LDA.w $07B7,x             ;
                    AND.b #$03                ;
                    TAY                       ;
                    LDA.w $D55A,y             ;
                    STA.w $06DC               ;
CODE_03D5E4:        LDA.w $021A,x             ;
                    CLC                       ;
                    ADC.w $0365               ;
                    STA.w $021A,x             ;
                    LDY.b $47,x               ;
                    CPY.b #$01                ;
                    BEQ   CODE_03D60B         ;
                    LDY.b #$FF                ;
                    SEC                       ;
                    SBC.w $0366               ;
                    BPL   CODE_03D603         ;
                    EOR.b #$FF                ;
                    CLC                       ;
                    ADC.b #$01                ;
                    LDY.b #$01                ;
CODE_03D603:        CMP.w $06DC               ;
                    BCC   CODE_03D60B         ;
                    STY.w $0365               ;
CODE_03D60B:        LDA.w $0792,x             ;
                    BNE   CODE_03D639         ;
                    JSR.w CODE_03C13A         ;
                    LDA.w $075F               ;
                    CMP.b #$05                ;
                    BCC   CODE_03D623         ;
                    LDA.b $09                 ;
                    AND.b #$03                ;
                    BNE   CODE_03D623         ;
                    JSR.w CODE_03BB8E         ;
CODE_03D623:        LDA.w $0238,x             ;
                    CMP.b #$80                ;
                    BCC   CODE_03D647         ;
                    LDA.w $07B7,x             ;
                    AND.b #$03                ;
                    TAY                       ;
                    LDA.w $D55A,y             ;
                    STA.w $0792,x             ;
CODE_03D636:        JMP.w CODE_03D647         ;

CODE_03D639:        CMP.b #$01                ;
                    BNE   CODE_03D647         ;
                    DEC.w $0238,x             ;
                    JSR.w CODE_03C726         ;
                    LDA.b #$FE                ;
                    STA.b $A1,x               ;
CODE_03D647:        LDA.w $075F               ;
                    CMP.b #$07                ;
                    BEQ   CODE_03D652         ;
                    CMP.b #$05                ;
                    BCS   CODE_03D679         ;
CODE_03D652:        LDA.w $079C               ;
                    BNE   CODE_03D679         ;
                    LDA.b #$20                ;
                    STA.w $079C               ;
                    LDA.w $0363               ;
                    EOR.b #$80                ;
                    STA.w $0363               ;
                    BMI   CODE_03D647         ;
                    JSR.w CODE_03D6F9         ;Get timer delay of next fireball spawn
                    LDY.w $06CC               ;\If hard mode (after 5-3)
                    BEQ   CODE_03D671         ; |
                    SEC                       ; |Timer -= #$10;
                    SBC.b #$10                ; |
CODE_03D671:        STA.w $079C               ;/ store into time until next sprite gets generated
                    LDA.b #$15                ;\Activate bowser fire generator
                    STA.w $06CB               ;/
CODE_03D679:        JSR.w CODE_03D6D4         ;
                    LDY.b #$10                ;
                    LDA.b $47,x               ;
                    LSR   A                   ;
                    BCC   CODE_03D685         ;
                    LDY.b #$F0                ;
CODE_03D685:        TYA                       ;
                    CLC                       ;
                    ADC.w $021A,x             ;
                    LDY.w $06CF               ;
                    STA.w $021A,y             ;
                    LDA.w $0238,x             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0238,y             ;
                    LDA.b $29,x               ;
                    STA.w $29,y             ;
                    LDA.b $47,x               ;
                    STA.w $47,y             ;
                    LDA.b $9E                 ;
                    PHA                       ;
                    LDX.w $06CF               ;
                    STX.b $9E                 ;
                    LDA.b $97                 ;
                    BNE   CODE_03D6C1         ;
                    LDA.w $075F               ;\
                    CMP.b #$07                ; |Play real bowser battle music at world 8
                    BNE   CODE_03D6BA         ;/
                    LDA.b #$05                ;"real" bowser battle music
                    BRA   CODE_03D6BC         ;

CODE_03D6BA:        LDA.b #$04                ;\"fake" bowser battle music
CODE_03D6BC:        STA.w $1602               ;/
                    STA.b $97                 ;
CODE_03D6C1:        LDA.b #$2D                ;
                    STA.b $1C,x               ;
                    LDA.b #$20                ;
                    STA.w $0257,x             ;
                    PLA                       ;
                    STA.b $9E                 ;
                    TAX                       ;
                    LDA.b #$00                ;
                    STA.w $036A               ;
CODE_03D6D3:        RTS                       ;

CODE_03D6D4:        INC.w $036A               ;
                    JSR.w CODE_03CD09         ;
                    LDA.b $29,x               ;
                    BNE   CODE_03D6D3         ;
                    LDA.b #$0A                ;
                    STA.w $0490,x             ;
                    JSR.w CODE_03E9CC         ;
                    LDA.w $0770               ;
                    CMP.b #$02                ;
                    BEQ   CODE_03D6F0         ;
                    JMP.w CODE_03DE55         ;

CODE_03D6F0:        RTS                       ;

                    db $BF,$40,$BF,$BF,$BF,$40,$40,$BF      ;How fast the bowser fire generates.

CODE_03D6F9:        LDY.w $0367               ;\
                    INC.w $0367               ; |Get timer delay of next fireball spawn
                    LDA.w $0367               ; |Returns: Timer delay in A
                    AND.b #$07                ; |
                    STA.w $0367               ; |
                    LDA.w $D6F1,y             ; |
CODE_03D70A:        RTS                       ;/

CODE_03D70B:        CPX.w $0F4D               ;
                    BNE   CODE_03D71C         ;
                    LDA.w $0F4C               ;
                    BEQ   CODE_03D71C         ;
                    LDA.w $014B               ;
                    CMP.b #$06                ;
                    BEQ   CODE_03D760         ;
CODE_03D71C:        LDA.w $0747               ;
                    BNE   CODE_03D755         ;
                    LDA.b #$40                ;
                    LDY.w $06CC               ;
                    BEQ   CODE_03D72A         ;
                    LDA.b #$60                ;
CODE_03D72A:        STA.b $00                 ;
                    LDA.w $0402,x             ;
                    SEC                       ;
                    SBC.b $00                 ;
                    STA.w $0402,x             ;
                    LDA.w $021A,x             ;
                    SBC.b #$01                ;
                    STA.w $021A,x             ;
                    LDA.b $79,x               ;
                    SBC.b #$00                ;
                    STA.b $79,x               ;
                    LDY.w $041D,x             ;
                    LDA.w $0238,x             ;
                    CMP.w $C970,y             ;Compare with possible bowser fireball Y positions
                    BEQ   CODE_03D755         ;
                    CLC                       ;
                    ADC.w $043D,x             ;
                    STA.w $0238,x             ;
CODE_03D755:        JSR.w CODE_03FD39         ;
                    LDA.b $29,x               ;
                    BNE   CODE_03D70A         ;
                    JSL.l CODE_05CD01         ;
CODE_03D760:        RTS                       ;

CODE_03D761:        DEC.b $A1,x               ;
                    BNE   CODE_03D77C         ;
                    LDA.b #$08                ;
                    STA.b $A1,x               ;
                    INC.b $5E,x               ;
                    LDA.b $5E,x               ;
                    CMP.b #$01                ;
                    BNE   CODE_03D778         ;
                    LDA.b #$29                ;\
                    STA.w $1600               ;/Firework sound
                    BRA   CODE_03D77C         ;

CODE_03D778:        CMP.b #$04                ;
                    BCS   CODE_03D794         ;
CODE_03D77C:        JSR.w CODE_03FD39         ;
                    LDA.w $03B9               ;
                    STA.w $03BA               ;
                    LDA.w $03AE               ;
                    STA.w $03AF               ;
                    LDY.w $0B46,x             ;
                    LDA.b $5E,x               ;
                    JSR.w CODE_03F548         ;
                    RTS                       ;

CODE_03D794:        STZ.b $10,x               ;
                    LDY.w $0B46,x             ;
                    LDA.b #$03                ;
                    STA.w $0D00,y             ;
                    STA.w $0D04,y             ;
                    STA.w $0D08,y             ;
                    STA.w $0D0C,y             ;
                    LDA.b #$05                ;
                    STA.w $0149               ;
                    JMP.w CODE_03D818         ;

CODE_03D7AF:        STZ.w $06CB               ;
                    LDA.w $0746               ;
                    CMP.b #$05                ;
                    BCS   CODE_03D7F3         ;
                    JSR.w CODE_039B08         ;This JSR has a destructive return

                    dw CODE_03D7F3            ;00 - Nothing
                    dw CODE_03D7C6            ;01 -
                    dw CODE_03D7FE            ;02 -
                    dw CODE_03D830            ;03 -
                    dw CODE_03D883             ;04 -

CODE_03D7C6:        LDY.b #$05                ;
                    LDA.w $07EB               ;
                    CMP.b #$01                ;
                    BEQ   CODE_03D7DD         ;
                    LDY.b #$03                ;
                    CMP.b #$03                ;
                    BEQ   CODE_03D7DD         ;
                    LDY.b #$00                ;
                    CMP.b #$06                ;
                    BEQ   CODE_03D7DD         ;
                    LDA.b #$FF                ;
CODE_03D7DD:        STA.w $06D7               ;
                    STY.b $29,x               ;
                    LDA.w $2143               ;
                    AND.b #$7F                ;
                    CMP.b #$4B                ;
                    BEQ   CODE_03D7F0         ;
                    LDA.b #$4B                ;
                    STA.w $1603               ;
CODE_03D7F0:        INC.w $0746               ;
CODE_03D7F3:        RTS                       ;

CODE_03D7F4:        LDA.b #$4C                ;
                    STA.w $1603               ;
                    STA.w $0E1A               ;
                    BRA   CODE_03D7F0         ;

CODE_03D7FE:        LDA.w $07E9               ;
                    ORA.w $07EA               ;
                    ORA.w $07EB               ;
                    BEQ   CODE_03D7F4         ;
CODE_03D809:        LDY.b #$23                ;
                    LDA.b #$FF                ;
                    STA.w $014A               ;
                    JSR.w CODE_039CF9         ;
                    LDA.b #$05                ;
                    STA.w $014A               ;
CODE_03D818:        LDY.b #$0B                ;
                    LDA.w $0753               ;
                    BEQ   CODE_03D821         ;
                    LDY.b #$11                ;
CODE_03D821:        JSR.w CODE_039CF9         ;
                    LDA.w $0753               ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ORA.b #$04                ;
                    JMP.w CODE_03BD64         ;

CODE_03D830:        LDA.b #$01                ;
                    STA.b $1B                 ;
                    LDA.w $0238,x             ;
                    CMP.b #$72                ;
                    BCC   CODE_03D840         ;
                    DEC.w $0238,x             ;
                    BRA   CODE_03D84C         ;

CODE_03D840:        LDA.w $06D7               ;
                    BEQ   CODE_03D877         ;
                    BMI   CODE_03D877         ;
                    LDA.b #$16                ;
                    STA.w $06CB               ;
CODE_03D84C:        JSR.w CODE_03FD39         ;
                    LDY.w $0B46,x             ;
                    LDA.w $03B9               ;
                    STA.w $0901,y             ;
                    LDA.b $09                 ;
                    AND.b #$18                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    CLC                       ;
                    ADC.b #$04                ;
                    STA.w $0902,y             ;
                    LDA.b #$0B                ;
                    STA.w $0903,y             ;
                    LDA.w $03AE               ;
                    STA.w $0900,y             ;
                    LDA.b #$02                ;
                    STA.w $0D00,y             ;
                    LDX.b $9E                 ;
                    RTS                       ;

CODE_03D877:        JSR.w CODE_03D84C         ;
                    LDA.b #$06                ;
                    STA.w $07A2,x             ;
CODE_03D87F:        INC.w $0746               ;
                    RTS                       ;

CODE_03D883:        JSR.w CODE_03D84C         ;
                    LDA.w $07A2,x             ;
                    BNE   CODE_03D890         ;
                    LDA.w $07B1               ;
                    BEQ   CODE_03D87F         ;
CODE_03D890:        RTS                       ;

CODE_03D891:        LDA.b $29,x               ;
                    BNE   CODE_03D8EB         ;
                    LDA.w $0792,x             ;
                    BNE   CODE_03D8EB         ;
                    LDA.b $A1,x               ;
                    BNE   CODE_03D8C1         ;
                    LDA.b $5E,x               ;
                    BMI   CODE_03D8B6         ;
                    JSR.w CODE_03E8BC         ;
                    BPL   CODE_03D8B0         ;
                    LDA.b $00                 ;
                    EOR.b #$FF                ;
                    CLC                       ;
                    ADC.b #$01                ;
                    STA.b $00                 ;
CODE_03D8B0:        LDA.b $00                 ;
                    CMP.b #$21                ;
                    BCC   CODE_03D8EB         ;
CODE_03D8B6:        LDA.b $5E,x               ;
                    EOR.b #$FF                ;
                    CLC                       ;
                    ADC.b #$01                ;
                    STA.b $5E,x               ;
                    INC.b $A1,x               ;
CODE_03D8C1:        LDA.w $043D,x             ;
                    LDY.b $5E,x               ;
                    BPL   CODE_03D8CB         ;
                    LDA.w $041D,x             ;
CODE_03D8CB:        STA.b $00                 ;
                    LDA.b $09                 ;
                    LSR   A                   ;
                    BCC   CODE_03D8EB         ;
                    LDA.w $0747               ;
                    BNE   CODE_03D8EB         ;
                    LDA.w $0238,x             ;
                    CLC                       ;
                    ADC.b $5E,x               ;
                    STA.w $0238,x             ;
                    CMP.b $00                 ;
                    BNE   CODE_03D8EB         ;
                    STZ.b $A1,x               ;
                    LDA.b #$40                ;
                    STA.w $0792,x             ;
CODE_03D8EB:        LDA.b #$00                ;
                    STA.w $0257,x             ;
                    RTS                       ;

CODE_03D8F1:        STA.b $07                 ;
                    LDA.w $0203,x             ;
                    BNE   CODE_03D906         ;
                    LDY.b #$18                ;
                    LDA.b $5E,x               ;
                    CLC                       ;
                    ADC.b $07                 ;
                    STA.b $5E,x               ;
                    LDA.b $A1,x               ;
                    ADC.b #$00                ;
                    RTS                       ;

CODE_03D906:        LDY.b #$08                ;
                    LDA.b $5E,x               ;
                    SEC                       ;
                    SBC.b $07                 ;
                    STA.b $5E,x               ;
                    LDA.b $A1,x               ;
                    SBC.b #$00                ;
                    RTS                       ;

CODE_03D914:        LDA.b $BC,x               ;Lift (balance) movement code
                    CMP.b #$03                ;
                    BNE   CODE_03D91D         ;
                    JMP.w CODE_03CDE2         ;

CODE_03D91D:        LDA.b $29,x               ;
                    BPL   CODE_03D922         ;
                    RTS                       ;

CODE_03D922:        TAY                       ;
                    LDA.w $03A2,x             ;
                    STA.b $00                 ;
                    LDA.b $47,x               ;
                    BEQ   CODE_03D92F         ;
                    JMP.w CODE_03DB3A         ;

CODE_03D92F:        LDA.b #$2D                ;
                    CMP.w $0238,x             ;
                    BCC   CODE_03D946         ;
                    CPY.b $00                 ;
                    BEQ   CODE_03D943         ;
                    CLC                       ;
                    ADC.b #$02                ;
                    STA.w $0238,x             ;
                    JMP.w CODE_03DB30         ;

CODE_03D943:        JMP.w CODE_03DB17         ;

CODE_03D946:        CMP.w $0238,y             ;
                    BCC   CODE_03D958         ;
                    CPX.b $00                 ;
                    BEQ   CODE_03D943         ;
                    CLC                       ;
                    ADC.b #$02                ;
                    STA.w $0238,y             ;
                    JMP.w CODE_03DB30         ;

CODE_03D958:        LDA.w $0238,x             ;
                    PHA                       ;
                    LDA.w $03A2,x             ;
                    BPL   CODE_03D979         ;
                    LDA.w $043D,x             ;
                    CLC                       ;
                    ADC.b #$05                ;
                    STA.b $00                 ;
                    LDA.b $A1,x               ;
                    ADC.b #$00                ;
                    BMI   CODE_03D989         ;
                    BNE   CODE_03D97D         ;
                    LDA.b $00                 ;
                    CMP.b #$0B                ;
                    BCC   CODE_03D983         ;
                    BCS   CODE_03D97D         ;
CODE_03D979:        CMP.b $9E                 ;
                    BEQ   CODE_03D989         ;
CODE_03D97D:        JSR.w CODE_03C167         ;
                    JMP.w CODE_03D98C         ;

CODE_03D983:        JSR.w CODE_03DB30         ;
                    JMP.w CODE_03D98C         ;

CODE_03D989:        JSR.w CODE_03C163         ;
CODE_03D98C:        LDY.b $29,x               ;
                    PLA                       ;
                    SEC                       ;
                    SBC.w $0238,x             ;
                    CLC                       ;
                    ADC.w $0238,y             ;
                    STA.w $0238,y             ;
                    LDA.w $03A2,x             ;
                    BMI   CODE_03D9A3         ;
                    TAX                       ;
                    JSR.w CODE_03E2CB         ;
CODE_03D9A3:        LDY.b $9E                 ;
                    LDA.w $A1,y             ;
                    ORA.w $043D,y             ;
                    BNE   CODE_03D9B0         ;
                    JMP.w CODE_03DABF         ;

CODE_03D9B0:        LDA.w $A1,y             ;
                    PHA                       ;
                    PHA                       ;
                    PHA                       ;
                    JSR.w CODE_03DAC2         ;
                    LDA.b $42                 ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    STA.b $F3                 ;
                    LDA.b $43                 ;
                    AND.b #$01                ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ORA.b #$20                ;
                    STA.b $F4                 ;
                    LDA.b $F3                 ;
                    CLC                       ;
                    ADC.b #$1F                ;
                    TAX                       ;
                    AND.b #$1F                ;
                    STA.b $F5                 ;
                    TXA                       ;
                    AND.b #$20                ;
                    BEQ   CODE_03D9DF         ;
                    LDA.b $F4                 ;
                    EOR.b #$04                ;
                    STA.b $F6                 ;
CODE_03D9DF:        REP   #$30                ;
                    LDA.b $00                 ;
                    AND.w #$241F              ;
                    CMP.b $F3                 ;
                    BCS   CODE_03D9F1         ;
                    CMP.b $F5                 ;
                    BCC   CODE_03D9F1         ;
                    JMP.w CODE_03DA4A         ;

CODE_03D9F1:        TYA                       ;
                    AND.w #$00FF              ;
                    TAY                       ;
                    LDX.w $1700               ;
                    LDA.b $00                 ;
                    AND.w #$1FFF              ;
                    XBA                       ;
                    STA.w $1702,x             ;
                    LDA.w #$0300              ;
                    STA.w $1704,x             ;
                    LDA.w $A1,y             ;
                    AND.w #$0080              ;
                    BNE   CODE_03DA33         ;
                    LDA.w $1702,x             ;
                    AND.w #$F003              ;
                    CMP.w #$A000              ;
                    BEQ   CODE_03DA20         ;
                    CMP.w #$B000              ;
                    BNE   CODE_03DA25         ;
CODE_03DA20:        LDA.w #$185C              ;
                    BRA   CODE_03DA28         ;

CODE_03DA25:        LDA.w #$10A2              ;
CODE_03DA28:        STA.w $1706,x             ;
                    LDA.w #$18A3              ;
                    STA.w $1708,x             ;
                    BRA   CODE_03DA3C         ;

CODE_03DA33:        LDA.w #$0024              ;
                    STA.w $1706,x             ;
                    STA.w $1708,x             ;
CODE_03DA3C:        LDA.w #$FFFF              ;
                    STA.w $170A,x             ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0008              ;
                    STA.w $1700               ;
CODE_03DA4A:        SEP   #$30                ;
                    LDA.w $29,y             ;
                    TAY                       ;
                    PLA                       ;
                    EOR.b #$FF                ;
                    JSR.w CODE_03DAC2         ;
                    REP   #$30                ;
                    LDA.b $00                 ;
                    AND.w #$241F              ;
                    CMP.b $F3                 ;
                    BCS   CODE_03DA68         ;
                    CMP.b $F5                 ;
                    BCC   CODE_03DA68         ;
                    JMP.w CODE_03DABC         ;

CODE_03DA68:        LDX.w $1700               ;
                    LDA.b $00                 ;
                    AND.w #$1FFF              ;
                    XBA                       ;
                    STA.w $1702,x             ;
                    LDA.w #$0300              ;
                    STA.w $1704,x             ;
                    PLA                       ;
                    AND.w #$0080              ;
                    BEQ   CODE_03DAA3         ;
                    LDA.w #$10A2              ;
                    STA.w $1706,x             ;
                    LDA.w $1702,x             ;
                    AND.w #$F003              ;
                    CMP.w #$A000              ;
                    BEQ   CODE_03DA96         ;
                    CMP.w #$B000              ;
                    BNE   CODE_03DA9B         ;
CODE_03DA96:        LDA.w #$183F              ;
                    BRA   CODE_03DA9E         ;

CODE_03DA9B:        LDA.w #$18A3              ;
CODE_03DA9E:        STA.w $1708,x             ;
                    BRA   CODE_03DAAC         ;

CODE_03DAA3:        LDA.w #$0024              ;
                    STA.w $1706,x             ;
                    STA.w $1708,x             ;
CODE_03DAAC:        LDA.w #$FFFF              ;
                    STA.w $170A,x             ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0008              ;
                    STA.w $1700               ;
                    BRA   CODE_03DABD         ;

CODE_03DABC:        PLA                       ;
CODE_03DABD:        SEP   #$30                ;
CODE_03DABF:        LDX.b $9E                 ;
                    RTS                       ;

CODE_03DAC2:        PHA                       ;
                    LDA.w $021A,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    LDX.w $06CC               ;
                    BNE   CODE_03DAD1         ;
                    CLC                       ;
                    ADC.b #$10                ;
CODE_03DAD1:        PHA                       ;
                    LDA.w $79,y             ;
                    ADC.b #$00                ;
                    STA.b $02                 ;
                    PLA                       ;
                    AND.b #$F0                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    STA.b $00                 ;
                    LDX.w $0238,y             ;
                    PLA                       ;
                    BPL   CODE_03DAEC         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.b #$08                ;
                    TAX                       ;
CODE_03DAEC:        TXA                       ;
                    ASL   A                   ;
                    ROL   A                   ;
                    PHA                       ;
                    ROL   A                   ;
                    AND.b #$03                ;
                    ORA.b #$20                ;
                    STA.b $01                 ;
                    LDA.b $02                 ;
                    AND.b #$01                ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ORA.b $01                 ;
                    STA.b $01                 ;
                    PLA                       ;
                    AND.b #$E0                ;
                    CLC                       ;
                    ADC.b $00                 ;
                    STA.b $00                 ;
                    LDA.w $0238,y             ;
                    CMP.b #$E8                ;
                    BCC   CODE_03DB16         ;
                    LDA.b $00                 ;
                    AND.b #$BF                ;
                    STA.b $00                 ;
CODE_03DB16:        RTS                       ;

CODE_03DB17:        TYX                       ;
                    JSR.w CODE_03FDCB         ;
                    LDA.b #$06                ;
                    JSR.w CODE_03E07E         ;
                    LDA.w $03AD               ;
                    STA.w $011A,x             ;
                    LDA.w $0237               ;
                    STA.w $0124,x             ;
                    LDA.b #$01                ;
                    STA.b $47,x               ;
CODE_03DB30:        JSR.w CODE_03C726         ;
                    STA.w $A1,y             ;
                    STA.w $043D,y             ;
                    RTS                       ;

CODE_03DB3A:        PHY                       ;
                    JSR.w CODE_03C11B         ;
                    PLX                       ;
                    LDA.b $29,x               ;
                    BPL   CODE_03DB46         ;
                    JSR.w CODE_03C11B         ;
CODE_03DB46:        LDX.b $9E                 ;
                    LDA.w $03A2,x             ;
                    BMI   CODE_03DB51         ;
                    TAX                       ;
                    JSR.w CODE_03E2CB         ;
CODE_03DB51:        LDX.b $9E                 ;
                    RTS                       ;

CODE_03DB54:        LDA.b $A1,x               ;
                    ORA.w $043D,x             ;
                    BNE   CODE_03DB71         ;
                    STA.w $041D,x             ;
                    LDA.w $0238,x             ;
                    CMP.w $0402,x             ;
                    BCS   CODE_03DB71         ;
                    LDA.b $09                 ;
                    AND.b #$07                ;
                    BNE   CODE_03DB6F         ;
                    INC.w $0238,x             ;
CODE_03DB6F:        BRA   CODE_03DB81         ;

CODE_03DB71:        LDA.w $0238,x             ;
                    CMP.b $5E,x               ;
                    BCC   CODE_03DB7E         ;
                    JSR.w CODE_03C167         ;
                    JMP.w CODE_03DB81         ;

CODE_03DB7E:        JSR.w CODE_03C163         ;
CODE_03DB81:        LDA.w $03A2,x             ;
                    BMI   CODE_03DB89         ;
                    JSR.w CODE_03E2CB         ;
CODE_03DB89:        RTS                       ;

CODE_03DB8A:        LDA.b #$0E                ;
                    JSR.w CODE_03CFDD         ;
                    JSR.w CODE_03CFFC         ;
                    LDA.w $03A2,x             ;
                    BMI   CODE_03DBB4         ;
CODE_03DB97:        LDA.w $0219               ;
                    CLC                       ;
                    ADC.b $00                 ;
                    STA.w $0219               ;
                    LDA.b $78                 ;
                    LDY.b $00                 ;
                    BMI   CODE_03DBAA         ;
                    ADC.b #$00                ;
                    BRA   CODE_03DBAC         ;

CODE_03DBAA:        SBC.b #$00                ;
CODE_03DBAC:        STA.b $78                 ;
                    STY.w $03A1               ;
                    JSR.w CODE_03E2CB         ;
CODE_03DBB4:        RTS                       ;

CODE_03DBB5:        LDA.w $03A2,x             ;
                    BMI   CODE_03DBC0         ;
                    JSR.w CODE_03C136         ;
                    JSR.w CODE_03E2CB         ;
CODE_03DBC0:        RTS                       ;

CODE_03DBC1:        JSR.w CODE_03C0AD         ;
                    STA.b $00                 ;
                    LDA.w $03A2,x             ;
                    BMI   CODE_03DBD2         ;
                    LDA.b #$10                ;
                    STA.b $5E,x               ;
                    JSR.w CODE_03DB97         ;
CODE_03DBD2:        RTS                       ;

CODE_03DBD3:        JSR.w CODE_03DBDE         ;
                    JMP.w CODE_03DB81         ;

CODE_03DBD9:        JSR.w CODE_03DBDE         ;
                    BRA   CODE_03DBF6         ;

CODE_03DBDE:        LDA.w $0747               ;
                    BNE   CODE_03DC02         ;
                    LDA.w $041D,x             ;
                    CLC                       ;
                    ADC.w $043D,x             ;
                    STA.w $041D,x             ;
                    LDA.w $0238,x             ;
                    ADC.b $A1,x               ;
                    STA.w $0238,x             ;
                    RTS                       ;

CODE_03DBF6:        LDA.w $03A2,x             ;
                    BEQ   CODE_03DC02         ;
                    CMP.b #$FF                ;
                    BEQ   CODE_03DC02         ;
                    JSR.w CODE_03E2BC         ;
CODE_03DC02:        RTS                       ;

CODE_03DC03:        LDA.b $1C,x               ;
                    CMP.b #$14                ;
                    BEQ   CODE_03DC61         ;
                    LDA.w $071C               ;
                    LDY.b $1C,x               ;
                    CPY.b #$05                ;
                    BEQ   CODE_03DC16         ;
                    CPY.b #$0D                ;
                    BNE   CODE_03DC18         ;
CODE_03DC16:        ADC.b #$38                ;
CODE_03DC18:        SBC.b #$48                ;
                    STA.b $01                 ;
                    LDA.w $071A               ;
                    SBC.b #$00                ;
                    STA.b $00                 ;
                    LDA.w $071D               ;
                    CLC                       ;
                    ADC.b #$48                ;
                    STA.b $03                 ;
                    LDA.w $071B               ;
                    ADC.b #$00                ;
                    STA.b $02                 ;
                    LDA.w $021A,x             ;
                    CMP.b $01                 ;
                    LDA.b $79,x               ;
                    SBC.b $00                 ;
                    BMI   CODE_03DC5E         ;
                    LDA.w $021A,x             ;
                    CMP.b $03                 ;
                    LDA.b $79,x               ;
                    SBC.b $02                 ;
                    BMI   CODE_03DC61         ;
                    LDA.b $29,x               ;
                    CMP.b #$05                ;
                    BEQ   CODE_03DC61         ;
                    CPY.b #$0D                ;
                    BEQ   CODE_03DC61         ;
                    CPY.b #$30                ;
                    BEQ   CODE_03DC61         ;
                    CPY.b #$31                ;
                    BEQ   CODE_03DC61         ;
                    CPY.b #$32                ;
                    BEQ   CODE_03DC61         ;
CODE_03DC5E:        JSR.w CODE_03CDE2         ;
CODE_03DC61:        RTS                       ;

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF          ;looks like empty space
                    db $FF,$FF,$FF,$FF,$FF,$FF

CODE_03DC70:        LDA.b $33,x               ;
                    BEQ   CODE_03DCCA         ;
                    ASL   A                   ;
                    BCS   CODE_03DCCA         ;
                    LDA.b $09                 ;
                    LSR   A                   ;
                    BCS   CODE_03DCCA         ;
                    TXA                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.b #$2C                ;
                    TAY                       ;
                    LDX.b #$08                ;
CODE_03DC85:        STX.b $01                 ;
                    TYA                       ;
                    PHA                       ;
                    LDA.b $29,x               ;
                    AND.b #$20                ;
                    BNE   CODE_03DCC3         ;
                    LDA.b $10,x               ;
                    BEQ   CODE_03DCC3         ;
                    LDA.b $1C,x               ;
                    CMP.b #$24                ;
                    BCC   CODE_03DC9D         ;
                    CMP.b #$2B                ;
                    BCC   CODE_03DCC3         ;
CODE_03DC9D:        CMP.b #$06                ;
                    BNE   CODE_03DCA7         ;
                    LDA.b $29,x               ;
                    CMP.b #$02                ;
                    BCS   CODE_03DCC3         ;
CODE_03DCA7:        LDA.w $03D9,x             ;
                    BNE   CODE_03DCC3         ;
                    TXA                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.b #$04                ;
                    TAX                       ;
                    JSR.w CODE_03EAB9         ;
                    LDX.b $9E                 ;
                    BCC   CODE_03DCC3         ;
                    LDA.b #$80                ;
                    STA.b $33,x               ;
                    LDX.b $01                 ;
                    JSR.w CODE_03DCD5         ;
CODE_03DCC3:        PLA                       ;
                    TAY                       ;
                    LDX.b $01                 ;
                    DEX                       ;
                    BPL   CODE_03DC85         ;
CODE_03DCCA:        LDX.b $9E                 ;
                    RTS                       ;

                    db $06,$00,$02,$12,$11,$07,$05,$2D

CODE_03DCD5:        JSR.w CODE_03FD39         ;
                    LDA.b #$03                ;
                    STA.w $1600               ;
                    LDX.b $01                 ;
                    LDA.b $10,x               ;
                    BPL   CODE_03DCEE         ;
                    AND.b #$0F                ;
                    TAX                       ;
                    LDA.b $1C,x               ;
                    CMP.b #$2D                ;
                    BEQ   CODE_03DCFB         ;
                    LDX.b $01                 ;
CODE_03DCEE:        LDA.b $1C,x               ;
                    CMP.b #$02                ;
                    BNE   CODE_03DCF7         ;
                    JMP.w CODE_03DDBD         ;

CODE_03DCF7:        CMP.b #$2D                ;
                    BNE   CODE_03DD75         ;
CODE_03DCFB:        LDA.b #$08                ;
                    STA.w $014B               ;
                    LDA.b #$18                ;
                    STA.w $0F4C               ;
                    DEC.w $0283               ;
                    BEQ   CODE_03DD1F         ;
                    LDA.w $0283               ;
                    CMP.b #$01                ;
                    BEQ   CODE_03DD14         ;
                    JMP.w CODE_03DDBD         ;

CODE_03DD14:        STZ.w $03CA               ;
                    LDA.b #$01                ;
                    STA.w $03CB               ;
                    JMP.w CODE_03DDBD         ;

CODE_03DD1F:        LDA.b #$08                ;
                    STA.w $014B               ;
                    LDA.b #$FF                ;
                    STA.w $0F4C               ;
                    JSR.w CODE_03C726         ;
                    STA.b $5E,x               ;
                    STA.w $06CB               ;
                    LDA.b #$FE                ;
                    STA.b $A1,x               ;
                    LDY.w $075F               ;
                    LDA.w $DCCD,y             ;
                    STA.b $1C,x               ;
                    STX.w $02FC               ;
                    INC.w $02FC               ;
                    CMP.b #$2D                ;
                    BEQ   CODE_03DD65         ;
                    PHX                       ;
                    LDA.b $DB                 ;
                    CMP.b #$21                ;
                    BEQ   CODE_03DD64         ;
                    STX.w $0077               ;
                    INC.w $0077               ;
                    LDX.b #$08                ;
CODE_03DD56:        LDA.b $1C,x               ;
                    DEX                       ;
                    BMI   CODE_03DD64         ;
                    CMP.b #$2D                ;
                    BNE   CODE_03DD56         ;
                    INX                       ;
                    STZ.b $10,x               ;
                    STZ.b $1C,x               ;
CODE_03DD64:        PLX                       ;
CODE_03DD65:        LDA.b #$20                ;
                    CPY.b #$03                ;
                    BCS   CODE_03DD6D         ;
                    ORA.b #$03                ;
CODE_03DD6D:        STA.b $29,x               ;
                    LDX.b $01                 ;
                    LDA.b #$09                ;
                    BNE   CODE_03DDAA         ;
CODE_03DD75:        CMP.b #$08                ;
                    BEQ   CODE_03DDBD         ;
                    CMP.b #$0C                ;
                    BEQ   CODE_03DDBD         ;
                    CMP.b #$15                ;
                    BCS   CODE_03DDBD         ;
CODE_03DD81:        LDA.b $1C,x               ;
                    CMP.b #$0D                ;
                    BNE   CODE_03DD8F         ;
                    LDA.w $0238,x             ;
                    ADC.b #$18                ;
                    STA.w $0238,x             ;
CODE_03DD8F:        JSR.w CODE_03E789         ;
                    LDA.b $29,x               ;
                    AND.b #$1F                ;
                    ORA.b #$20                ;
                    STA.b $29,x               ;
                    LDA.b #$02                ;
                    LDY.b $1C,x               ;
                    CPY.b #$05                ;
                    BNE   CODE_03DDA4         ;
                    LDA.b #$06                ;
CODE_03DDA4:        CPY.b #$06                ;
                    BNE   CODE_03DDAA         ;
                    LDA.b #$01                ;
CODE_03DDAA:        JSR.w CODE_03E07E         ;
                    LDA.w $1600               ;
                    CMP.b #$03                ;
                    BEQ   CODE_03DDBD         ;
                    LDA.b #$03                ;
                    STA.w $1600               ;
                    JSL.l CODE_05D2B1         ;
CODE_03DDBD:        RTS                       ;

CODE_03DDBE:        LDA.b $09                 ;
                    LSR   A                   ;
                    BCC   CODE_03DDF9         ;
                    LDA.w $0747               ;
                    ORA.w $03D6               ;
                    BNE   CODE_03DDF9         ;
                    TXA                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.b #$34                ;
                    TAY                       ;
                    JSR.w CODE_03EAB7         ;
                    LDX.b $9E                 ;
                    BCC   CODE_03DDF4         ;
                    LDA.w $06BE,x             ;
                    BNE   CODE_03DDF9         ;
                    LDA.b #$01                ;
                    STA.w $06BE,x             ;
                    LDA.b $6E,x               ;
                    EOR.b #$FF                ;
                    CLC                       ;
                    ADC.b #$01                ;
                    STA.b $6E,x               ;
                    LDA.w $07AF               ;
                    BNE   CODE_03DDF9         ;
                    JMP.w CODE_03DF4D         ;

CODE_03DDF4:        LDA.b #$00                ;
                    STA.w $06BE,x             ;
CODE_03DDF9:        RTS                       ;

CODE_03DDFA:        JSR.w CODE_03CDE5         ;
                    LDA.b #$06                ;
                    JSR.w CODE_03E04F         ;
                    LDA.b #$0A                ;\You got power-up sound
                    STA.w $1600               ;/
                    LDA.w $020C               ;\ If you obtained a mushroom or fire-flower
                    CMP.b #$02                ; |skip this code (to another code)
                    BCC   CODE_03DE1D         ; |
                    CMP.b #$03                ; |If you got a 1-up
                    BEQ   CODE_03DE37         ;/ skip this code (to another code)
                    LDA.b #$23                ;\ Otherwise enable star-man stuff.
                    STA.w $07AF               ; |You got the star power-up music.
                    LDA.b #$0D                ; |Set the timer of the star-man power-up.
                    STA.w $1602               ;/
                    RTS                       ;Return

CODE_03DE1D:        LDA.w $0756               ;\If you got a mushroom go branch
                    BEQ   CODE_03DE42         ;/
                    CMP.b #$01                ;If it is NOT fire-flower, return
                    BNE   CODE_03DE4E         ;useless check, the only values can be $00-$01
                    LDX.b $9E                 ;
                    LDA.b #$02                ;\Set fire-flower power-up
                    STA.w $0756               ;/
                    JSL.l CODE_049A88         ;
                    LDX.b $9E                 ;Get sprite index
                    LDA.b #$0C                ;Set "fire-flower get" animation
                    BRA   CODE_03DE49         ;

CODE_03DE37:        LDA.b #$0B                ;\
                    STA.w $0110,x             ;/Get 1up
                    LDA.b #$00                ;\
                    STA.w $1600               ;/No SFX?
                    RTS                       ;

CODE_03DE42:        LDA.b #$01                ;\
                    STA.w $0756               ;/Set Mario's power-up
                    LDA.b #$09                ;Set "Mario got a power-up" flag
CODE_03DE49:        LDY.b #$00                ;Mario standing still flag?
                    JSR.w CODE_03DF6C         ;Goto power-up stuff
CODE_03DE4E:        RTS                       ;

                    db $18,$E8,$30,$D0,$08,$F8

CODE_03DE55:        LDA.b $09                 ;
                    LSR   A                   ;
                    BCS   CODE_03DE4E         ;
                    JSR.w CODE_03E2ED         ;
                    BCS   CODE_03DE8F         ;
                    CPX.b #$09                ;
                    BNE   CODE_03DE6C         ;
                    LDA.w $03AE               ;
                    BPL   CODE_03DE6C         ;
                    CMP.b #$F4                ;
                    BCS   CODE_03DE71         ;
CODE_03DE6C:        LDA.w $03D9,x             ;
                    BNE   CODE_03DE8F         ;
CODE_03DE71:        LDA.b $0F                 ;
                    CMP.b #$08                ;
                    BNE   CODE_03DE8F         ;
                    LDA.b $29,x               ;
                    AND.b #$20                ;
                    BNE   CODE_03DE8F         ;
                    JSR.w CODE_03E2F7         ;
                    JSR.w CODE_03EAB7         ;
                    LDX.b $9E                 ;
                    BCS   CODE_03DE90         ;
                    LDA.w $0481,x             ;
                    AND.b #$FE                ;
                    STA.w $0481,x             ;
CODE_03DE8F:        RTS                       ;

CODE_03DE90:        LDY.b $1C,x               ;
                    CPY.b #$2E                ;
                    BNE   CODE_03DE99         ;
                    JMP.w CODE_03DDFA         ;

CODE_03DE99:        LDA.w $07AF               ;
                    BEQ   CODE_03DEA4         ;
                    JMP.w CODE_03DD81         ;

                    ASL   A                   ;
                    ASL.b $04                 ;
CODE_03DEA4:        LDA.w $0481,x             ;
                    AND.b #$01                ;
                    ORA.w $03D9,x             ;
                    BNE   CODE_03DF14         ;
                    LDA.b #$01                ;
                    ORA.w $0481,x             ;
                    STA.w $0481,x             ;
                    CPY.b #$12                ;
                    BEQ   CODE_03DF15         ;
                    CPY.b #$0D                ;
                    BNE   CODE_03DEC1         ;
                    JMP.w CODE_03DF4D         ;

CODE_03DEC1:        CPY.b #$0C                ;
                    BNE   CODE_03DEC8         ;
                    JMP.w CODE_03DF4D         ;

CODE_03DEC8:        CPY.b #$33                ;
                    BEQ   CODE_03DF15         ;
                    CPY.b #$15                ;
                    BCS   CODE_03DF4D         ;
                    LDA.b $5C                 ;
                    BEQ   CODE_03DF4D         ;
                    LDA.b $29,x               ;
                    ASL   A                   ;
                    BCS   CODE_03DF15         ;
                    LDA.b $29,x               ;
                    AND.b #$07                ;
                    CMP.b #$02                ;
                    BCC   CODE_03DF15         ;
                    LDA.b $1C,x               ;
                    CMP.b #$06                ;
                    BEQ   CODE_03DF14         ;
                    LDA.b #$03                ;
                    STA.w $1600               ;
                    JSL.l CODE_05D2B1         ;
                    STZ.w $0F40,x             ;
                    LDA.b $29,x               ;
                    ORA.b #$80                ;
                    STA.b $29,x               ;
                    JSR.w CODE_03E043         ;
                    LDA.w $DE51,y             ;
                    STA.b $5E,x               ;
                    LDA.b #$03                ;
                    CLC                       ;
                    ADC.w $0284               ;
                    LDY.w $07A2,x             ;
                    CPY.b #$03                ;
                    BCS   CODE_03DF11         ;
                    LDA.w $DEA1,y             ;
CODE_03DF11:        JSR.w CODE_03E07E         ;
CODE_03DF14:        RTS                       ;

CODE_03DF15:        LDA.b $A0                 ;
                    BMI   CODE_03DF1E         ;
                    BEQ   CODE_03DF1E         ;
                    JMP.w CODE_03DFA6         ;

CODE_03DF1E:        LDA.b $1C,x               ;
                    CMP.b #$07                ;
                    BCC   CODE_03DF2F         ;
                    LDA.w $0237               ;
                    CLC                       ;
                    ADC.b #$0C                ;
                    CMP.w $0238,x             ;
                    BCC   CODE_03DFA6         ;
CODE_03DF2F:        LDA.w $079D               ;
                    BNE   CODE_03DFA6         ;
                    LDA.w $07AE               ;
                    BNE   CODE_03DF79         ;
                    LDA.w $03AD               ;
                    CMP.w $03AE               ;
                    BCC   CODE_03DF44         ;
                    JMP.w CODE_03E034         ;

CODE_03DF44:        LDA.b $47,x               ;
                    CMP.b #$01                ;
                    BNE   CODE_03DF4D         ;
                    JMP.w CODE_03E03D         ;

CODE_03DF4D:        LDA.w $07AE               ;
                    BNE   CODE_03DF79         ;
CODE_03DF52:        LDX.w $0756               ;
                    BEQ   CODE_03DF7C         ;
                    STA.w $0756               ;
                    LDA.b #$08                ;
                    STA.w $07AE               ;
                    LDA.b #$04                ;
                    STA.w $1600               ;
                    JSL.l CODE_049A88         ;
                    LDA.b #$0A                ;
CODE_03DF6A:        LDY.b #$01                ;
CODE_03DF6C:        STA.b $0F                 ;
                    STY.b $28                 ;
                    LDY.b #$FF                ;\Everything freezes timer
                    STY.w $0747               ;/
                    INY                       ;
                    STY.w $0775               ;
CODE_03DF79:        LDX.b $9E                 ;
                    RTS                       ;

CODE_03DF7C:        STX.b $5D                 ;
                    PHX                       ;
                    LDA.b #$01                ;
                    STA.w $0754               ;
                    JSL.l CODE_049A88         ;
                    PLX                       ;
                    INX                       ;
                    LDA.b #$09                ;\
                    STA.w $1602               ;/Mario died music
                    LDA.b #$09                ;\
                    STA.w $1602               ;/...
                    STA.w $0E67               ;
                    STA.w $0723               ;
                    LDA.b #$FC                ;
                    STA.b $A0                 ;
                    LDA.b #$0B                ;
                    BNE   CODE_03DF6A         ;

                    db $02,$06,$05,$06

CODE_03DFA6:        LDA.b $1C,x               ;
                    CMP.b #$12                ;
                    BEQ   CODE_03DF4D         ;
                    LDA.b #$02                ;
                    STA.w $1600               ;
                    LDA.b $1C,x               ;
                    LDY.b #$00                ;
                    CMP.b #$14                ;
                    BEQ   CODE_03DFD4         ;
                    CMP.b #$08                ;
                    BEQ   CODE_03DFD4         ;
                    CMP.b #$33                ;
                    BEQ   CODE_03DFD4         ;
                    CMP.b #$0C                ;
                    BEQ   CODE_03DFD4         ;
                    INY                       ;
                    CMP.b #$05                ;
                    BEQ   CODE_03DFD4         ;
                    INY                       ;
                    CMP.b #$11                ;
                    BEQ   CODE_03DFD4         ;
                    INY                       ;
                    CMP.b #$07                ;
                    BNE   CODE_03DFF1         ;
CODE_03DFD4:        LDA.w $DFA2,y             ;
                    JSR.w CODE_03E07E         ;
                    LDA.b $47,x               ;
                    PHA                       ;
                    JSR.w CODE_03E79D         ;
                    PLA                       ;
                    STA.b $47,x               ;
                    LDA.b #$20                ;
                    STA.b $29,x               ;
                    JSR.w CODE_03C726         ;
                    STA.b $5E,x               ;
                    LDA.b #$FD                ;
                    STA.b $A0                 ;
                    RTS                       ;

CODE_03DFF1:        CMP.b #$09                ;
                    BCC   CODE_03E012         ;
                    AND.b #$01                ;
                    STA.b $1C,x               ;
                    LDY.b #$00                ;
                    STY.b $29,x               ;
                    LDA.b #$03                ;
                    JSR.w CODE_03E07E         ;
                    JSR.w CODE_03C726         ;
                    JSR.w CODE_03E043         ;
                    LDA.w $DE53,y             ;
                    STA.b $5E,x               ;
                    JMP.w CODE_03E02F         ;

                    BPL   CODE_03E01D         ;
CODE_03E012:        LDA.b #$04                ;
                    STA.b $29,x               ;
                    INC.w $0284               ;
                    LDA.w $0284               ;
                    CLC                       ;
CODE_03E01D:        ADC.w $079D               ;
                    JSR.w CODE_03E07E         ;
                    INC.w $079D               ;
                    LDY.w $076A               ;
                    LDA.w $E010,y             ;
                    STA.w $07A2,x             ;
CODE_03E02F:        LDA.b #$FB                ;
                    STA.b $A0                 ;
                    RTS                       ;

CODE_03E034:        LDA.b $47,x               ;
                    CMP.b #$01                ;
                    BNE   CODE_03E03D         ;
                    JMP.w CODE_03DF4D         ;

CODE_03E03D:        JSR.w CODE_03E1BE         ;
                    JMP.w CODE_03DF4D         ;

CODE_03E043:        LDY.b #$01                ;
                    JSR.w CODE_03E8BC         ;
                    BPL   CODE_03E04B         ;
                    INY                       ;
CODE_03E04B:        STY.b $47,x               ;
                    DEY                       ;
                    RTS                       ;

CODE_03E04F:        STA.w $0110,x             ;
                    LDA.b #$30                ;
                    STA.w $0138,x             ;
                    LDA.w $0238,x             ;
                    STA.w $0124,x             ;
                    LDA.w $03AE               ;
                    STA.w $011A,x             ;
                    LDA.w $021A,x             ;
                    STA.b $ED                 ;
                    LDA.b $79,x               ;
                    STA.b $EE                 ;
                    PHX                       ;
                    TXA                       ;
                    ASL   A                   ;
                    TAX                       ;
                    REP   #$20                ;
                    LDA.b $ED                 ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.w $0E50,x             ;
                    SEP   #$20                ;
                    PLX                       ;
CODE_03E07D:        RTS                       ;

CODE_03E07E:        CMP.w $0110,x             ;
                    BCS   CODE_03E084         ;
                    RTS                       ;

CODE_03E084:        STA.w $0110,x             ;
                    LDA.b #$30                ;
                    STA.w $0138,x             ;
                    LDA.w $0238,x             ;
                    STA.w $0124,x             ;
                    LDA.w $03AE               ;
                    STA.w $011A,x             ;
                    PHY                       ;
                    TXA                       ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w $021A,x             ;
                    STA.b $E4                 ;
                    LDA.b $79,x               ;
                    STA.b $E5                 ;
                    REP   #$20                ;
                    LDA.b $E4                 ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.w $0E50,y             ;
                    SEP   #$20                ;
                    STA.w $011A,x             ;
                    PLY                       ;
                    RTS                       ;

                    db $80,$40,$20,$10,$08,$04,$02

                    db $7F,$BF,$DF,$EF,$F7,$FB,$FD

CODE_03E0C4:        LDA.b $09                 ;
                    LSR   A                   ;
                    BCC   CODE_03E07D         ;
                    LDA.b $5C                 ;
                    BEQ   CODE_03E07D         ;
                    LDA.b $1C,x               ;
                    CMP.b #$15                ;
                    BCS   CODE_03E140         ;
                    CMP.b #$11                ;
                    BEQ   CODE_03E140         ;
                    CMP.b #$0D                ;
                    BEQ   CODE_03E140         ;
                    LDA.w $03D9,x             ;
                    BNE   CODE_03E140         ;
                    JSR.w CODE_03E2F7         ;
                    DEX                       ;
                    BMI   CODE_03E140         ;
CODE_03E0E6:        STX.b $01                 ;
                    TYA                       ;
                    PHA                       ;
                    LDA.b $10,x               ;
                    BEQ   CODE_03E139         ;
                    LDA.b $1C,x               ;
                    CMP.b #$15                ;
                    BCS   CODE_03E139         ;
                    CMP.b #$11                ;
                    BEQ   CODE_03E139         ;
                    CMP.b #$0D                ;
                    BEQ   CODE_03E139         ;
                    LDA.w $03D9,x             ;
                    BNE   CODE_03E139         ;
                    TXA                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.b #$04                ;
                    TAX                       ;
                    JSR.w CODE_03EAB9         ;
                    LDX.b $9E                 ;
                    LDY.b $01                 ;
                    BCC   CODE_03E130         ;
                    LDA.b $29,x               ;
                    ORA.w $0029,y             ;
                    AND.b #$80                ;
                    BNE   CODE_03E12B         ;
                    LDA.w $0481,y             ;
                    AND.w $E0B6,x             ;
                    BNE   CODE_03E139         ;
                    LDA.w $0481,y             ;
                    ORA.w $E0B6,x             ;
                    STA.w $0481,y             ;
CODE_03E12B:        JSR.w CODE_03E143         ;
                    BRA   CODE_03E139         ;

CODE_03E130:        LDA.w $0481,y             ;
                    AND.w $E0BD,x             ;
                    STA.w $0481,y             ;
CODE_03E139:        PLA                       ;
                    TAY                       ;
                    LDX.b $01                 ;
                    DEX                       ;
                    BPL   CODE_03E0E6         ;
CODE_03E140:        LDX.b $9E                 ;
                    RTS                       ;

CODE_03E143:        LDA.w $29,y             ;
                    ORA.b $29,x               ;
                    AND.b #$20                ;
                    BNE   CODE_03E183         ;
                    LDA.b $1C,x               ;
                    CMP.b #$05                ;
                    BNE   CODE_03E154         ;
                    STZ.b $29,x               ;
CODE_03E154:        LDA.b $29,x               ;
                    CMP.b #$06                ;
                    BCC   CODE_03E184         ;
                    LDA.w $29,y             ;
                    ASL   A                   ;
                    BCC   CODE_03E16A         ;
                    LDA.b #$06                ;
                    JSR.w CODE_03E07E         ;
                    JSR.w CODE_03DD81         ;
                    LDY.b $01                 ;
CODE_03E16A:        TYA                       ;
                    TAX                       ;
                    JSR.w CODE_03DD81         ;
                    LDX.b $9E                 ;
                    LDA.w $012E,x             ;
                    CLC                       ;
                    ADC.b #$04                ;
                    LDX.b $01                 ;
                    JSR.w CODE_03E07E         ;
                    LDX.b $9E                 ;
                    INC.w $012E,x             ;
                    BRA   CODE_03E1A7         ;

CODE_03E183:        RTS                       ;

CODE_03E184:        LDA.w $29,y             ;
                    CMP.b #$06                ;
                    BCC   CODE_03E1B7         ;
                    LDA.w $1C,y             ;
                    CMP.b #$05                ;
                    BEQ   CODE_03E183         ;
                    JSR.w CODE_03DD81         ;
                    LDY.b $01                 ;
                    LDA.w $012E,y             ;
                    CLC                       ;
                    ADC.b #$04                ;
                    LDX.b $9E                 ;
                    JSR.w CODE_03E07E         ;
                    LDX.b $01                 ;
                    INC.w $012E,x             ;
CODE_03E1A7:        LDA.w $012E,x             ;
                    CLC                       ;
                    ADC.b #$12                ;
                    CMP.b #$1A                ;
                    BCC   CODE_03E1B3         ;
                    LDA.b #$00                ;
CODE_03E1B3:        STA.w $1600               ;
                    RTS                       ;

CODE_03E1B7:        TYA                       ;
                    TAX                       ;
                    JSR.w CODE_03E1BE         ;
                    LDX.b $9E                 ;
CODE_03E1BE:        LDA.b $1C,x               ;
                    CMP.b #$0D                ;
                    BEQ   CODE_03E1E6         ;
                    CMP.b #$11                ;
                    BEQ   CODE_03E1E6         ;
                    CMP.b #$05                ;
                    BEQ   CODE_03E1E6         ;
                    CMP.b #$12                ;
                    BEQ   CODE_03E1D8         ;
                    CMP.b #$0E                ;
                    BEQ   CODE_03E1D8         ;
                    CMP.b #$07                ;
                    BCS   CODE_03E1E6         ;
CODE_03E1D8:        LDA.b $5E,x               ;
                    EOR.b #$FF                ;
                    TAY                       ;
                    INY                       ;
                    STY.b $5E,x               ;
                    LDA.b $47,x               ;
                    EOR.b #$03                ;
                    STA.b $47,x               ;
CODE_03E1E6:        RTS                       ;

CODE_03E1E7:        LDA.b #$FF                ;
                    STA.w $03A2,x             ;
                    LDA.w $0747               ;
                    BNE   CODE_03E21B         ;
                    LDA.b $29,x               ;
                    BMI   CODE_03E21B         ;
                    LDA.b $1C,x               ;
                    CMP.b #$24                ;
                    BNE   CODE_03E201         ;
                    LDA.b $29,x               ;
                    TAX                       ;
                    JSR.w CODE_03E201         ;
CODE_03E201:        JSR.w CODE_03E2ED         ;
                    BCS   CODE_03E21B         ;
                    TXA                       ;
                    JSR.w CODE_03E2F9         ;
                    LDA.w $0238,x             ;
                    STA.b $00                 ;
                    TXA                       ;
                    PHA                       ;
                    JSR.w CODE_03EAB7         ;
                    PLA                       ;
                    TAX                       ;
                    BCC   CODE_03E21B         ;
                    JSR.w CODE_03E25F         ;
CODE_03E21B:        LDX.b $9E                 ;
                    RTS                       ;

CODE_03E21E:        LDA.w $0747               ;
                    BNE   CODE_03E25A         ;
                    STA.w $03A2,x             ;
                    JSR.w CODE_03E2ED         ;
                    BCS   CODE_03E25A         ;
                    LDA.b #$02                ;
                    STA.b $00                 ;
CODE_03E22F:        LDX.b $9E                 ;
                    JSR.w CODE_03E2F7         ;
                    AND.b #$02                ;
                    BNE   CODE_03E25A         ;
                    LDA.w $0F9D,y             ;
                    CMP.b #$20                ;
                    BCC   CODE_03E244         ;
                    JSR.w CODE_03EAB7         ;
                    BCS   CODE_03E25D         ;
CODE_03E244:        LDA.w $0F9D,y             ;
                    CLC                       ;
                    ADC.b #$80                ;
                    STA.w $0F9D,y             ;
                    LDA.w $0F9F,y             ;
                    CLC                       ;
                    ADC.b #$80                ;
                    STA.w $0F9F,y             ;
                    DEC.b $00                 ;
                    BNE   CODE_03E22F         ;
CODE_03E25A:        LDX.b $9E                 ;
                    RTS                       ;

CODE_03E25D:        LDX.b $9E                 ;
CODE_03E25F:        LDA.w $0F9F,y             ;
                    SEC                       ;
                    SBC.w $0F9D               ;
                    CMP.b #$04                ;
                    BCS   CODE_03E272         ;
                    LDA.b $A0                 ;
                    BPL   CODE_03E272         ;
                    LDA.b #$01                ;
                    STA.b $A0                 ;
CODE_03E272:        LDA.w $0F9F               ;
                    SEC                       ;
                    SBC.w $0F9D,y             ;
                    CMP.b #$06                ;
                    BCS   CODE_03E298         ;
                    LDA.b $A0                 ;
                    BMI   CODE_03E298         ;
                    LDA.b $00                 ;
                    LDY.b $1C,x               ;
                    CPY.b #$2B                ;
                    BEQ   CODE_03E28E         ;
                    CPY.b #$2C                ;
                    BEQ   CODE_03E28E         ;
                    TXA                       ;
CODE_03E28E:        LDX.b $9E                 ;
                    STA.w $03A2,x             ;
                    LDA.b #$00                ;
                    STA.b $28                 ;
                    RTS                       ;

CODE_03E298:        LDA.b #$01                ;
                    STA.b $00                 ;
                    LDA.w $0F9E               ;
                    SEC                       ;
                    SBC.w $0F9C,y             ;
                    CMP.b #$08                ;
                    BCC   CODE_03E2B4         ;
                    INC.b $00                 ;
                    LDA.w $0F9E,y             ;
                    CLC                       ;
                    SBC.w $0F9C               ;
                    CMP.b #$09                ;
                    BCS   CODE_03E2B7         ;
CODE_03E2B4:        JSR.w CODE_03E6B5         ;
CODE_03E2B7:        LDX.b $9E                 ;
                    RTS                       ;

                    BRA   CODE_03E2BC         ;

CODE_03E2BC:        TAY                       ;
                    LDA.w $0238,x             ;
                    CLC                       ;
                    ADC.w $E2B9,y             ;
                    BNE   CODE_03E2CE         ;
                    LDA.b #$02                ;
                    STA.b $BB                 ;
                    RTS                       ;

CODE_03E2CB:        LDA.w $0238,x             ;
CODE_03E2CE:        LDY.b $0F                 ;
                    CPY.b #$0B                ;
                    BEQ   CODE_03E2EC         ;
                    LDY.b $BC,x               ;
                    CPY.b #$01                ;
                    BNE   CODE_03E2EC         ;
                    SEC                       ;
                    SBC.b #$20                ;
                    STA.w $0237               ;
                    TYA                       ;
                    SBC.b #$00                ;
                    STA.b $BB                 ;
                    LDA.b #$00                ;
                    STA.b $A0                 ;
                    STA.w $043C               ;
CODE_03E2EC:        RTS                       ;

CODE_03E2ED:        LDA.w $03D0               ;
                    AND.b #$F0                ;
                    CLC                       ;
                    BEQ   CODE_03E2F6         ;
                    SEC                       ;
CODE_03E2F6:        RTS                       ;

CODE_03E2F7:        LDA.b $9E                 ;
CODE_03E2F9:        ASL   A                   ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.b #$04                ;
                    TAY                       ;
                    LDA.w $03D1               ;
                    AND.b #$0F                ;
                    CMP.b #$0F                ;
                    RTS                       ;

                    db $20,$10

CODE_03E309:        LDA.w $0716               ;\When "pass through blocks" flag is enabled
                    BNE   CODE_03E33D         ;/return.
                    LDA.b $0F                 ;\
                    CMP.b #$0B                ; |When in death animation
                    BEQ   CODE_03E33D         ;/ return
                    CMP.b #$04                ;\When on flagpole?
                    BCC   CODE_03E33D         ;/return
                    LDA.b #$01                ;\
                    LDY.w $0704               ; |If swimming, make player state 01
                    BNE   CODE_03E329         ;/branch
                    LDA.b $28                 ;\
                    BEQ   CODE_03E327         ; |If player state is 00, make it 02
                    CMP.b #$03                ; |If player state is 03, keep it 03
                    BNE   CODE_03E32B         ; |
CODE_03E327:        LDA.b #$02                ; |
CODE_03E329:        STA.b $28                 ;/
CODE_03E32B:        LDA.b $BB                 ;\
                    CMP.b #$01                ; |If position of Mario is NOT inside range --
                    BNE   CODE_03E33D         ;/(AKA anywhere he can shoot fireballs), return
                    LDA.b #$FF                ;
                    STA.w $0480               ;note to self: look at what this store does.
                    LDA.w $0237               ;\
                    CMP.b #$CF                ; |Branch if player Y-position is inside the game
                    BCC   CODE_03E33E         ;/ (AKA not in a bottomless pit)
CODE_03E33D:        RTS                       ;Return

CODE_03E33E:        LDY.b #$02                ;Block interaction routine
                    LDA.w $0714               ;\If Mario is ducking, branch, #$0E into $EB
                    BNE   CODE_03E351         ;/
                    LDA.w $0754               ;\If Small Mario, branch, #$0E into $EB
                    BNE   CODE_03E351         ;/
                    DEY                       ;\
                    LDA.w $0704               ; |If swimming, branch, #$07 into $EB
                    BNE   CODE_03E351         ; |
                    DEY                       ;/If anything else (normal non-small Mario), #$00 into $EB
CODE_03E351:        LDA.w $EB3F,y             ;\Set Mario's hitbox for object interaction?
                    STA.b $EB                 ;/
                    TAY                       ;Hitbox size to Y
                    LDX.w $0754               ;Mario Small Flag to X
                    LDA.w $0714               ;\If Mario isn't ducking
                    BEQ   CODE_03E360         ;/branch
                    INX                       ;Mario is ducking, so Mario Small flag index indicates Mario = small
CODE_03E360:        LDA.w $0237               ;\Mario's Y position
                    CMP.w $E307,x             ; |If it's smaller than $20 (Small Mario), or $10 (big Mario)
                    BCC   CODE_03E3A0         ;/branch (to make Mario not interact w/ objects on/above status-bar)
                    LDA.b #$01                ;
                    STA.b $E4                 ;
                    JSR.w CODE_03EB7B         ;
                    BEQ   CODE_03E3A0         ;
                    JSR.w CODE_03E70D         ;\Check if tile is E9 or EA, and if so, play the coin sound
                    BCS   CODE_03E3C9         ;/Then branch. If not tile E9 or EA, continue.
                    LDY.b $A0                 ;\If Mario y-speed is that of falling, branch
                    BPL   CODE_03E3A0         ;/
                    LDY.b $04                 ;
                    CPY.b #$04                ;
                    BCC   CODE_03E3A0         ;
                    JSR.w CODE_03E6FB         ;
                    BCS   CODE_03E393         ;
                    LDY.b $5C                 ;
                    BEQ   CODE_03E39C         ;
                    LDY.w $078C               ;
                    BNE   CODE_03E39C         ;
                    JSR.w CODE_03BE75         ;
                    BRA   CODE_03E3A0         ;

CODE_03E393:        CMP.b #$2A                ;
                    BEQ   CODE_03E39C         ;
                    LDA.b #$01                ;\ Executes as soon as Mario hits a cement-block solid
                    STA.w $1600               ; |block from below which does NOT spawn ANYTHING
CODE_03E39C:        LDA.b #$01                ; |Play sound, set Y-speed to downwards
                    STA.b $A0                 ;/
CODE_03E3A0:        LDY.b $EB                 ;
                    LDA.w $0237               ;
                    CMP.b #$CF                ;
                    BCS   CODE_03E40F         ;
                    STZ.b $E4                 ;
                    JSR.w CODE_03EB7A         ;
                    JSR.w CODE_03E70D         ;
                    BCS   CODE_03E3C9         ;
                    PHA                       ;
                    STZ.b $E4                 ;
                    JSR.w CODE_03EB7A         ;
                    STA.b $00                 ;
                    PLA                       ;
                    STA.b $01                 ;
                    BNE   CODE_03E3CC         ;
                    LDA.b $00                 ;
                    BEQ   CODE_03E40F         ;
                    JSR.w CODE_03E70D         ;
                    BCC   CODE_03E3CC         ;
CODE_03E3C9:        JMP.w CODE_03E4C8         ;

CODE_03E3CC:        JSR.w CODE_03E706         ;
                    BCS   CODE_03E40F         ;
                    LDY.b $A0                 ;
                    BMI   CODE_03E40F         ;
                    CMP.b #$FD                ;
                    BNE   CODE_03E3DC         ;
                    JMP.w CODE_03E4D1         ;

CODE_03E3DC:        JSR.w CODE_03E5FA         ;
                    BEQ   CODE_03E40F         ;
                    LDY.w $070E               ;
                    BNE   CODE_03E40B         ;
                    LDY.b $04                 ;
                    CPY.b #$05                ;
                    BCC   CODE_03E3F3         ;
                    LDA.b $46                 ;
                    STA.b $00                 ;
                    JMP.w CODE_03E6B5         ;

CODE_03E3F3:        JSR.w CODE_03E601         ;
                    LDA.b #$F0                ;
                    AND.w $0237               ;
                    STA.w $0237               ;
                    JSR.w CODE_03E625         ;
                    LDA.b #$00                ;
                    STA.b $A0                 ;
                    STA.w $043C               ;
                    STA.w $0284               ;
CODE_03E40B:        LDA.b #$00                ;
                    STA.b $28                 ;
CODE_03E40F:        LDY.b $EB                 ;
                    INY                       ;
                    INY                       ;
                    LDA.b #$02                ;
                    STA.b $00                 ;
CODE_03E417:        INY                       ;
                    STY.b $EB                 ;
                    LDA.w $0237               ;
                    CMP.b #$20                ;
                    BCC   CODE_03E439         ;
                    CMP.b #$E4                ;
                    BCS   CODE_03E452         ;
                    STZ.b $E4                 ;
                    JSR.w CODE_03EB7F         ;
                    BEQ   CODE_03E439         ;
                    CMP.b #$20                ;
                    BEQ   CODE_03E439         ;
                    CMP.b #$75                ;
                    BEQ   CODE_03E439         ;
                    JSR.w CODE_03E706         ;
                    BCC   CODE_03E453         ;
CODE_03E439:        LDY.b $EB                 ;
                    INY                       ;
                    LDA.w $0237               ;
                    CMP.b #$08                ;
                    BCC   CODE_03E452         ;
                    CMP.b #$D0                ;
                    BCS   CODE_03E452         ;
                    STZ.b $E4                 ;
                    JSR.w CODE_03EB7F         ;
                    BNE   CODE_03E453         ;
                    DEC.b $00                 ;
                    BNE   CODE_03E417         ;
CODE_03E452:        RTS                       ;

CODE_03E453:        JSR.w CODE_03E5FA         ;
                    BEQ   CODE_03E4C5         ;
                    JSR.w CODE_03E706         ;
                    BCC   CODE_03E460         ;
                    JMP.w CODE_03E526         ;

CODE_03E460:        JSR.w CODE_03E70D         ;
                    BCS   CODE_03E4C8         ;
                    JSR.w CODE_03E61A         ;
                    BCC   CODE_03E472         ;
                    LDA.w $070E               ;
                    BNE   CODE_03E4C5         ;
                    JMP.w CODE_03E4C2         ;

CODE_03E472:        LDY.b $28                 ;
                    CPY.b #$00                ;
                    BNE   CODE_03E4C2         ;
                    LDY.w $0202               ;
                    DEY                       ;
                    BNE   CODE_03E4C2         ;
                    CMP.b #$76                ;
                    BEQ   CODE_03E486         ;
                    CMP.b #$23                ;
                    BNE   CODE_03E4C2         ;
CODE_03E486:        LDA.w $0256               ;
                    BEQ   CODE_03E499         ;
                    LDY.b $9A                 ;
                    BNE   CODE_03E499         ;
                    LDY.b #$04                ;
                    STY.w $1600               ;
                    STY.b $9A                 ;
                    STZ.w $07AF               ;
CODE_03E499:        AND.b #$CF                ;
                    STA.w $0256               ;
                    LDA.w $0219               ;
                    AND.b #$0F                ;
                    BEQ   CODE_03E4B3         ;
                    LDY.b #$00                ;
                    LDA.w $071A               ;
                    BEQ   CODE_03E4AD         ;
                    INY                       ;
CODE_03E4AD:        LDA.w $E4C6,y             ;
                    STA.w $06DE               ;
CODE_03E4B3:        LDA.b $0F                 ;
                    CMP.b #$07                ;
                    BEQ   CODE_03E4C5         ;
                    CMP.b #$08                ;
                    BNE   CODE_03E4C5         ;
                    LDA.b #$02                ;
                    STA.b $0F                 ;
                    RTS                       ;

CODE_03E4C2:        JSR.w CODE_03E6B5         ;
CODE_03E4C5:        RTS                       ;

                    db $34,$34

CODE_03E4C8:        JSR.w CODE_03E514         ;
                    INC.w $0748               ;
                    JMP.w CODE_03BD2C         ;

CODE_03E4D1:        LDA.b #$00                ;
                    STA.w $0772               ;
                    LDA.b #$02                ;
                    STA.w $0770               ;
                    LDA.w $2142               ;
                    CMP.b #$0B                ;
                    BEQ   CODE_03E4E7         ;
                    LDA.b #$F0                ;
                    STA.w $1602               ;
CODE_03E4E7:        LDA.b #$18                ;
                    STA.b $5D                 ;
                    PHX                       ;
                    LDX.b #$00                ;
CODE_03E4EE:        LDA.b $1C,x               ;
                    CMP.b #$2D                ;
                    BNE   CODE_03E50E         ;
                    LDA.b $10,x               ;
                    CMP.b #$01                ;
                    BNE   CODE_03E50E         ;
                    LDA.w $021A,x             ;
                    SEC                       ;
                    SBC.w $073F               ;
                    STA.w $03AE               ;
                    LDA.w $0238,x             ;
                    STA.w $03B9               ;
                    JSL.l CODE_05D055         ;
CODE_03E50E:        INX                       ;
                    CPX.b #$09                ;
                    BNE   CODE_03E4EE         ;
                    PLX                       ;
CODE_03E514:        LDY.b $02                 ;
                    LDA.b #$00                ;
                    STA.b ($06),y             ;
                    JMP.w CODE_039373         ;

                    db $F9,$07,$FF,$00,$18,$22,$50,$68
                    db $90

CODE_03E526:        LDY.b $04                 ;
                    CPY.b #$06                ;
                    BCC   CODE_03E530         ;
                    CPY.b #$0A                ;
                    BCC   CODE_03E531         ;
CODE_03E530:        RTS                       ;

CODE_03E531:        CMP.b #$28                ;
                    BEQ   CODE_03E539         ;
                    CMP.b #$29                ;
                    BNE   CODE_03E57E         ;
CODE_03E539:        LDA.b $0F                 ;
                    CMP.b #$05                ;
                    BEQ   CODE_03E58D         ;
                    LDA.b #$01                ;
                    STA.w $0202               ;
                    INC.w $0723               ;
                    LDA.b $0F                 ;
                    CMP.b #$04                ;
                    BEQ   CODE_03E577         ;
                    LDA.b #$33                ;
                    JSR.w CODE_03A885         ;
                    JSL.l CODE_048CEE         ;
                    LDA.b #$F0                ;\Music Fade Out
                    STA.w $1602               ;/
                    LDA.b #$46                ;\Flagpole sound
                    STA.w $1600               ;/
                    LSR   A                   ;
                    STA.w $0713               ;
                    LDX.b #$04                ;
                    LDA.w $0237               ;
                    STA.w $070F               ;
CODE_03E56C:        CMP.w $E521,x             ;
                    BCS   CODE_03E574         ;
                    DEX                       ;
                    BNE   CODE_03E56C         ;
CODE_03E574:        STX.w $010F               ;
CODE_03E577:        LDA.b #$04                ;
                    STA.b $0F                 ;
                    JMP.w CODE_03E58D         ;

CODE_03E57E:        CMP.b #$2A                ;
                    BNE   CODE_03E58D         ;
                    LDA.w $0237               ;\
                    CMP.b #$20                ; |If player Y-position is not above the flagpole
                    BCS   CODE_03E58D         ; |
                    LDA.b #$01                ;\|Player action: climb a vine/slide down the flagpole
                    STA.b $0F                 ;/
CODE_03E58D:        LDA.b #$03                ;\Player state: slide down the flagpole
                    STA.b $28                 ;/
                    LDA.b #$00                ;\Store zero to player X-speed
                    STA.b $5D                 ; |
                    STA.w $0705               ;/Full left movement, minimal right movement flag?
                    LDA.w $0398               ;
                    BEQ   CODE_03E5CC         ;
                    LDA.w $03AE               ;
                    BPL   CODE_03E5CC         ;
                    CMP.b #$F8                ;
                    BCC   CODE_03E5CC         ;
                    LDA.w $82               ;
                    STA.b $E5                 ;
                    LDA.w $0223               ;
                    STA.b $E4                 ;
                    REP   #$20                ;
                    LDA.b $E4                 ;
                    CLC                       ;
                    ADC.w #$0007              ;
                    STA.b $E4                 ;
                    SEP   #$20                ;
                    LDA.b $E4                 ;
                    STA.w $0219               ;
                    LDA.b $E5                 ;
                    STA.b $78                 ;
                    LDA.b #$02                ;
                    STA.w $0202               ;
                    BRA   CODE_03E5F9         ;

CODE_03E5CC:        LDA.w $0219               ;
                    SEC                       ;
                    SBC.w $071C               ;
                    CMP.b #$10                ;
                    BCS   CODE_03E5DC         ;
                    LDA.b #$02                ;
                    STA.w $0202               ;
CODE_03E5DC:        LDY.w $0202               ;
                    LDA.b $06                 ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.w $E51C,y             ;
                    STA.w $0219               ;
                    LDA.b $06                 ;
                    BNE   CODE_03E5F9         ;
                    LDA.w $071B               ;
                    CLC                       ;
                    ADC.w $E51E,y             ;
                    STA.b $78                 ;
CODE_03E5F9:        RTS                       ;

CODE_03E5FA:        CMP.b #$62                ;
                    BEQ   CODE_03E600         ;
                    CMP.b #$63                ;
CODE_03E600:        RTS                       ;

CODE_03E601:        JSR.w CODE_03E61A         ;
                    BCC   CODE_03E619         ;
                    LDA.b #$70                ;
                    STA.w $0709               ;
                    LDA.b #$F9                ;
                    STA.w $06DB               ;
                    LDA.b #$03                ;
                    STA.w $078E               ;
                    LSR   A                   ;
                    STA.w $070E               ;
CODE_03E619:        RTS                       ;

CODE_03E61A:        CMP.b #$6F                ;
                    BEQ   CODE_03E623         ;
                    CMP.b #$70                ;
                    CLC                       ;
                    BNE   CODE_03E624         ;
CODE_03E623:        SEC                       ;
CODE_03E624:        RTS                       ;

CODE_03E625:        LDA.b $0B                 ;
                    AND.b #$04                ;
                    BEQ   CODE_03E624         ;
                    LDA.b $00                 ;
                    CMP.b #$15                ;
                    BNE   CODE_03E624         ;
                    LDA.b $01                 ;
                    CMP.b #$14                ;
                    BNE   CODE_03E624         ;
                    LDA.b #$30                ;
                    STA.w $06DE               ;
                    LDA.b #$03                ;
                    STA.b $0F                 ;
                    LDA.b #$04                ;
                    STA.w $07AE               ;
                    STZ.w $07AF               ;
                    LDA.b #$00                ;
                    STA.w $0256               ;
                    LDA.w $06D6               ;
                    BEQ   CODE_03E6AF         ;
                    CMP.b #$04                ;
                    BCS   CODE_03E668         ;
                    LDX.b #$04                ;
                    LDA.w $075F               ;
                    BEQ   CODE_03E664         ;
                    INX                       ;
                    LDA.b $5C                 ;
                    DEC   A                   ;
                    BNE   CODE_03E664         ;
                    INX                       ;
CODE_03E664:        TXA                       ;
                    STA.w $06D6               ;
CODE_03E668:        AND.b #$03                ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w $0219               ;
                    CMP.b #$60                ;
                    BCC   CODE_03E67A         ;
                    INX                       ;
                    CMP.b #$A0                ;
                    BCC   CODE_03E67A         ;
                    INX                       ;
CODE_03E67A:        LDY.w $90D8,x             ;
                    DEY                       ;
                    STY.w $075F               ;
                    TYX                       ;
                    LDA.l $04C11C,x           ;
                    TAX                       ;
                    LDA.l $04C124,x           ;
                    STA.w $0750               ;
                    LDA.b #$80                ;
                    STA.w $1602               ;
                    LDA.b #$00                ;
                    STA.w $0751               ;
                    STA.w $0760               ;
                    STA.w $075C               ;
                    STA.w $0752               ;
                    INC.w $075D               ;
                    INC.w $0757               ;
                    LDA.b #$F3                ;
                    STA.w $1602               ;
                    STA.w $0E1A               ;
CODE_03E6AF:        LDA.b #$04                ;
                    STA.w $1600               ;
                    RTS                       ;

CODE_03E6B5:        LDA.b #$00                ;
                    LDY.b $5D                 ;
                    LDX.b $00                 ;
                    DEX                       ;
                    BNE   CODE_03E6C8         ;
                    INX                       ;
                    CPY.b #$00                ;
                    BMI   CODE_03E6ED         ;
                    LDA.b #$FF                ;
                    JMP.w CODE_03E6D0         ;

CODE_03E6C8:        LDX.b #$02                ;
                    CPY.b #$01                ;
                    BPL   CODE_03E6ED         ;
                    LDA.b #$01                ;
CODE_03E6D0:        LDY.b #$10                ;
                    STY.w $078D               ;
                    LDY.b #$00                ;
                    STY.b $5D                 ;
                    CMP.b #$00                ;
                    BPL   CODE_03E6DE         ;
                    DEY                       ;
CODE_03E6DE:        STY.b $00                 ;
                    CLC                       ;
                    ADC.w $0219               ;
                    STA.w $0219               ;
                    LDA.b $78                 ;
                    ADC.b $00                 ;
                    STA.b $78                 ;
CODE_03E6ED:        TXA                       ;
                    EOR.b #$FF                ;
                    AND.w $0480               ;
                    STA.w $0480               ;
                    RTS                       ;

                    db $14,$64,$8C,$FC

CODE_03E6FB:        JSR.w CODE_03E71D         ;
                    CMP.w $E6F7,x             ;
                    RTS                       ;

                    db $28,$77,$8E,$FE

CODE_03E706:        JSR.w CODE_03E71D         ;0 S:01FF P:EnvMXdIzc HC:1062 VC:000 FC:00 I:00
                    CMP.w $E702,x             ;0 S:01FF P:EnvMXdIzc HC:1078 VC:000 FC:00 I:00
                    RTS                       ;0 S:01FF P:EnvMXdIzc HC:1094 VC:000 FC:00 I:00

CODE_03E70D:        CMP.b #$E9                ;
                    BEQ   CODE_03E717         ;
                    CMP.b #$EA                ;
                    BEQ   CODE_03E717         ;
                    CLC                       ;
                    RTS                       ;

CODE_03E717:        LDA.b #$01                ;\
                    STA.w $1603               ;/Coin sound
                    RTS                       ;Return

CODE_03E71D:        TAY                       ;
                    AND.b #$C0                ;
                    ASL   A                   ;
                    ROL   A                   ;
                    ROL   A                   ;
                    TAX                       ;
                    TYA                       ;
CODE_03E725:        RTS                       ;

                    db $01,$01,$02,$02,$02,$05,$10,$F0

CODE_03E72E:        LDA.b $29,x               ;
                    AND.b #$20                ;
                    BNE   CODE_03E725         ;
                    JSR.w CODE_03E8D8         ;
                    BCC   CODE_03E725         ;
                    LDY.b $1C,x               ;
                    CPY.b #$12                ;
                    BNE   CODE_03E746         ;
                    LDA.w $0238,x             ;
                    CMP.b #$25                ;
                    BCC   CODE_03E725         ;
CODE_03E746:        CPY.b #$0E                ;
                    BNE   CODE_03E74D         ;
                    JMP.w CODE_03E8E1         ;

CODE_03E74D:        CPY.b #$05                ;
                    BNE   CODE_03E754         ;
                    JMP.w CODE_03E903         ;

CODE_03E754:        CPY.b #$12                ;
                    BEQ   CODE_03E760         ;
                    CPY.b #$2E                ;
                    BEQ   CODE_03E760         ;
                    CPY.b #$07                ;
                    BCS   CODE_03E7D5         ;
CODE_03E760:        JSR.w CODE_03E92C         ;
                    BNE   CODE_03E768         ;
CODE_03E765:        JMP.w CODE_03E851         ;

CODE_03E768:        JSR.w CODE_03E933         ;
                    BEQ   CODE_03E765         ;
                    CMP.b #$27                ;
                    BNE   CODE_03E7D6         ;
                    LDY.b $02                 ;
                    LDA.b #$00                ;
                    STA.b ($06),y             ;
                    LDA.b $1C,x               ;
                    CMP.b #$15                ;
                    BCS   CODE_03E789         ;
                    CMP.b #$06                ;
                    BNE   CODE_03E784         ;
                    JSR.w CODE_03E90C         ;
CODE_03E784:        LDA.b #$01                ;
                    JSR.w CODE_03E07E         ;
CODE_03E789:        CMP.b #$09                ;
                    BCC   CODE_03E79D         ;
                    CMP.b #$11                ;
                    BCS   CODE_03E79D         ;
                    CMP.b #$0A                ;
                    BCC   CODE_03E799         ;
                    CMP.b #$0D                ;
                    BCC   CODE_03E79D         ;
CODE_03E799:        AND.b #$01                ;
                    STA.b $1C,x               ;
CODE_03E79D:        LDA.b $29,x               ;
                    AND.b #$F0                ;
                    ORA.b #$02                ;
                    STA.b $29,x               ;
                    DEC.w $0238,x             ;
                    DEC.w $0238,x             ;
                    LDA.b $1C,x               ;
                    CMP.b #$07                ;
                    BEQ   CODE_03E7B7         ;
                    LDA.b #$FD                ;
                    LDY.b $5C                 ;
                    BNE   CODE_03E7B9         ;
CODE_03E7B7:        LDA.b #$FF                ;
CODE_03E7B9:        STA.b $A1,x               ;
                    LDY.b #$01                ;
                    JSR.w CODE_03E8BC         ;
                    BPL   CODE_03E7C3         ;
                    INY                       ;
CODE_03E7C3:        LDA.b $1C,x               ;
                    CMP.b #$33                ;
                    BEQ   CODE_03E7CF         ;
                    CMP.b #$08                ;
                    BEQ   CODE_03E7CF         ;
                    STY.b $47,x               ;
CODE_03E7CF:        DEY                       ;
                    LDA.w $E72C,y             ;
                    STA.b $5E,x               ;
CODE_03E7D5:        RTS                       ;

CODE_03E7D6:        LDA.b $04                 ;
                    SEC                       ;
                    SBC.b #$08                ;
                    CMP.b #$05                ;
                    BCS   CODE_03E851         ;
                    LDA.b $29,x               ;
                    AND.b #$40                ;
                    BNE   CODE_03E83C         ;
                    LDA.b $29,x               ;
                    ASL   A                   ;
                    BCC   CODE_03E7ED         ;
CODE_03E7EA:        JMP.w CODE_03E86D         ;

CODE_03E7ED:        LDA.b $29,x               ;
                    BEQ   CODE_03E7EA         ;
                    CMP.b #$05                ;
                    BEQ   CODE_03E814         ;
                    CMP.b #$03                ;
                    BCS   CODE_03E813         ;
                    LDA.b $29,x               ;
                    CMP.b #$02                ;
                    BNE   CODE_03E814         ;
                    LDA.b #$10                ;
                    LDY.b $1C,x               ;
                    CPY.b #$12                ;
                    BNE   CODE_03E809         ;
                    LDA.b #$00                ;
CODE_03E809:        STA.w $07A2,x             ;
                    LDA.b #$03                ;
                    STA.b $29,x               ;
                    JSR.w CODE_03E8CA         ;
CODE_03E813:        RTS                       ;

CODE_03E814:        LDA.b $1C,x               ;
                    CMP.b #$06                ;
                    BEQ   CODE_03E83C         ;
                    CMP.b #$12                ;
                    BNE   CODE_03E82C         ;
                    LDA.b #$01                ;
                    STA.b $47,x               ;
                    LDA.b #$08                ;
                    STA.b $5E,x               ;
                    LDA.b $09                 ;
                    AND.b #$07                ;
                    BEQ   CODE_03E83C         ;
CODE_03E82C:        LDY.b #$01                ;
                    JSR.w CODE_03E8BC         ;
                    BPL   CODE_03E834         ;
                    INY                       ;
CODE_03E834:        TYA                       ;
                    CMP.b $47,x               ;
                    BNE   CODE_03E83C         ;
                    JSR.w CODE_03E894         ;
CODE_03E83C:        JSR.w CODE_03E8CA         ;
                    LDA.b $29,x               ;
                    AND.b #$80                ;
                    BNE   CODE_03E84A         ;
                    LDA.b #$00                ;
                    STA.b $29,x               ;
                    RTS                       ;

CODE_03E84A:        LDA.b $29,x               ;
                    AND.b #$BF                ;
                    STA.b $29,x               ;
                    RTS                       ;

CODE_03E851:        LDA.b $1C,x               ;
                    CMP.b #$03                ;
                    BNE   CODE_03E85B         ;
                    LDA.b $29,x               ;
                    BEQ   CODE_03E894         ;
CODE_03E85B:        LDA.b $29,x               ;
                    TAY                       ;
                    ASL   A                   ;
                    BCC   CODE_03E868         ;
                    LDA.b $29,x               ;
                    ORA.b #$40                ;
                    JMP.w CODE_03E86B         ;

CODE_03E868:        LDA.w $E726,y             ;
CODE_03E86B:        STA.b $29,x               ;
CODE_03E86D:        LDA.w $0238,x             ;
                    CMP.b #$20                ;
                    BCC   CODE_03E893         ;
                    LDY.b #$16                ;
                    LDA.b #$02                ;
                    STA.b $EB                 ;
CODE_03E87A:        LDA.b $EB                 ;
                    CMP.b $47,x               ;
                    BNE   CODE_03E88C         ;
                    LDA.b #$01                ;
                    JSR.w CODE_03EB1A         ;
                    BEQ   CODE_03E88C         ;
                    JSR.w CODE_03E933         ;
                    BNE   CODE_03E894         ;
CODE_03E88C:        DEC.b $EB                 ;
                    INY                       ;
                    CPY.b #$18                ;
                    BCC   CODE_03E87A         ;
CODE_03E893:        RTS                       ;

CODE_03E894:        CPX.b #$09                ;
                    BEQ   CODE_03E8AA         ;
                    LDA.b $29,x               ;
                    ASL   A                   ;
                    BCC   CODE_03E8AA         ;
                    CPX.b #$09                ;
                    BEQ   CODE_03E8AA         ;
                    LDA.b #$01                ;
                    STA.w $1600               ;
                    JSL.l CODE_05D2B1         ;
CODE_03E8AA:        LDA.b $1C,x               ;
                    CMP.b #$05                ;
                    BNE   CODE_03E8B9         ;
                    LDA.b #$00                ;
                    STA.b $00                 ;
                    LDY.b #$FA                ;
                    JMP.w CODE_03CEC7         ;

CODE_03E8B9:        JMP.w CODE_03E1D8         ;

CODE_03E8BC:        LDA.w $021A,x             ;
                    SEC                       ;
                    SBC.w $0219               ;
                    STA.b $00                 ;
                    LDA.b $79,x               ;
                    SBC.b $78                 ;
                    RTS                       ;

CODE_03E8CA:        JSR.w CODE_03C726         ;
                    LDA.w $0238,x             ;
                    AND.b #$F0                ;
                    ORA.b #$08                ;
                    STA.w $0238,x             ;
                    RTS                       ;

CODE_03E8D8:        LDA.w $0238,x             ;
                    CLC                       ;
                    ADC.b #$3E                ;
                    CMP.b #$44                ;
                    RTS                       ;

CODE_03E8E1:        JSR.w CODE_03E8D8         ;
                    BCC   CODE_03E900         ;
                    LDA.b $A1,x               ;
                    CLC                       ;
                    ADC.b #$02                ;
                    CMP.b #$03                ;
                    BCC   CODE_03E900         ;
                    JSR.w CODE_03E92C         ;
                    BEQ   CODE_03E900         ;
                    JSR.w CODE_03E933         ;
                    BEQ   CODE_03E900         ;
                    JSR.w CODE_03E8CA         ;
                    LDA.b #$FD                ;
                    STA.b $A1,x               ;
CODE_03E900:        JMP.w CODE_03E86D         ;

CODE_03E903:        JSR.w CODE_03E92C         ;
                    BEQ   CODE_03E925         ;
                    CMP.b #$27                ;
                    BNE   CODE_03E914         ;
CODE_03E90C:        JSR.w CODE_03DD81         ;
                    LDA.b #$FC                ;
                    STA.b $A1,x               ;
                    RTS                       ;

CODE_03E914:        LDA.w $0792,x             ;
                    BNE   CODE_03E925         ;
                    LDA.b $29,x               ;
                    AND.b #$88                ;
                    STA.b $29,x               ;
                    JSR.w CODE_03E8CA         ;
                    JMP.w CODE_03E86D         ;

CODE_03E925:        LDA.b $29,x               ;
                    ORA.b #$01                ;
                    STA.b $29,x               ;
                    RTS                       ;

CODE_03E92C:        LDA.b #$00                ;
                    LDY.b #$15                ;
                    JMP.w CODE_03EB1A         ;

CODE_03E933:        CMP.b #$2A                ;
                    BEQ   CODE_03E945         ;
                    CMP.b #$E9                ;
                    BEQ   CODE_03E945         ;
                    CMP.b #$EA                ;
                    BEQ   CODE_03E945         ;
                    CMP.b #$62                ;
                    BEQ   CODE_03E945         ;
                    CMP.b #$63                ;
CODE_03E945:        RTS                       ;

CODE_03E946:        LDA.w $0242,x             ;
                    CMP.b #$18                ;
                    BCC   CODE_03E972         ;
                    JSR.w CODE_03EB2E         ;
                    BEQ   CODE_03E972         ;
                    JSR.w CODE_03E933         ;
                    BEQ   CODE_03E972         ;
                    LDA.b $AB,x               ;
                    BMI   CODE_03E978         ;
                    LDA.w $020D,x             ;
                    BNE   CODE_03E978         ;
                    LDA.b #$FD                ;
                    STA.b $AB,x               ;
                    LDA.b #$01                ;
                    STA.w $020D,x             ;
                    LDA.w $0242,x             ;
                    AND.b #$F8                ;
                    STA.w $0242,x             ;
                    RTS                       ;

CODE_03E972:        LDA.b #$00                ;
                    STA.w $020D,x             ;
                    RTS                       ;

CODE_03E978:        LDA.b #$80                ;
                    STA.b $33,x               ;
                    LDA.b #$01                ;
                    STA.w $1600               ;
                    RTS                       ;

                    db $02,$08

                    db $0E,$20,$03,$14,$0D,$20,$02,$14
                    db $0E,$20,$02,$09,$0E,$15,$00,$00
                    db $18,$06,$00,$00,$20,$0D,$00,$00
                    db $30,$0D,$00,$00,$08,$08,$06,$04
                    db $0A,$0C,$03,$0E,$0D,$14,$04,$04
                    db $1C,$1C,$04,$04,$0C,$1C,$03,$07
                    db $0D,$16

CODE_03E9B6:        TXA
                    CLC                       ;
                    ADC.b #$0B                ;
                    TAX                       ;
                    LDY.b #$02                ;
                    BNE   CODE_03E9C6         ;
CODE_03E9BF:        TXA                       ;
                    CLC                       ;
                    ADC.b #$0D                ;
                    TAX                       ;
                    LDY.b #$06                ;
CODE_03E9C6:        JSR.w CODE_03EA2D         ;
                    JMP.w CODE_03EA6F         ;

CODE_03E9CC:        LDY.b #$48                ;
                    STY.b $00                 ;
                    LDY.b #$44                ;
                    JMP.w CODE_03E9DB         ;

CODE_03E9D5:        LDY.b #$08                ;
                    STY.b $00                 ;
                    LDY.b #$04                ;
CODE_03E9DB:        LDA.w $021A,x             ;
                    SEC                       ;
                    SBC.w $071C               ;
                    STA.b $01                 ;
                    LDA.b $79,x               ;
                    SBC.w $071A               ;
                    BMI   CODE_03E9F1         ;
                    ORA.b $01                 ;
                    BEQ   CODE_03E9F1         ;
                    LDY.b $00                 ;
CODE_03E9F1:        TYA                       ;
                    AND.w $03D1               ;
                    STA.w $03D9,x             ;
                    CPX.b #$09                ;
                    BEQ   CODE_03EA0D         ;
                    LDA.w $03D9,x             ;
                    BNE   CODE_03EA1A         ;
                    JMP.w CODE_03EA0D         ;

CODE_03EA04:        INX                       ;
                    JSR.w CODE_03FE1E         ;
                    DEX                       ;
                    CMP.b #$FE                ;
                    BCS   CODE_03EA1A         ;
CODE_03EA0D:        TXA                       ;
                    CLC                       ;
                    ADC.b #$01                ;
                    TAX                       ;
                    LDY.b #$01                ;
                    JSR.w CODE_03EA2D         ;
                    JMP.w CODE_03EA6F         ;

CODE_03EA1A:        TXA                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.b #$FF                ;
                    STA.w $0FA0,y             ;
                    STA.w $0FA1,y             ;
                    STA.w $0FA2,y             ;
                    STA.w $0FA3,y             ;
                    RTS                       ;

CODE_03EA2D:        STX.b $00                 ;
                    LDA.w $03B8,y             ;
                    STA.b $02                 ;
                    LDA.w $03AD,y             ;
                    STA.b $01                 ;
                    TXA                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    PHA                       ;
                    TAY                       ;
                    LDA.w $048F,x             ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.b $01                 ;
                    CLC                       ;
                    ADC.w $E982,x             ;
                    STA.w $0F9C,y             ;
                    LDA.b $01                 ;
                    CLC                       ;
                    ADC.w $E984,x             ;
                    STA.w $0F9E,y             ;
                    INX                       ;
                    INY                       ;
                    LDA.b $02                 ;
                    CLC                       ;
                    ADC.w $E982,x             ;
                    STA.w $0F9C,y             ;
                    LDA.b $02                 ;
                    CLC                       ;
                    ADC.w $E984,x             ;
                    STA.w $0F9E,y             ;
                    PLA                       ;
                    TAY                       ;
                    LDX.b $00                 ;
                    RTS                       ;

CODE_03EA6F:        LDA.w $071C               ;
                    CLC                       ;
                    ADC.b #$80                ;
                    STA.b $02                 ;
                    LDA.w $071A               ;
                    ADC.b #$00                ;
                    STA.b $01                 ;
                    LDA.w $0219,x             ;
                    CMP.b $02                 ;
                    LDA.b $78,x               ;
                    SBC.b $01                 ;
                    BCC   CODE_03EA9E         ;
                    LDA.w $0F9E,y             ;
                    BMI   CODE_03EA9B         ;
                    LDA.b #$FF                ;
                    LDX.w $0F9C,y             ;
                    BMI   CODE_03EA98         ;
                    STA.w $0F9C,y             ;
CODE_03EA98:        STA.w $0F9E,y             ;
CODE_03EA9B:        LDX.b $9E                 ;
                    RTS                       ;

CODE_03EA9E:        LDA.w $0F9C,y             ;
                    BPL   CODE_03EAB4         ;
                    CMP.b #$A0                ;
                    BCC   CODE_03EAB4         ;
                    LDA.b #$00                ;
                    LDX.w $0F9E,y             ;
                    BPL   CODE_03EAB1         ;
                    STA.w $0F9E,y             ;
CODE_03EAB1:        STA.w $0F9C,y             ;
CODE_03EAB4:        LDX.b $9E                 ;
                    RTS                       ;

CODE_03EAB7:        LDX.b #$00                ;
CODE_03EAB9:        STY.b $06                 ;
                    LDA.b #$01                ;
                    STA.b $07                 ;
CODE_03EABF:        LDA.w $0F9C,y             ;
                    CMP.w $0F9C,x             ;
                    BCS   CODE_03EAF1         ;
                    CMP.w $0F9E,x             ;
                    BCC   CODE_03EADE         ;
                    BEQ   CODE_03EB10         ;
                    LDA.w $0F9E,y             ;
                    CMP.w $0F9C,y             ;
                    BCC   CODE_03EB10         ;
                    CMP.w $0F9C,x             ;
                    BCS   CODE_03EB10         ;
                    LDY.b $06                 ;
                    RTS                       ;

CODE_03EADE:        LDA.w $0F9E,x             ;
                    CMP.w $0F9C,x             ;
                    BCC   CODE_03EB10         ;
                    LDA.w $0F9E,y             ;
                    CMP.w $0F9C,x             ;
                    BCS   CODE_03EB10         ;
                    LDY.b $06                 ;
                    RTS                       ;

CODE_03EAF1:        CMP.w $0F9C,x             ;
                    BEQ   CODE_03EB10         ;
                    CMP.w $0F9E,x             ;
                    BCC   CODE_03EB10         ;
                    BEQ   CODE_03EB10         ;
                    CMP.w $0F9E,y             ;
                    BCC   CODE_03EB0C         ;
                    BEQ   CODE_03EB0C         ;
                    LDA.w $0F9E,y             ;
                    CMP.w $0F9C,x             ;
                    BCS   CODE_03EB10         ;
CODE_03EB0C:        CLC                       ;
                    LDY.b $06                 ;
                    RTS                       ;

CODE_03EB10:        INX                       ;
                    INY                       ;
                    DEC.b $07                 ;
                    BPL   CODE_03EABF         ;
                    SEC                       ;
                    LDY.b $06                 ;
                    RTS                       ;

CODE_03EB1A:        PHA                       ;
                    TXA                       ;
                    CLC                       ;
                    ADC.b #$01                ;
                    TAX                       ;
                    PLA                       ;
                    JMP.w CODE_03EB37         ;

                    TXA                       ;
                    CLC                       ;
                    ADC.b #$11                ;
                    TAX                       ;
                    LDY.b #$1B                ;
                    JMP.w CODE_03EB35         ;

CODE_03EB2E:        LDY.b #$1A                ;
                    TXA                       ;
                    CLC                       ;
                    ADC.b #$0B                ;
                    TAX                       ;
CODE_03EB35:        LDA.b #$00                ;
CODE_03EB37:        JSR.w CODE_03EB83         ;
                    LDX.b $9E                 ;
                    CMP.b #$00                ;
                    RTS                       ;

                    db $00,$07,$0E            ; Mario<->block interaction "offset". Big Mario, Big swimming Mario, Small Mario

                    db $08,$03,$0C,$02,$02,$0D,$0D,$08
                    db $03,$0C,$02,$02,$0D,$0D,$08,$03
                    db $0C,$02,$02,$0D,$0D,$08,$00,$10
                    db $04,$14,$04,$04

                    db $04,$20,$20,$08,$18,$08,$18,$02
                    db $20,$20,$08,$18,$08,$18,$12,$20
                    db $20,$18,$18,$18,$18,$18,$14,$14
                    db $06,$06,$08,$10

CODE_03EB7A:        INY                       ;
CODE_03EB7B:        LDA.b #$00                ;
                    BRA   CODE_03EB81         ;

CODE_03EB7F:        LDA.b #$01                ;
CODE_03EB81:        LDX.b #$00                ;
CODE_03EB83:        PHA                       ;
                    STY.b $04                 ;
                    LDA.w $EB42,y             ;\
                    CLC                       ; |
                    ADC.w $0219,x             ; |X-position of Mario sprite
                    STA.b $05                 ; |
                    LDA.b $78,x               ; |Screen of player
                    ADC.b #$00                ; |
                    AND.b #$01                ; |
                    LSR   A                   ; |
                    ORA.b $05                 ; |
                    ROR   A                   ; |
                    LSR   A                   ; |
                    LSR   A                   ; |
                    LSR   A                   ;/
                    JSR.w CODE_03ACF6         ;put values in $06 for indirect pointer?
                    LDY.b $04                 ;
                    LDA.w $0237,x             ;\Y-position of Mario sprite
                    CLC                       ; |
                    ADC.w $EB5E,y             ; |$7E0002 = (((MarioYpos+TableEB5E)&0xF0)-0x20)
                    AND.b #$F0                ; |Is that 0x20 here to compensate for that status-bar area?
                    SEC                       ; |
                    SBC.b #$20                ; |
                    STA.b $02                 ;/
                    TAY                       ;
                    LDA.b ($06),y             ;\Store block Mario is interacting with in $03
                    STA.b $03                 ;/This indirect pointer points to the $0500 area. It contains
                    LDY.b $04                 ;the object layout of the current screen.
                    PLA                       ;
                    BNE   CODE_03EBBF         ;
                    LDA.w $0237,x             ;
                    JMP.w CODE_03EBC2         ;

CODE_03EBBF:        LDA.w $0219,x             ;
CODE_03EBC2:        AND.b #$0F                ;
                    STA.b $04                 ;
                    LDA.b $E4                 ;
                    BNE   CODE_03EBD6         ;
                    LDA.b $03                 ;
                    CMP.b #$62                ;
                    BEQ   CODE_03EBD4         ;
                    CMP.b #$63                ;
                    BNE   CODE_03EBD6         ;
CODE_03EBD4:        STZ.b $03                 ;
CODE_03EBD6:        LDA.b $03                 ;
                    RTS                       ;

                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ;empty
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
                    db $FF,$FF,$FF,$FF,$FF,$FF,$FF

                    LDX.b #$06                ;
CODE_03EC12:        STA.w $0800,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    DEX                       ;
                    BNE   CODE_03EC12         ;
                    LDY.b $02                 ;
                    RTS                       ;

CODE_03EC22:        LDX.b #$06                ;
CODE_03EC24:        STA.w $0900,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    DEX                       ;
                    BNE   CODE_03EC24         ;
                    LDY.b $02                 ;
                    RTS                       ;

                    LDA.b #$F0                ;
                    STA.w $0815,y             ;
                    STA.w $0811,y             ;
CODE_03EC3C:        STA.w $080D,y             ;
                    STA.w $0809,y             ;
CODE_03EC42:        STA.w $0805,y             ;
                    STA.w $0801,y             ;
                    RTS                       ;

CODE_03EC49:        LDA.b #$F0                ;
CODE_03EC4B:        STA.w $0915,y             ;
                    STA.w $0911,y             ;
CODE_03EC51:        STA.w $090D,y             ;
CODE_03EC54:        STA.w $0909,y             ;
CODE_03EC57:        STA.w $0905,y             ;
                    STA.w $0901,y             ;
                    RTS                       ;

CODE_03EC5E:        LDA.w $0743               ;
                    BEQ   CODE_03EC66         ;
                    JMP.w CODE_03ECEA         ;

CODE_03EC66:        LDY.w $0B46,x             ;
                    STY.b $02                 ;
                    LDA.w $03AE               ;
                    JSR.w CODE_03EC22         ;
                    LDX.b $9E                 ;
                    LDA.w $0238,x             ;
                    JSR.w CODE_03EC51         ;
                    LDY.b $5C                 ;
                    CPY.b #$03                ;
                    BEQ   CODE_03EC84         ;
                    LDY.w $06CC               ;
                    BEQ   CODE_03EC86         ;
CODE_03EC84:        LDA.b #$F0                ;
CODE_03EC86:        LDY.w $0B46,x             ;
                    STA.w $0911,y             ;
                    STA.w $0915,y             ;
                    LDA.b #$87                ;
                    LDX.b $9E                 ;
                    INY                       ;
                    JSR.w CODE_03EC4B         ;
                    LDA.b #$2C                ;
                    INY                       ;
                    JSR.w CODE_03EC4B         ;
                    JSR.w CODE_03FE1E         ;
                    LDY.w $0B46,x             ;
                    JSR.w CODE_03FEAC         ;
                    JSR.w CODE_03FEC5         ;
                    PHY                       ;
                    JSR.w CODE_03FF3B         ;
                    JSR.w CODE_03FEC5         ;
                    JSR.w CODE_03FF3B         ;
                    JSR.w CODE_03FEC5         ;
                    JSR.w CODE_03FF3B         ;
                    JSR.w CODE_03FEC5         ;
                    JSR.w CODE_03FF3B         ;
                    JSR.w CODE_03FEC5         ;
                    JSR.w CODE_03FF3B         ;
                    JSR.w CODE_03FEC5         ;
                    PLY                       ;
                    LDA.w $03D1               ;
                    ASL   A                   ;
                    BCC   CODE_03ECE9         ;
                    LDA.b $1C,x               ;
                    CMP.b #$27                ;
                    BEQ   CODE_03ECE9         ;
                    CMP.b #$26                ;
                    BEQ   CODE_03ECE9         ;
                    LDA.b $BC,x               ;
                    CMP.b #$01                ;
                    BNE   CODE_03ECE6         ;
                    LDA.w $03B9               ;
                    CMP.b #$F0                ;
                    BCC   CODE_03ECE9         ;
CODE_03ECE6:        JSR.w CODE_03EC49         ;
CODE_03ECE9:        RTS                       ;

CODE_03ECEA:        JSL.l CODE_05CDEB         ;
                    RTS                       ;

                    db $E9,$EA,$78,$79,$D6,$D6,$D9,$D9
                    db $8D,$8D,$E4,$E4,$E9,$EA,$78,$79
                    db $2C,$28,$28,$2A

CODE_03ED03:        LDA.w $0B4F               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    TAY                       ;
                    LDA.w $03B9               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.b $02                 ;
                    LDA.w $03AE               ;
                    STA.b $05                 ;
                    LDX.w $020C               ;
                    LDA.w $ECFF,x             ;
                    EOR.w $0260               ;
                    STA.b $04                 ;
                    TXA                       ;
                    PHA                       ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.b #$01                ;
                    STA.b $07                 ;
                    STA.b $03                 ;
CODE_03ED2D:        LDA.w $ECEF,x             ;
                    STA.b $00                 ;
                    LDA.w $ECF0,x             ;
                    JSR.w CODE_03F2FF         ;
                    DEC.b $07                 ;
                    BPL   CODE_03ED2D         ;
                    LDA.w $0B4F               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    TAY                       ;
                    PLA                       ;
                    BEQ   CODE_03ED82         ;
                    CMP.b #$03                ;
                    BEQ   CODE_03ED82         ;
                    STA.b $00                 ;
                    LDA.b $09                 ;
                    AND.b #$06                ;
                    CMP.b #$06                ;
                    BNE   CODE_03ED56         ;
                    LDA.b #$0E                ;
CODE_03ED56:        ORA.w $0260               ;
                    EOR.b #$28                ;
                    STA.w $0903,y             ;
                    STA.w $0907,y             ;
                    STA.w $090B,y             ;
                    STA.w $090F,y             ;
                    LDX.b $00                 ;
                    DEX                       ;
                    BEQ   CODE_03ED72         ;
                    STA.w $090B,y             ;
                    STA.w $090F,y             ;
CODE_03ED72:        LDA.w $0907,y             ;
                    ORA.b #$40                ;
                    STA.w $0907,y             ;
                    LDA.w $090F,y             ;
                    ORA.b #$40                ;
                    STA.w $090F,y             ;
CODE_03ED82:        LDA.w $0B4F               ;
                    CLC                       ;
                    ADC.b #$08                ;
                    TAY                       ;
                    JMP.w CODE_03F2AF         ;

                    db $FC,$FC,$AA,$AB,$AC,$AD,$FC,$FC
                    db $AE,$AF,$B0,$B1,$FC,$A5,$A6,$A7
                    db $A8,$A9,$FC,$A0,$A1,$A2,$A3,$A4
                    db $69,$A5,$6A,$A7,$A8,$A9,$6B,$A0
                    db $6C,$A2,$A3,$A4,$FC,$FC,$96,$97
                    db $98,$99,$FC,$FC,$9A,$9B,$9C,$9D
                    db $FC,$FC,$8F,$8E,$8E,$8F,$FC,$FC
                    db $95,$94,$94,$95,$FC,$FC,$DC,$DC
                    db $DF,$DF,$DC,$DC,$DD,$DD,$DE,$DE
                    db $FC,$FC,$B2,$B3,$B4,$B5,$FC,$FC
                    db $B6,$B3,$B7,$B5,$FC,$FC,$C6,$C7
                    db $C8,$C9,$FC,$FC,$6E,$6E,$6F,$6F
                    db $FC,$FC,$6D,$6D,$6F,$6F,$FC,$FC
                    db $6F,$6F,$6E,$6E,$FC,$FC,$6F,$6F
                    db $6D,$6D,$FC,$FC,$F4,$F4,$F5,$F5
                    db $FC,$FC,$F4,$F4,$F5,$F5,$FC,$FC
                    db $F5,$F5,$F4,$F4,$FC,$FC,$F5,$F5
                    db $F4,$F4,$FC,$FC,$FC,$FC,$EF,$EF
                    db $B9,$B8,$BB,$BA,$BC,$BC,$FC,$FC
                    db $BD,$BD,$BC,$BC,$7A,$7B,$DA,$DB
                    db $D8,$9E,$CD,$CD,$CE,$CE,$CF,$CF
                    db $7D,$7C,$D1,$8C,$D3,$D2,$7D,$7C
                    db $89,$88,$8B,$8A,$D5,$D4,$E3,$E2
                    db $D3,$D2,$D5,$D4,$E3,$E2,$8B,$8A
                    db $E5,$E5,$E6,$E6,$EB,$EB,$EC,$EC
                    db $ED,$ED,$EB,$EB,$FC,$FC,$D0,$D0
                    db $D7,$D7,$BF,$BE,$C1,$C0,$C2,$FC
                    db $C4,$C3,$C6,$C5,$C8,$C7,$BF,$BE
                    db $CA,$C9,$C2,$FC,$C4,$C3,$C6,$C5
                    db $CC,$CB,$FC,$FC,$64,$65,$74,$75
                    db $F2,$F2,$F3,$F3,$F2,$F2,$F1,$F1
                    db $F1,$F1,$FC,$FC,$F0,$F0,$FC,$FC
                    db $FC,$FC,$0C,$0C,$00,$0C,$0C,$A8
                    db $54,$3C,$EA,$18,$48,$48,$CC,$C0
                    db $18,$18,$18,$90,$24,$FF,$48,$9C
                    db $D2,$D8,$F0,$F6,$FC,$0A,$0C,$0A
                    db $0C,$0A,$0A,$02,$08,$0A,$08,$0A
                    db $0C,$08,$2A,$0A,$0C,$0A,$0A,$0C
                    db $FF,$0C,$0C,$00,$00,$2C,$2C,$2C
                    db $08,$18,$18,$19,$1A,$19,$18,$00
                    db $00,$00,$00,$00,$00,$06,$06,$06
                    db $06,$06,$06,$0C,$0C,$0C,$0C,$0C
                    db $0C,$FC,$FC,$D0,$D0,$D7,$D7,$FC
                    db $FC,$7E,$7E,$7F,$7F,$FC,$FC,$E0
                    db $E0,$E1,$E1

CODE_03EEEF:        LDA.b $1C,x               ;
                    CMP.b #$0C                ;
                    BNE   CODE_03EEFA         ;
                    JSL.l CODE_05EA38         ;
                    RTS                       ;

CODE_03EEFA:        CMP.b #$08                ;
                    BNE   CODE_03EF0C         ;
                    LDA.b $BC,x               ;
                    CMP.b #$02                ;
                    BNE   CODE_03EF07         ;
                    JSR.w CODE_03CDE2         ;
CODE_03EF07:        JSL.l CODE_05CB42         ;
                    RTS                       ;

CODE_03EF0C:        CMP.b #$33                ;
                    BNE   CODE_03EF1E         ;
                    LDA.b $BC,x               ;
                    CMP.b #$02                ;
                    BNE   CODE_03EF19         ;
                    JSR.w CODE_03CDE2         ;
CODE_03EF19:        JSL.l CODE_05CB42         ;
                    RTS                       ;

CODE_03EF1E:        CMP.b #$2D                ;
                    BNE   CODE_03EF27         ;
                    JSL.l CODE_05D055         ;
                    RTS                       ;

CODE_03EF27:        CMP.b #$35                ;
                    BNE   CODE_03EF3C         ;
                    LDA.w $075F               ;
                    CMP.b #$07                ;
                    BEQ   CODE_03EF37         ;
                    JSL.l CODE_04ED7A         ;
                    RTS                       ;

CODE_03EF37:        JSL.l CODE_04DCBB         ;
                    RTS                       ;

CODE_03EF3C:        LDA.w $0238,x             ;
                    STA.b $02                 ;
                    LDA.w $03AE               ;
                    STA.b $05                 ;
                    LDY.w $0B46,x             ;
                    STY.b $EB                 ;
                    LDA.b #$00                ;
                    STA.b $F0                 ;
                    LDA.b $47,x               ;
                    STA.b $03                 ;
                    LDA.w $0257,x             ;
                    STA.b $04                 ;
                    LDA.b $1C,x               ;
                    CMP.b #$0D                ;
                    BNE   CODE_03EF68         ;
                    LDY.b $5E,x               ;
                    BMI   CODE_03EF68         ;
                    LDY.w $0792,x             ;
                    BEQ   CODE_03EF68         ;
                    RTS                       ;

CODE_03EF68:        LDA.b $29,x               ;
                    STA.b $ED                 ;
                    AND.b #$1F                ;
                    TAY                       ;
                    LDA.b $1C,x               ;
                    CMP.b #$35                ;
                    BNE   CODE_03EF7D         ;
                    LDY.b #$00                ;
                    LDA.b #$01                ;
                    STA.b $03                 ;
                    LDA.b #$15                ;
CODE_03EF7D:        CMP.b #$33                ;
                    BNE   CODE_03EF94         ;
                    DEC.b $02                 ;
                    LDA.b #$20                ;
                    LDY.w $0792,x             ;
                    BEQ   CODE_03EF8C         ;
                    EOR.b #$30                ;
CODE_03EF8C:        STA.b $04                 ;
                    LDY.b #$00                ;
                    STY.b $ED                 ;
                    LDA.b #$08                ;
CODE_03EF94:        CMP.b #$32                ;
                    BNE   CODE_03EFA0         ;
                    LDY.b #$03                ;
                    LDX.w $070E               ;
                    LDA.w $EEC6,x             ;
CODE_03EFA0:        STA.b $EF                 ;
                    STY.b $EC                 ;
                    LDX.b $9E                 ;
                    CMP.b #$0C                ;
                    BNE   CODE_03EFB0         ;
                    LDA.b $A1,x               ;
                    BMI   CODE_03EFB0         ;
                    INC.b $F0                 ;
CODE_03EFB0:        LDA.w $036A               ;
                    BEQ   CODE_03EFBE         ;
                    LDY.b #$16                ;
                    CMP.b #$01                ;
                    BEQ   CODE_03EFBC         ;
                    INY                       ;
CODE_03EFBC:        STY.b $EF                 ;
CODE_03EFBE:        LDY.b $EF                 ;
                    CPY.b #$06                ;
                    BNE   CODE_03EFE1         ;
                    LDA.b $29,x               ;
                    CMP.b #$02                ;
                    BCC   CODE_03EFCE         ;
                    LDX.b #$04                ;
                    STX.b $EC                 ;
CODE_03EFCE:        AND.b #$20                ;
                    ORA.w $0747               ;
                    BNE   CODE_03EFE1         ;
                    LDA.b $09                 ;
                    AND.b #$08                ;
                    BNE   CODE_03EFE1         ;
                    LDA.b $03                 ;
                    EOR.b #$03                ;
                    STA.b $03                 ;
CODE_03EFE1:        LDA.w $EEA9,y             ;
                    CPY.b #$14                ;
                    BNE   CODE_03EFEC         ;
                    LDA.b #$3C                ;
                    BRA   CODE_03EFEE         ;

CODE_03EFEC:        EOR.b $04                 ;
CODE_03EFEE:        STA.b $04                 ;
                    CPY.b #$15                ;
                    BNE   CODE_03F003         ;
                    LDA.w $075F               ;
                    CMP.b #$07                ;
                    BNE   CODE_03F003         ;
                    LDA.b $04                 ;
                    AND.b #$F0                ;
                    ORA.b #$04                ;
                    STA.b $04                 ;
CODE_03F003:        LDA.w $0E85               ;
                    BEQ   CODE_03F011         ;
                    LDA.w $EE8E,y             ;
                    CLC                       ;
                    ADC.b #$06                ;
                    TAX                       ;
                    BRA   CODE_03F015         ;

CODE_03F011:        LDA.w $EE8E,y             ;
                    TAX                       ;
CODE_03F015:        LDY.b $EC                 ;
                    LDA.w $036A               ;
                    BEQ   CODE_03F04A         ;
                    CMP.b #$01                ;
                    BNE   CODE_03F032         ;
                    LDA.w $0363               ;
                    BPL   CODE_03F027         ;
                    LDX.b #$DE                ;
CODE_03F027:        LDA.b $ED                 ;
                    AND.b #$20                ;
                    BEQ   CODE_03F02F         ;
CODE_03F02D:        STX.b $F0                 ;
CODE_03F02F:        JMP.w CODE_03F12D         ;

CODE_03F032:        LDA.w $0363               ;
                    AND.b #$01                ;
                    BEQ   CODE_03F03B         ;
                    LDX.b #$E4                ;
CODE_03F03B:        LDA.b $ED                 ;
                    AND.b #$20                ;
                    BEQ   CODE_03F02F         ;
                    LDA.b $02                 ;
                    SEC                       ;
                    SBC.b #$10                ;
                    STA.b $02                 ;
                    BRA   CODE_03F02D         ;

CODE_03F04A:        CPX.b #$24                ;
                    BNE   CODE_03F05E         ;
                    CPY.b #$05                ;
                    BNE   CODE_03F05C         ;
                    LDX.b #$30                ;
                    LDA.b #$02                ;
                    STA.b $03                 ;
                    LDA.b #$05                ;
                    STA.b $EC                 ;
CODE_03F05C:        BRA   CODE_03F0AE         ;

CODE_03F05E:        CPX.b #$90                ;
                    BNE   CODE_03F074         ;
                    LDA.b $ED                 ;
                    AND.b #$20                ;
                    BNE   CODE_03F071         ;
                    LDA.w $079B               ;
                    CMP.b #$10                ;
                    BCS   CODE_03F071         ;
                    LDX.b #$96                ;
CODE_03F071:        JMP.w CODE_03F11A         ;

CODE_03F074:        LDA.b $EF                 ;
                    CMP.b #$04                ;
                    BCS   CODE_03F08A         ;
                    CPY.b #$02                ;
                    BCC   CODE_03F08A         ;
                    LDX.b #$5A                ;
                    LDY.b $EF                 ;
                    CPY.b #$02                ;
                    BNE   CODE_03F08A         ;
                    LDX.b #$7E                ;
                    INC.b $02                 ;
CODE_03F08A:        LDA.b $EC                 ;
                    CMP.b #$04                ;
                    BNE   CODE_03F0AE         ;
                    LDX.b #$72                ;
                    INC.b $02                 ;
                    LDY.b $EF                 ;
                    CPY.b #$02                ;
                    BEQ   CODE_03F09E         ;
                    LDX.b #$66                ;
                    INC.b $02                 ;
CODE_03F09E:        CPY.b #$06                ;
                    BNE   CODE_03F0AE         ;
                    LDX.b #$54                ;
                    LDA.b $ED                 ;
                    AND.b #$20                ;
                    BNE   CODE_03F0AE         ;
                    LDX.b #$8A                ;
                    DEC.b $02                 ;
CODE_03F0AE:        LDY.b $9E                 ;
                    LDA.b $EF                 ;
                    CMP.b #$05                ;
                    BNE   CODE_03F0C2         ;
                    LDA.b $ED                 ;
                    BEQ   CODE_03F0DD         ;
                    AND.b #$08                ;
                    BEQ   CODE_03F11A         ;
                    LDX.b #$B4                ;
                    BNE   CODE_03F0DD         ;
CODE_03F0C2:        CPX.b #$48                ;
                    BEQ   CODE_03F0DD         ;
                    LDA.w $07A2,y             ;
                    CMP.b #$05                ;
                    BCS   CODE_03F11A         ;
                    CPX.b #$3C                ;
                    BNE   CODE_03F0DD         ;
                    CMP.b #$01                ;
                    BEQ   CODE_03F11A         ;
                    INC.b $02                 ;
                    INC.b $02                 ;
                    INC.b $02                 ;
                    BRA   CODE_03F10C         ;

CODE_03F0DD:        LDA.b $EF                 ;
                    CMP.b #$06                ;
                    BEQ   CODE_03F11A         ;
                    CMP.b #$08                ;
                    BEQ   CODE_03F11A         ;
                    CMP.b #$0C                ;
                    BEQ   CODE_03F11A         ;
                    CMP.b #$18                ;
                    BCS   CODE_03F11A         ;
                    LDY.b #$00                ;
                    CMP.b #$15                ;
                    BNE   CODE_03F105         ;
                    INY                       ;
                    LDA.w $075F               ;
                    CMP.b #$07                ;
                    BCS   CODE_03F11A         ;
                    LDX.b #$A2                ;
                    LDA.b #$03                ;
                    STA.b $EC                 ;
                    BNE   CODE_03F11A         ;
CODE_03F105:        LDA.b $09                 ;
                    AND.w $EEC4,y             ;
                    BNE   CODE_03F11A         ;
CODE_03F10C:        LDA.b $ED                 ;
                    AND.b #$A0                ;
                    ORA.w $0747               ;
                    BNE   CODE_03F11A         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.b #$06                ;
                    TAX                       ;
CODE_03F11A:        LDA.b $ED                 ;
                    AND.b #$20                ;
                    BEQ   CODE_03F12D         ;
                    LDA.b $EF                 ;
                    CMP.b #$04                ;
                    BCC   CODE_03F12D         ;
                    LDY.b #$01                ;
                    STY.b $F0                 ;
                    DEY                       ;
                    STY.b $EC                 ;
CODE_03F12D:        LDY.b $EB                 ;
                    JSL.l CODE_05E879         ;
                    BCS   CODE_03F142         ;
                    JSR.w CODE_03F2F7         ;
                    JSR.w CODE_03F2F7         ;
                    JSR.w CODE_03F2F7         ;
                    JSL.l CODE_05E95A         ;
CODE_03F142:        LDX.b $9E                 ;
                    LDY.w $0B46,x             ;
                    LDA.b $1C,x               ;
                    CMP.b #$0C                ;
                    BNE   CODE_03F188         ;
                    INC.w $0E1B,x             ;
                    LDA.w $0E1B,x             ;
                    CMP.b #$12                ;
                    BCC   CODE_03F15D         ;
                    STZ.w $0E1B,x             ;
                    LDA.w $0E1B,x             ;
CODE_03F15D:        TAX                       ;
                    LDA.w $EECB,x             ;
                    TAX                       ;
                    LDA.w $EEDD,x             ;
                    STA.w $0902,y             ;
                    LDA.w $EEDE,x             ;
                    STA.w $0906,y             ;
                    LDA.w $EEDF,x             ;
                    STA.w $090A,y             ;
                    LDA.w $EEE0,x             ;
                    STA.w $090E,y             ;
                    LDA.w $EEE1,x             ;
                    STA.w $0912,y             ;
                    LDA.w $EEE2,x             ;
                    STA.w $0916,y             ;
                    LDX.b $9E                 ;
CODE_03F188:        LDA.b $EF                 ;
                    CMP.b #$08                ;
                    BNE   CODE_03F191         ;
CODE_03F18E:        JMP.w CODE_03F295         ;

CODE_03F191:        LDA.b $F0                 ;
                    BEQ   CODE_03F1D2         ;
                    LDA.w $0903,y             ;
                    ORA.b #$80                ;
                    INY                       ;
                    INY                       ;
                    JSR.w CODE_03EC4B         ;
                    DEY                       ;
                    DEY                       ;
                    TYA                       ;
                    TAX                       ;
                    LDA.b $EF                 ;
                    CMP.b #$05                ;
                    BEQ   CODE_03F1B6         ;
                    CMP.b #$11                ;
                    BEQ   CODE_03F1B6         ;
                    CMP.b #$15                ;
                    BCS   CODE_03F1B6         ;
                    TXA                       ;
                    CLC                       ;
                    ADC.b #$08                ;
                    TAX                       ;
CODE_03F1B6:        LDA.w $0902,x             ;
                    PHA                       ;
                    LDA.w $0906,x             ;
                    PHA                       ;
                    LDA.w $0912,y             ;
                    STA.w $0902,x             ;
                    LDA.w $0916,y             ;
                    STA.w $0906,x             ;
                    PLA                       ;
                    STA.w $0916,y             ;
                    PLA                       ;
                    STA.w $0912,y             ;
CODE_03F1D2:        LDA.w $036A               ;
                    BNE   CODE_03F18E         ;
                    LDA.b $EF                 ;
                    LDX.b $EC                 ;
                    CMP.b #$05                ;
                    BNE   CODE_03F1E2         ;
                    JMP.w CODE_03F295         ;

CODE_03F1E2:        CMP.b #$07                ;
                    BEQ   CODE_03F1FA         ;
                    CMP.b #$0D                ;
                    BEQ   CODE_03F1FA         ;
                    CMP.b #$0C                ;
                    BEQ   CODE_03F1FA         ;
                    CMP.b #$12                ;
                    BNE   CODE_03F1F6         ;
                    CPX.b #$05                ;
                    BNE   CODE_03F23A         ;
CODE_03F1F6:        CPX.b #$02                ;
                    BCC   CODE_03F23A         ;
CODE_03F1FA:        LDA.w $036A               ;
                    BNE   CODE_03F23A         ;
                    LDA.w $0F49               ;
                    BNE   CODE_03F23A         ;
                    LDA.w $0903,y             ;
                    AND.b #$BE                ;
                    STA.w $0903,y             ;
                    STA.w $090B,y             ;
                    STA.w $0913,y             ;
                    ORA.b #$40                ;
                    CPX.b #$05                ;
                    BNE   CODE_03F21A         ;
                    ORA.b #$80                ;
CODE_03F21A:        STA.w $0907,y             ;
                    STA.w $090F,y             ;
                    STA.w $0917,y             ;
                    CPX.b #$04                ;
                    BNE   CODE_03F23A         ;
                    LDA.w $090B,y             ;
                    ORA.b #$80                ;
                    STA.w $090B,y             ;
                    STA.w $0913,y             ;
                    ORA.b #$40                ;
                    STA.w $090F,y             ;
                    STA.w $0917,y             ;
CODE_03F23A:        LDA.b $EF                 ;
                    CMP.b #$11                ;
                    BNE   CODE_03F275         ;
                    LDA.b $F0                 ;
                    BNE   CODE_03F265         ;
                    LDA.w $0913,y             ;
                    AND.b #$BF                ;
                    STA.w $0913,y             ;
                    LDA.w $0917,y             ;
                    ORA.b #$40                ;
                    STA.w $0917,y             ;
                    LDX.w $079B               ;
                    CPX.b #$10                ;
                    BCS   CODE_03F295         ;
                    STA.w $090F,y             ;
                    AND.b #$BF                ;
                    STA.w $090B,y             ;
                    BCC   CODE_03F295         ;
CODE_03F265:        LDA.w $0903,y             ;
                    AND.b #$BF                ;
                    STA.w $0903,y             ;
                    LDA.w $0907,y             ;
                    ORA.b #$40                ;
                    STA.w $0907,y             ;
CODE_03F275:        LDA.b $EF                 ;
                    CMP.b #$18                ;
                    BCC   CODE_03F295         ;
                    LDA.b #$AC                ;
                    STA.w $090B,y             ;
                    STA.w $0913,y             ;
                    ORA.b #$40                ;
                    STA.w $090F,y             ;
                    STA.w $0917,y             ;
                    AND.b #$3F                ;
                    STA.w $0903,y             ;
                    ORA.b #$40                ;
                    STA.w $0907,y             ;
CODE_03F295:        LDA.b $EF                 ;
                    CMP.b #$0D                ;
                    BNE   CODE_03F2AF         ;
                    LDA.w $0913,y             ;
                    AND.b #$F0                ;
                    ORA.b #$08                ;
                    STA.w $0913,y             ;
                    LDA.w $0917,y             ;
                    AND.b #$F0                ;
                    ORA.b #$08                ;
                    STA.w $0917,y             ;
CODE_03F2AF:        LDX.b $9E                 ;
                    JSR.w CODE_03FEAC         ;
                    STZ.b $04                 ;
                    JSR.w CODE_03FEE5         ;
                    JSR.w CODE_03FF3B         ;
                    STZ.b $04                 ;
                    JSR.w CODE_03FEE5         ;
                    DEY                       ;
                    DEY                       ;
                    DEY                       ;
                    DEY                       ;
                    LDA.w $03D1               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    PHA                       ;
                    BCC   CODE_03F2D6         ;
                    LDA.b #$10                ;
                    JSR.w CODE_03F313         ;
CODE_03F2D6:        PLA                       ;
                    LSR   A                   ;
                    PHA                       ;
                    BCC   CODE_03F2E0         ;
                    LDA.b #$08                ;
                    JSR.w CODE_03F313         ;
CODE_03F2E0:        PLA                       ;
                    LSR   A                   ;
                    BCC   CODE_03F2F6         ;
                    JSR.w CODE_03F313         ;
                    LDA.b $1C,x               ;
                    CMP.b #$0C                ;
                    BEQ   CODE_03F2F6         ;
                    LDA.b $BC,x               ;
                    CMP.b #$02                ;
                    BNE   CODE_03F2F6         ;
                    JSR.w CODE_03CDE2         ;
CODE_03F2F6:        RTS                       ;

CODE_03F2F7:        LDA.w $ED8C,x             ;
                    STA.b $00                 ;
                    LDA.w $ED8D,x             ;
CODE_03F2FF:        STA.b $01                 ;
                    LDA.b $02                 ;
                    CMP.b #$F9                ;
                    BNE   CODE_03F30B         ;
                    LDA.b #$F0                ;
                    STA.b $02                 ;
CODE_03F30B:        JMP.w CODE_03FF96         ;

CODE_03F30E:        STA.b $01                 ;
                    JMP.w CODE_03FF4E         ;

CODE_03F313:        STX.b $9E                 ;
                    CPX.b #$0A                ;
                    BNE   CODE_03F31A         ;
                    DEX                       ;
CODE_03F31A:        CLC                       ;
                    ADC.w $0B46,x             ;
                    TAY                       ;
                    LDA.b #$F0                ;
                    LDX.b $9E                 ;
                    JMP.w CODE_03EC57         ;

                    STX.b $9E                 ;
                    CPX.b #$0A                ;
                    BNE   CODE_03F32D         ;
                    DEX                       ;
CODE_03F32D:        CLC                       ;
                    ADC.w $0B46,x             ;
                    TAY                       ;
                    LDA.b #$F0                ;
                    STA.w $0901,y             ;
                    STA.w $0909,y             ;
                    STA.w $0911,y             ;
                    LDX.b $9E                 ;
                    RTS                       ;

                    LDA.b #$01                ;
                    STA.w $0D00,y             ;
                    STA.w $0D08,y             ;
                    STA.w $0D10,y             ;
                    RTS                       ;

                    LDA.b #$01                ;
                    STA.w $0D04,y             ;
                    STA.w $0D0C,y             ;
                    STA.w $0D14,y             ;
                    RTS                       ;

CODE_03F358:        LDY.w $0B51,x             ;
                    LDA.w $03B1               ;
                    STA.w $0800,y             ;
                    LDA.w $03BC               ;
                    STA.w $0801,y             ;
                    LDA.b #$2B                ;
                    STA.w $0803,y             ;
                    LDA.b #$02                ;
                    STA.w $0C00,y             ;
                    LDA.w $03EA,x             ;
                    CMP.b #$FC                ;
                    BNE   CODE_03F37C         ;
                    LDA.b #$00                ;
                    BRA   CODE_03F37E         ;

CODE_03F37C:        LDA.b #$02                ;
CODE_03F37E:        STA.w $0802,y             ;
                    LDA.b $85,x               ;
                    STA.b $E5                 ;
                    LDA.w $0226,x             ;
                    STA.b $E4                 ;
                    REP   #$20                ;
                    LDA.b $E4                 ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.b $E4                 ;
                    SEP   #$20                ;
                    LDA.b $E5                 ;
                    BEQ   CODE_03F39E         ;
                    LDA.b #$03                ;
                    STA.w $0C00,y             ;
CODE_03F39E:        RTS                       ;

                    AND.b #$08                ;
                    BEQ   CODE_03F3AB         ;
                    LDA.b #$F0                ;
                    STA.w $0801,y             ;
                    STA.w $0809,y             ;
CODE_03F3AB:        RTS                       ;

CODE_03F3AC:        LDA.b #$2C                ;
                    STA.b $00                 ;
                    LDA.b #$75                ;
                    LDY.b $0F                 ;
                    CPY.b #$05                ;
                    BEQ   CODE_03F3BE         ;
                    LDA.b #$2A                ;
                    STA.b $00                 ;
                    LDA.b #$84                ;
CODE_03F3BE:        LDY.w $0B51,x             ;
                    INY                       ;
                    JSR.w CODE_03EC3C         ;
                    LDA.b $09                 ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    AND.b #$C0                ;
                    ORA.b $00                 ;
                    INY                       ;
                    JSR.w CODE_03EC3C         ;
                    DEY                       ;
                    DEY                       ;
                    LDA.w $03BC               ;
                    CMP.b #$F0                ;
                    BCC   CODE_03F3DE         ;
                    LDA.b #$F0                ;
CODE_03F3DE:        JSR.w CODE_03EC42         ;
                    LDA.w $03B1               ;
                    STA.w $0800,y             ;
                    LDA.w $03F3,x             ;
                    SEC                       ;
                    SBC.w $071C               ;
                    STA.b $00                 ;
                    SEC                       ;
                    SBC.w $03B1               ;
                    ADC.b $00                 ;
                    ADC.b #$06                ;
                    STA.w $0804,y             ;
                    LDA.w $03BD               ;
                    CMP.b #$F0                ;
                    BCC   CODE_03F404         ;
                    LDA.b #$F0                ;
CODE_03F404:        STA.w $0809,y             ;
                    STA.w $080D,y             ;
                    LDA.w $03B2               ;
                    STA.w $0808,y             ;
                    LDA.b $00                 ;
                    SEC                       ;
                    SBC.w $03B2               ;
                    ADC.b $00                 ;
                    ADC.b #$06                ;
                    STA.w $080C,y             ;
                    LDA.w $03D4               ;
                    ASL   A                   ;
                    BCC   CODE_03F428         ;
                    LDA.b #$F0                ;
                    JSR.w CODE_03EC42         ;
CODE_03F428:        LDA.w $03D4               ;
                    BEQ   CODE_03F435         ;
                    LDA.b #$01                ;
                    STA.w $0C00,y             ;
                    STA.w $0C08,y             ;
CODE_03F435:        LDA.w $03D5               ;
                    BEQ   CODE_03F442         ;
                    LDA.b #$01                ;
                    STA.w $0C04,y             ;
                    STA.w $0C0C,y             ;
CODE_03F442:        RTS                       ;

CODE_03F443:        LDY.w $0B56,x             ;
                    LDA.w $03BA               ;
                    STA.w $0801,y             ;
                    LDA.w $03AF               ;
                    STA.w $0800,y             ;
                    LDA.b $09                 ;
                    LSR   A                   ;
                    LSR   A                   ;
                    PHA                       ;
                    AND.b #$01                ;
                    EOR.b #$BE                ;
                    STA.w $0802,y             ;
                    PLA                       ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LDA.b #$28                ;
                    BCC   CODE_03F467         ;
                    ORA.b #$C0                ;
CODE_03F467:        STA.w $0803,y             ;
                    LDA.w $68,x             ;
                    BPL   CODE_03F47B         ;
                    LDA.w $03AF               ;
                    CMP.b #$F8                ;
                    BCC   CODE_03F47B         ;
                    LDA.b #$01                ;
                    STA.w $0C00,y             ;
CODE_03F47B:        RTS                       ;

                    LDY.w $0B56,x             ;
                    LDA.w $03BA               ;
                    STA.w $0901,y             ;
                    LDA.w $03AF               ;
                    STA.w $0900,y             ;
CODE_03F48B:        LDA.b $09                 ;
                    LSR   A                   ;
                    LSR   A                   ;
                    PHA                       ;
                    AND.b #$01                ;
                    EOR.b #$BE                ;
                    STA.w $0902,y             ;
                    PLA                       ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LDA.b #$38                ;
                    BCC   CODE_03F4A0         ;
                    ORA.b #$C0                ;
CODE_03F4A0:        STA.w $0903,y             ;
                    RTS                       ;

                    db $CC,$CB,$CA,$FC

CODE_03F4A8:        LDY.w $0B51,x
                    LDA.w $68,x             ;
                    BMI   CODE_03F4C7         ;
                    LDA.w $03AF               ;
                    SEC                       ;
                    SBC.b #$04                ;
                    STA.w $03AF               ;
                    CMP.b #$F8                ;
                    BCC   CODE_03F4E6         ;
CODE_03F4BD:        LDA.b #$01                ;
                    STA.w $0C08,y             ;
                    STA.w $0C0C,y             ;
                    BRA   CODE_03F4E6         ;

CODE_03F4C7:        LDA.w $03AF               ;
                    CMP.b #$F0                ;
                    BCC   CODE_03F4E6         ;
                    CMP.b #$F8                ;
                    BCC   CODE_03F4DC         ;
                    LDA.b #$01                ;
                    STA.w $0C00,y             ;
                    STA.w $0C04,y             ;
                    BRA   CODE_03F4E6         ;

CODE_03F4DC:        LDA.b #$01                ;
                    STA.w $0C00,y             ;
                    STA.w $0C04,y             ;
                    BRA   CODE_03F4BD         ;

CODE_03F4E6:        LDA.b $33,x               ;
                    INC.b $33,x               ;
                    LSR   A                   ;
                    AND.b #$07                ;
                    CMP.b #$03                ;
                    BCS   CODE_03F538         ;
                    TAX                       ;
                    LDA.w $F4A4,x             ;
                    INY                       ;
                    JSR.w CODE_03EC3C         ;
                    DEY                       ;
                    LDX.b $9E                 ;
                    LDA.w $03BA               ;
                    SEC                       ;
                    SBC.b #$04                ;
                    STA.w $0801,y             ;
                    STA.w $0809,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0805,y             ;
                    STA.w $080D,y             ;
                    LDA.w $03AF               ;
                    STA.w $0800,y             ;
                    STA.w $0804,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0808,y             ;
                    STA.w $080C,y             ;
                    LDA.b #$28                ;
                    STA.w $0803,y             ;
                    LDA.b #$A8                ;
                    STA.w $0807,y             ;
                    LDA.b #$68                ;
                    STA.w $080B,y             ;
                    LDA.b #$E8                ;
                    STA.w $080F,y             ;
                    RTS                       ;

CODE_03F538:        STZ.b $33,x               ;
                    RTS                       ;

                    db $48,$4A,$4C,$4E

                    db $0C,$08,$0A,$0C,$08,$0A,$0C,$08
                    db $0A

CODE_03F548:        TAX                       ;
                    LDA.w $F53B,x             ;
                    INY                       ;
                    JSR.w CODE_03EC51         ;
                    DEY                       ;
                    LDX.b $9E                 ;
                    LDA.w $03BA               ;
                    SEC                       ;
                    SBC.b #$10                ;
                    STA.w $0901,y             ;
                    STA.w $0909,y             ;
                    CLC                       ;
                    ADC.b #$10                ;
                    STA.w $0905,y             ;
                    STA.w $090D,y             ;
                    LDA.w $03AF               ;
                    SEC                       ;
                    SBC.b #$08                ;
                    STA.w $0900,y             ;
                    STA.w $0904,y             ;
                    CLC                       ;
                    ADC.b #$10                ;
                    STA.w $0908,y             ;
                    STA.w $090C,y             ;
                    LDA.b #$02                ;
                    STA.w $0D00,y             ;
                    STA.w $0D04,y             ;
                    STA.w $0D08,y             ;
                    STA.w $0D0C,y             ;
                    PHX                       ;
                    LDA.b $A1,x               ;
                    TAX                       ;
                    DEX                       ;
                    LDA.w $F53F,x             ;
                    ORA.b #$20                ;
                    STA.w $0903,y             ;
                    LDA.w $F53F,x             ;
                    ORA.b #$A0                ;
                    STA.w $0907,y             ;
                    LDA.w $F53F,x             ;
                    ORA.b #$60                ;
                    STA.w $090B,y             ;
                    LDA.w $F53F,x             ;
                    ORA.b #$E0                ;
                    STA.w $090F,y             ;
                    PLX                       ;
                    RTS                       ;

CODE_03F5B2:        LDY.w $0B46,x             ;
                    LDA.b #$87                ;
                    INY                       ;
                    JSR.w CODE_03EC4B         ;
                    INY                       ;
                    LDA.b #$2C                ;
                    JSR.w CODE_03EC4B         ;
                    DEY                       ;
                    DEY                       ;
                    LDA.w $03AE               ;
                    STA.w $0900,y             ;
                    STA.w $090C,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0904,y             ;
                    STA.w $0910,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0908,y             ;
                    STA.w $0914,y             ;
                    LDA.w $0238,x             ;
                    TAX                       ;
                    PHA                       ;
                    CPX.b #$00                ;
                    BCS   CODE_03F5E9         ;
                    LDA.b #$F0                ;
CODE_03F5E9:        JSR.w CODE_03EC54         ;
                    PLA                       ;
                    CLC                       ;
                    ADC.b #$80                ;
                    TAX                       ;
                    CPX.b #$00                ;
                    BCS   CODE_03F5F7         ;
                    LDA.b #$F0                ;
CODE_03F5F7:        STA.w $090D,y             ;
                    STA.w $0911,y             ;
                    STA.w $0915,y             ;
                    LDA.w $03D1               ;
                    PHA                       ;
                    AND.b #$08                ;
                    BEQ   CODE_03F610         ;
                    LDA.b #$01                ;
                    STA.w $0D00,y             ;
                    STA.w $0D0C,y             ;
CODE_03F610:        PLA                       ;
                    PHA                       ;
                    AND.b #$04                ;
                    BEQ   CODE_03F61E         ;
                    LDA.b #$01                ;
                    STA.w $0D04,y             ;
                    STA.w $0D10,y             ;
CODE_03F61E:        PLA                       ;
                    AND.b #$02                ;
                    BEQ   CODE_03F62B         ;
                    LDA.b #$01                ;
                    STA.w $0D08,y             ;
                    STA.w $0D14,y             ;
CODE_03F62B:        LDX.b $9E                 ;
                    RTS                       ;

                    db $20,$28,$C8,$18,$00,$40,$50,$58
                    db $80,$88,$B8,$78,$60,$A0,$B0,$B8

                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $00,$01,$02,$03,$04,$05,$06,$07
                    db $9E,$9F

CODE_03F710:        LDA.w $0E41               ;
                    BNE   CODE_03F732         ;
                    LDA.w $06D5               ;
                    CMP.b #$18                ;
                    BEQ   CODE_03F720         ;
                    CMP.b #$78                ;
                    BNE   CODE_03F736         ;
CODE_03F720:        INC.w $0E41               ;
                    BRA   CODE_03F72F         ;

                    LDA.w $0202               ;
                    AND.b #$02                ;
                    BNE   CODE_03F736         ;
                    INC.w $0E41               ;
CODE_03F72F:        STZ.w $0E40               ;
CODE_03F732:        JSL.l CODE_05D7A1         ;
CODE_03F736:        LDA.b $0F                 ;
                    CMP.b #$03                ;
                    BEQ   CODE_03F746         ;
                    LDA.w $07AE               ;
                    BEQ   CODE_03F746         ;
                    LDA.b $09                 ;
                    LSR   A                   ;
                    BCS   CODE_03F7AE         ;
CODE_03F746:        LDA.b $0F                 ;
                    CMP.b #$0B                ;
                    BEQ   CODE_03F7B9         ;
                    LDA.w $070B               ;
                    BNE   CODE_03F7B4         ;
                    LDY.w $0704               ;
                    BEQ   CODE_03F7AF         ;
                    LDA.b $28                 ;
                    CMP.b #$00                ;
                    BEQ   CODE_03F7AF         ;
                    JSR.w CODE_03F7AF         ;
                    TAX                       ;
                    LDY.w $0B45               ;
                    LDA.w $0202               ;
                    LSR   A                   ;
                    BCS   CODE_03F76D         ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
CODE_03F76D:        LDA.w $0754               ;
                    BNE   CODE_03F7AE         ;
                    PHX                       ;
                    LDA.w $0202               ;
                    CMP.b #$02                ;
                    BEQ   CODE_03F789         ;
                    LDA.w $0810,y             ;
                    SEC                       ;
                    SBC.b #$08                ;
                    STA.w $0810,y             ;
                    BCS   CODE_03F789         ;
                    LDA.b #$03                ;
                    BRA   CODE_03F78B         ;

CODE_03F789:        LDA.b #$02                ;
CODE_03F78B:        STA.w $0C10,y             ;
                    LDA.w $06D5               ;
                    SEC                       ;
                    SBC.b #$28                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0812,y             ;
                    LDA.w $0819,y             ;
                    CMP.b #$F0                ;
                    BCC   CODE_03F7A8         ;
                    LDA.b #$F0                ;
                    STA.w $0811,y             ;
CODE_03F7A8:        LDA.b #$F0                ;
                    STA.w $0819,y             ;
                    PLX                       ;
CODE_03F7AE:        RTS                       ;

CODE_03F7AF:        JSR.w CODE_03FBA2         ;
                    BRA   CODE_03F7BE         ;

CODE_03F7B4:        JSR.w CODE_03FC60         ;
                    BRA   CODE_03F7BE         ;

CODE_03F7B9:        LDY.b #$0E                ;
                    LDA.w $F62E,y             ;
CODE_03F7BE:        STA.w $06D5               ;
                    LDA.w $03CE               ;
                    BNE   CODE_03F7D9         ;
                    LDA.w $0218               ;
                    BEQ   CODE_03F7DC         ;
                    LDA.w $0754               ;
                    BNE   CODE_03F7D7         ;
                    LDA.b #$D8                ;
                    STA.w $06D5               ;
                    BRA   CODE_03F7DC         ;

CODE_03F7D7:        LDA.b #$E0                ;
CODE_03F7D9:        STA.w $06D5               ;
CODE_03F7DC:        LDA.b #$04                ;
                    JSR.w CODE_03FB58         ;
                    JSR.w CODE_03FC99         ;
                    LDA.b $02                 ;
                    CMP.b #$03                ;
                    BNE   CODE_03F804         ;
                    LDA.w $0219               ;
                    SEC                       ;
                    SBC.b $42                 ;
                    LDA.b $78                 ;
                    SBC.b $43                 ;
                    BEQ   CODE_03F804         ;
                    LDA.b #$01                ;
                    STA.w $0CD0               ;
                    STA.w $0CD8               ;
                    STA.w $0CE0               ;
                    STA.w $0CE8               ;
CODE_03F804:        LDA.w $0711               ;
                    BEQ   CODE_03F834         ;
                    LDY.b #$00                ;
                    LDA.w $0789               ;
                    CMP.w $0711               ;
                    STY.w $0711               ;
                    BCS   CODE_03F834         ;
                    STA.w $0711               ;
                    LDA.b $28                 ;
                    CMP.b #$01                ;
                    BEQ   CODE_03F827         ;
                    LDY.b #$07                ;
                    LDA.w $F62E,y             ;
                    STA.w $06D5               ;
CODE_03F827:        LDY.b #$04                ;
                    LDA.b $5D                 ;
                    ORA.b $0C                 ;
                    BEQ   CODE_03F830         ;
                    DEY                       ;
CODE_03F830:        TYA                       ;
                    JSR.w CODE_03FB58         ;
CODE_03F834:        LDA.w $03D0               ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    STA.b $00                 ;
                    LDX.b #$03                ;
                    LDA.w $0B45               ;
                    CLC                       ;
                    ADC.b #$18                ;
                    TAY                       ;
CODE_03F846:        LDA.b #$F0                ;
                    LSR.b $00                 ;
                    BCC   CODE_03F84F         ;
                    JSR.w CODE_03EC42         ;
CODE_03F84F:        TYA                       ;
                    SEC                       ;
                    SBC.b #$08                ;
                    TAY                       ;
                    DEX                       ;
                    BPL   CODE_03F846         ;
                    JSR.w CODE_03FCB6         ;
                    RTS                       ;

                    db $40,$01,$2E,$60,$FF,$04

CODE_03F861:        JSR.w $85F3
                    LDA.b #$D0                ;
                    STA.w $06D5               ;
                    JSL.l CODE_04D800         ;
                    LDX.b #$05                ;
CODE_03F86F:        LDA.w $F85B,x             ;
                    STA.b $02,x               ;
                    DEX                       ;
                    BPL   CODE_03F86F         ;
                    LDX.b #$B8                ;
                    LDY.b #$D0                ;
                    JSR.w CODE_03FB7E         ;
                    JSR.w CODE_03F885         ;
                    JSR.w CODE_039FBD         ;
                    RTS                       ;

CODE_03F885:        PHX                       ;
                    PHY                       ;
                    LDA.b #$F0                ;
CODE_03F889:        STA.w $0801,y             ;
                    STA.w $0901,y             ;
                    INY                       ;
                    BNE   CODE_03F889         ;
                    JSR.w CODE_03F98F         ;
                    LDX.b #$00                ;
                    LDA.b #$30                ;
                    STA.b $E2                 ;
CODE_03F89B:        JSR.w CODE_03F922         ;
                    CMP.b #$02                ;
                    BNE   CODE_03F8DB         ;
                    LDA.b $1C,x               ;
                    CMP.b #$16                ;
                    BEQ   CODE_03F8CD         ;
                    PHY                       ;
                    PHX                       ;
                    JSR.w CODE_03EF1E         ;
                    PLX                       ;
                    LDA.w $0B46,x             ;
                    TAY                       ;
                    LDA.b #$00                ;
                    STA.w $0D00,y             ;
                    STA.w $0D04,y             ;
                    STA.w $0D08,y             ;
                    STA.w $0D0C,y             ;
                    STA.w $0D10,y             ;
                    STA.w $0D14,y             ;
                    LDA.b $43                 ;
                    STA.b $79,x               ;
                    PLY                       ;
                    BRA   CODE_03F8D2         ;

CODE_03F8CD:        JSR.w CODE_03FA6E         ;
                    BRA   CODE_03F915         ;

CODE_03F8D2:        LDA.b $1C,x               ;
                    CMP.b #$12                ;
                    BNE   CODE_03F8DB         ;
                    JSR.w CODE_03FA17         ;
CODE_03F8DB:        INY                       ;
                    INX                       ;
                    CPX.b #$05                ;
                    BNE   CODE_03F89B         ;
                    LDA.b $5C                 ;
                    CMP.b #$03                ;
                    BEQ   CODE_03F915         ;
                    LDX.b #$00                ;
CODE_03F8E9:        LDA.w $0902,x             ;
                    CMP.w $0906,x             ;
                    BNE   CODE_03F903         ;
                    LDA.w $0903,x             ;
                    AND.b #$3F                ;
                    STA.w $0903,x             ;
                    LDA.w $0907,x             ;
                    ORA.b #$40                ;
                    STA.w $0907,x             ;
                    BRA   CODE_03F909         ;

CODE_03F903:        LDA.w $0907,x             ;
                    STA.w $0903,x             ;
CODE_03F909:        INX                       ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    CPX.b #$00                ;
                    BNE   CODE_03F8E9         ;
CODE_03F915:        LDX.b #$04                ;
CODE_03F917:        STZ.b $1C,x               ;
                    DEX                       ;
                    BPL   CODE_03F917         ;
                    STZ.w $0E85               ;
                    PLY                       ;
                    PLX                       ;
                    RTS                       ;

CODE_03F922:        STZ.w $0E85               ;
                    LDA.w $07FC               ;
                    BEQ   CODE_03F933         ;
                    PHX                       ;
                    TYX                       ;
                    LDA.l $05EC41,x           ;
                    PLX                       ;
                    BRA   CODE_03F93A         ;

CODE_03F933:        PHX                       ;
                    TYX                       ;
                    LDA.l $05EB9C,x           ;
                    PLX                       ;
CODE_03F93A:        CMP.b #$FF                ;
                    BNE   CODE_03F948         ;
                    LDA.b $E2                 ;
                    CLC                       ;
                    ADC.b #$18                ;
                    STA.b $E2                 ;
                    JMP.w CODE_03F98E         ;

CODE_03F948:        STZ.w $00BC,x             ;
                    STA.b $1C,x               ;
                    CMP.b #$0E                ;
                    BEQ   CODE_03F965         ;
                    CMP.b #$0F                ;
                    BEQ   CODE_03F965         ;
                    CMP.b #$10                ;
                    BEQ   CODE_03F965         ;
                    CMP.b #$14                ;
                    BEQ   CODE_03F965         ;
                    CMP.b #$08                ;
                    BEQ   CODE_03F965         ;
                    LDA.b #$98                ;
                    BRA   CODE_03F967         ;

CODE_03F965:        LDA.b #$88                ;
CODE_03F967:        STA.w $0238,x             ;
                    LDA.b $E2                 ;
                    CLC                       ;
                    ADC.b #$18                ;
                    STA.b $E2                 ;
                    STA.w $03AE               ;
                    LDA.b #$20                ;
                    STA.w $0257,x             ;
                    PHX                       ;
                    TYX                       ;
                    LDA.l $05EB9C,x           ;
                    PLX                       ;
                    CMP.b #$05                ;
                    BNE   CODE_03F98A         ;
                    STA.w $0E85               ;
                    JSR.w CODE_03FB36         ;
CODE_03F98A:        LDA.b #$02                ;
                    STA.b $47,x               ;
CODE_03F98E:        RTS                       ;

CODE_03F98F:        LDA.w $075F               ;
                    ASL   A                   ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.w $075F               ;
                    CLC                       ;
                    ADC.w $0760               ;
                    TAX                       ;
                    LDA.l $05ECE6,x           ;
                    STA.w $0E22               ;
                    LDA.l $05ED13,x           ;
                    STA.w $0E21               ;
                    LDA.w $0E21               ;
                    ASL   A                   ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.w $0E21               ;
                    TAY                       ;
                    LDA.w $071C               ;
                    STA.b $9C                 ;
                    LDA.w $071A               ;
                    STA.b $9D                 ;
                    INC.b $9B                 ;
                    STZ.w $071A               ;
                    STZ.w $073F               ;
                    STZ.w $0EFD               ;
                    STZ.w $0EFE               ;
                    STZ.w $0EEE               ;
                    STZ.w $0EEF               ;
                    STZ.w $210D               ;
                    STZ.w $210D               ;
                    STZ.w $210F               ;
                    STZ.w $210F               ;
                    STZ.w $2111               ;
                    STZ.w $2111               ;
                    RTS                       ;

                    db $DC,$DC,$DD,$DD,$DE,$DE              ;immediate data table

                    LDA.w $F9E6               ;why the fuck
                    STA.w $0962               ;don't they use
                    LDA.w $F9E7               ;immediate data?
                    STA.w $0966               ;trying to make it easier for us ROM hackers
                    LDA.w $F9E8               ;to document SMAS?
                    STA.w $096A               ;
                    LDA.w $F9E9               ;
                    STA.w $096E               ;
                    LDA.w $F9EA               ;
                    STA.w $0972               ;
                    LDA.w $F9EB               ;
                    STA.w $0976               ;
                    RTS                       ;

                    db $B9,$B8,$BB,$BA,$BC,$BC

CODE_03FA17:        PHY                       ;
                    LDA.b #$03                ;
                    STA.b $03                 ;
                    LDA.w $0238,x             ;
                    SEC                       ;
                    SBC.b #$28                ;
                    STA.w $0238,x             ;
                    STZ.b $E3                 ;
                    LDY.b #$00                ;
CODE_03FA29:        LDA.w $03AE               ;
                    STA.w $0990,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0994,y             ;
                    LDA.w $0238,x             ;
                    STA.w $0991,y             ;
                    STA.w $0995,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0238,x             ;
                    LDA.b #$2A                ;
                    STA.w $0993,y             ;
                    STA.w $0997,y             ;
                    PHX                       ;
                    LDX.b $E3                 ;
                    LDA.w $FA11,x             ;
                    STA.w $0992,y             ;
                    LDA.w $FA12,x             ;
                    STA.w $0996,y             ;
                    INC.b $E3                 ;
                    INC.b $E3                 ;
                    PLX                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    DEC.b $03                 ;
                    BNE   CODE_03FA29         ;
                    PLY                       ;
                    RTS                       ;

CODE_03FA6E:        PHY                       ;
                    PHX                       ;
                    LDA.w $0238,x             ;
                    STA.w $03B9               ;
                    SEC                       ;
                    SBC.b #$08                ;
                    STA.w $03B9               ;
                    LDA.w $03AE               ;
                    SEC                       ;
                    SBC.b #$10                ;
                    STA.w $03AE               ;
                    LDY.b #$90                ;
                    LDX.b #$00                ;
                    LDA.w $03AE               ;
                    STA.w $0900,y             ;
                    STA.w $0908,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0910,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0904,y             ;
                    STA.w $090C,y             ;
                    STA.w $0914,y             ;
                    LDA.w $03B9               ;
                    STA.w $0901,y             ;
                    STA.w $0905,y             ;
                    CLC                       ;
                    ADC.b #$10                ;
                    STA.w $0909,y             ;
                    STA.w $090D,y             ;
                    SEC                       ;
                    SBC.b #$18                ;
                    STA.w $0911,y             ;
                    STA.w $0915,y             ;
                    LDA.b #$00                ;
                    STA.w $0C10,y             ;
                    STA.w $0C14,y             ;
                    LDA.b #$02                ;
                    STA.w $0D00,y             ;
                    STA.w $0D04,y             ;
                    STA.w $0D08,y             ;
                    STA.w $0D0C,y             ;
                    LDA.b #$61                ;
                    STA.w $0903,y             ;
                    STA.w $0907,y             ;
                    STA.w $090B,y             ;
                    STA.w $090F,y             ;
                    STA.w $0913,y             ;
                    STA.w $0917,y             ;
                    LDA.b #$C5                ;
                    STA.w $0912,y             ;
                    LDA.b #$C4                ;
                    STA.w $0916,y             ;
                    LDA.b #$EE                ;
                    STA.w $0902,y             ;
                    LDA.b #$C0                ;
                    STA.w $0906,y             ;
                    LDA.b #$E2                ;
                    STA.w $090A,y             ;
                    LDA.b #$E0                ;
                    STA.w $090E,y             ;
                    LDA.b #$70                ;
                    STA.w $09F0               ;
                    LDA.b #$78                ;
                    STA.w $09F4               ;
                    LDA.b #$98                ;
                    STA.w $09F1               ;
                    STA.w $09F5               ;
                    LDA.b #$86                ;
                    STA.w $09F2               ;
                    LDA.b #$87                ;
                    STA.w $09F6               ;
                    LDA.b #$21                ;
                    STA.w $09F3               ;
                    STA.w $09F7               ;
                    LDA.b #$02                ;
                    STA.w $0DF0               ;
                    STA.w $0DF4               ;
                    PLX                       ;
                    PLY                       ;
                    RTS                       ;

CODE_03FB36:        LDA.w $0238,x             ;
                    SEC                       ;
                    SBC.b #$0A                ;
                    STA.w $0881               ;
                    LDA.w $03AE               ;
                    CLC                       ;
                    ADC.b #$03                ;
                    STA.w $0880               ;
                    LDA.b #$2A                ;
                    STA.w $0883               ;
                    LDA.b #$44                ;
                    STA.w $0882               ;
                    LDA.b #$02                ;
                    STA.w $0C80               ;
                    RTS                       ;

CODE_03FB58:        STA.b $07                 ;
                    LDA.w $03AD               ;
                    STA.w $0755               ;
                    STA.b $05                 ;
                    LDA.w $03B8               ;
                    STA.b $02                 ;
                    LDA.w $0202               ;
                    STA.b $03                 ;
                    JSL.l CODE_04D800         ;
                    LDA.w $06D5               ;
                    AND.b #$07                ;
                    TAX                       ;
                    LDA.w $0256               ;
                    STA.b $04                 ;
                    LDY.w $0B45               ;
CODE_03FB7E:        LDA.w $F63E,x             ;
                    STA.b $00                 ;
                    LDA.w $F63F,x             ;
                    JSR.w CODE_03F30E         ;
                    DEC.b $07                 ;
                    BNE   CODE_03FB7E         ;
                    LDA.b $05                 ;
                    CMP.b #$F8                ;
                    BCC   CODE_03FBA1         ;
                    LDA.b #$01                ;
                    STA.w $0CD0               ;
                    STA.w $0CD8               ;
                    STA.w $0CE0               ;
                    STA.w $0CE8               ;
CODE_03FBA1:        RTS                       ;

CODE_03FBA2:        LDA.b $28                 ;
                    CMP.b #$03                ;
                    BEQ   CODE_03FBF6         ;
                    CMP.b #$02                ;
                    BEQ   CODE_03FBE8         ;
                    CMP.b #$01                ;
                    BNE   CODE_03FBC0         ;
                    LDA.w $0704               ;
                    BNE   CODE_03FC01         ;
                    LDY.b #$06                ;
                    LDA.w $0714               ;
                    BNE   CODE_03FBDE         ;
                    LDY.b #$00                ;
                    BRA   CODE_03FBDE         ;

CODE_03FBC0:        LDY.b #$06                ;
                    LDA.w $0714               ;
                    BNE   CODE_03FBDE         ;
                    LDY.b #$02                ;
                    LDA.b $5D                 ;
                    ORA.b $0C                 ;
                    BEQ   CODE_03FBDE         ;
                    LDA.w $0700               ;
                    CMP.b #$09                ;
                    BCC   CODE_03FBEF         ;
                    LDA.b $46                 ;
                    AND.w $0202               ;
                    BNE   CODE_03FBEF         ;
                    INY                       ;
CODE_03FBDE:        JSR.w CODE_03FC41         ;
                    STZ.w $070D               ;
                    LDA.w $F62E,y             ;
                    RTS                       ;

CODE_03FBE8:        LDY.b #$04                ;
                    JSR.w CODE_03FC41         ;
                    BRA   CODE_03FC13         ;

CODE_03FBEF:        LDY.b #$04                ;
                    JSR.w CODE_03FC41         ;
                    BRA   CODE_03FC19         ;

CODE_03FBF6:        LDY.b #$05                ;
                    LDA.b $A0                 ;
                    BEQ   CODE_03FBDE         ;
                    JSR.w CODE_03FC41         ;
                    BRA   CODE_03FC1D         ;

CODE_03FC01:        LDY.b #$01                ;
                    JSR.w CODE_03FC41         ;
                    LDA.w $078A               ;
                    ORA.w $070D               ;
                    BNE   CODE_03FC19         ;
                    LDA.b $0A                 ;
                    ASL   A                   ;
                    BCS   CODE_03FC19         ;
CODE_03FC13:        LDA.w $070D               ;
                    JMP.w CODE_03FC80         ;

CODE_03FC19:        LDA.b #$03                ;
                    BRA   CODE_03FC1F         ;

CODE_03FC1D:        LDA.b #$02                ;
CODE_03FC1F:        STA.b $00                 ;
                    JSR.w CODE_03FC13         ;
                    PHA                       ;
                    LDA.w $0789               ;
                    BNE   CODE_03FC3F         ;
                    LDA.w $070C               ;
                    STA.w $0789               ;
                    LDA.w $070D               ;
                    CLC                       ;
                    ADC.b #$01                ;
                    CMP.b $00                 ;
                    BCC   CODE_03FC3C         ;
                    LDA.b #$00                ;
CODE_03FC3C:        STA.w $070D               ;
CODE_03FC3F:        PLA                       ;
                    RTS                       ;

CODE_03FC41:        LDA.w $0754               ;
                    BEQ   CODE_03FC4B         ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b #$08                ;
                    TAY                       ;
CODE_03FC4B:        RTS                       ;

                    db $00,$01,$00,$01,$00,$01,$02,$00
                    db $01,$02,$02,$00,$02,$00,$02,$00
                    db $02,$00,$02,$00

CODE_03FC60:        LDY.w $070D               ;
                    LDA.b $09                 ;
                    AND.b #$03                ;
                    BNE   CODE_03FC76         ;
                    INY                       ;
                    CPY.b #$0A                ;
                    BCC   CODE_03FC73         ;
                    LDY.b #$00                ;
                    STY.w $070B               ;
CODE_03FC73:        STY.w $070D               ;
CODE_03FC76:        LDA.w $0754               ;
                    BNE   CODE_03FC87         ;
                    LDA.w $FC4C,y             ;
                    LDY.b #$0F                ;
CODE_03FC80:        ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ADC.w $F62E,y             ;
                    RTS                       ;

CODE_03FC87:        TYA                       ;
                    CLC                       ;
                    ADC.b #$0A                ;
                    TAX                       ;
                    LDY.b #$09                ;
                    LDA.w $FC4C,x             ;
                    BNE   CODE_03FC95         ;
                    LDY.b #$01                ;
CODE_03FC95:        LDA.w $F62E,y             ;
                    RTS                       ;

CODE_03FC99:        LDY.w $0B45               ;
                    LDA.b $0F                 ;
                    CMP.b #$0B                ;
                    BEQ   CODE_03FCB5         ;
                    LDA.w $06D5               ;
                    CMP.b #$50                ;
                    BEQ   CODE_03FCB5         ;
                    CMP.b #$B8                ;
                    BEQ   CODE_03FCB5         ;
                    CMP.b #$C0                ;
                    BEQ   CODE_03FCB5         ;
                    CMP.b #$C8                ;
                    BNE   CODE_03FCB5         ;
CODE_03FCB5:        RTS                       ;

CODE_03FCB6:        LDA.w $0E4E               ;
                    BEQ   CODE_03FD12         ;
                    LDX.b #$00                ;
CODE_03FCBD:        LDA.w $08D0,x             ;
                    STA.w $09E0,x             ;
                    INX                       ;
                    CPX.b #$20                ;
                    BNE   CODE_03FCBD         ;
                    LDA.b #$F0                ;
                    STA.w $08D1               ;
                    STA.w $08D5               ;
                    STA.w $08D9               ;
                    STA.w $08DD               ;
                    STA.w $08E1               ;
                    STA.w $08E5               ;
                    STA.w $08E9               ;
                    STA.w $08ED               ;
                    LDA.w $0CD0               ;
                    STA.w $0DE0               ;
                    LDA.w $0CD4               ;
                    STA.w $0DE4               ;
                    LDA.w $0CD8               ;
                    STA.w $0DE8               ;
                    LDA.w $0CDC               ;
                    STA.w $0DEC               ;
                    LDA.w $0CE0               ;
                    STA.w $0DF0               ;
                    LDA.w $0CE4               ;
                    STA.w $0DF4               ;
                    LDA.w $0CE8               ;
                    STA.w $0DF8               ;
                    LDA.w $0CEC               ;
                    STA.w $0DFC               ;
CODE_03FD12:        RTS                       ;

CODE_03FD13:        LDX.b #$00                ;
                    LDY.b #$00                ;
                    JMP.w CODE_03FD2A         ;

CODE_03FD1A:        LDY.b #$01                ;
                    JSR.w CODE_03FDC4         ;
                    LDY.b #$03                ;
                    BRA   CODE_03FD2A         ;

CODE_03FD23:        LDY.b #$00                ;
                    JSR.w CODE_03FDC4         ;
                    LDY.b #$02                ;
CODE_03FD2A:        JSR.w CODE_03FD58         ;
                    LDX.b $9E                 ;
                    RTS                       ;

CODE_03FD30:        LDY.b #$02                ;
                    JSR.w CODE_03FDC4         ;
                    LDY.b #$06                ;
                    BRA   CODE_03FD2A         ;

CODE_03FD39:        LDA.b #$01                ;X = sprite index.
                    LDY.b #$01                ;
                    JMP.w CODE_03FD4C         ;

CODE_03FD40:        LDA.b #$0D                ;
                    LDY.b #$04                ;
                    JSR.w CODE_03FD4C         ;
                    INX                       ;
                    INX                       ;
                    LDA.b #$0D                ;
                    INY                       ;
CODE_03FD4C:        STX.b $00                 ;
                    CLC                       ;
                    ADC.b $00                 ;
                    TAX                       ;
                    JSR.w CODE_03FD58         ;
                    LDX.b $9E                 ;
                    RTS                       ;

CODE_03FD58:        LDA.w $0237,x             ;
                    STA.w $03B8,y             ;
                    LDA.b $0E                 ;
                    BEQ   CODE_03FD6E         ;
                    LDA.w $0219               ;
                    BNE   CODE_03FD6E         ;
                    LDA.b #$28                ;
                    STA.w $0219               ;
                    BRA   CODE_03FD80         ;

CODE_03FD6E:        LDA.w $0219,x             ;
                    SEC                       ;
                    SBC.w $071C               ;
                    STA.w $03AD,y             ;
                    LDA.b $78,x               ;
                    SBC.w $071A               ;
                    STA.w $03C1,y             ;
CODE_03FD80:        PHY                       ;
                    TYA                       ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w $0219,x             ;
                    STA.b $E4                 ;
                    LDA.w $78,x             ;
                    STA.b $E5                 ;
                    REP   #$20                ;
                    LDA.b $E4                 ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.w $0E87,y             ;
                    SEP   #$20                ;
                    PLY                       ;
                    RTS                       ;

CODE_03FD9C:        LDX.b #$00                ;
                    LDY.b #$00                ;
                    JMP.w CODE_03FDDB         ;

CODE_03FDA3:        LDY.b #$00                ;
                    JSR.w CODE_03FDC4         ;
                    LDY.b #$02                ;
                    JMP.w CODE_03FDDB         ;

CODE_03FDAD:        LDY.b #$01                ;
                    JSR.w CODE_03FDC4         ;
                    LDY.b #$03                ;
                    JMP.w CODE_03FDDB         ;

CODE_03FDB7:        LDY.b #$02                ;
                    JSR.w CODE_03FDC4         ;
                    LDY.b #$06                ;
                    JMP.w CODE_03FDDB         ;

                    db $0B,$1A,$11

CODE_03FDC4:        TXA
                    CLC                       ;
                    ADC.w $FDC1,y             ;
                    TAX                       ;
                    RTS                       ;

CODE_03FDCB:        LDA.b #$01                ;
                    LDY.b #$01                ;
                    BRA   CODE_03FDD5         ;

CODE_03FDD1:        LDA.b #$0D                ;
                    LDY.b #$04                ;
CODE_03FDD5:        STX.b $00                 ;
                    CLC                       ;
                    ADC.b $00                 ;
                    TAX                       ;
CODE_03FDDB:        TYA                       ;
                    PHA                       ;
                    JSR.w CODE_03FDFF         ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ORA.b $00                 ;
                    STA.b $00                 ;
                    PLA                       ;
                    TAY                       ;
                    LDA.b $00                 ;
                    STA.w $03D0,y             ;
                    LSR   A                   ;
                    LSR   A                   ;
                    PHA                       ;
                    AND.b #$01                ;
                    STA.w $0E08,y             ;
                    PLA                       ;
                    LSR   A                   ;
                    STA.w $0E00,y             ;
                    LDX.b $9E                 ;
                    RTS                       ;

CODE_03FDFF:        JSR.w CODE_03FE1E         ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    STA.b $00                 ;
                    JMP.w CODE_03FE62         ;

                    db $7F,$3F,$1F,$0F,$07,$03,$01,$00
                    db $80,$C0,$E0,$F0,$F8,$FC,$FE,$FF

                    db $07,$0F,$07

CODE_03FE1E:        STX.b $04                 ;
                    LDY.b #$01                ;
CODE_03FE22:        LDA.w $071C,y             ;
                    SEC                       ;
                    SBC.w $0219,x             ;
                    STA.b $07                 ;
                    LDA.w $071A,y             ;
                    SBC.b $78,x               ;
                    LDX.w $FE1B,y             ;
                    CMP.b #$00                ;
                    BMI   CODE_03FE47         ;
                    LDX.w $FE1C,y             ;
                    CMP.b #$01                ;
                    BPL   CODE_03FE47         ;
                    LDA.b #$38                ;
                    STA.b $06                 ;
                    LDA.b #$08                ;
                    JSR.w CODE_03FE97         ;
CODE_03FE47:        LDA.w $FE0B,x             ;
                    LDX.b $04                 ;
                    CMP.b #$00                ;
                    BNE   CODE_03FE53         ;
                    DEY                       ;
                    BPL   CODE_03FE22         ;
CODE_03FE53:        RTS                       ;

                    db $00,$08,$0C,$0E,$0F,$07,$03,$01
                    db $00

                    db $04,$00,$04

                    db $FF,$00

CODE_03FE62:        STX.b $04                 ;
                    LDY.b #$01                ;
CODE_03FE66:        LDA.w $FE60,y             ;
                    SEC                       ;
                    SBC.w $0237,x             ;
                    STA.b $07                 ;
                    LDA.b #$01                ;
                    SBC.b $BB,x               ;
                    LDX.w $FE5D,y             ;
                    CMP.b #$00                ;
                    BMI   CODE_03FE8A         ;
                    LDX.w $FE5E,y             ;
                    CMP.b #$01                ;
                    BPL   CODE_03FE8A         ;
                    LDA.b #$20                ;
                    STA.b $06                 ;
                    LDA.b #$04                ;
                    JSR.w CODE_03FE97         ;
CODE_03FE8A:        LDA.w $FE54,x             ;
                    LDX.b $04                 ;
                    CMP.b #$00                ;
                    BNE   CODE_03FE96         ;
                    DEY                       ;
                    BPL   CODE_03FE66         ;
CODE_03FE96:        RTS                       ;

CODE_03FE97:        STA.b $05                 ;
                    LDA.b $07                 ;
                    CMP.b $06                 ;
                    BCS   CODE_03FEAB         ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LSR   A                   ;
                    AND.b #$07                ;
                    CPY.b #$01                ;
                    BCS   CODE_03FEAA         ;
                    ADC.b $05                 ;
CODE_03FEAA:        TAX                       ;
CODE_03FEAB:        RTS                       ;

CODE_03FEAC:        LDA.b $79,x               ;
                    STA.w $0E15               ;
                    LDA.w $021A,x             ;
                    STA.w $0E14               ;
                    RTS                       ;

                    LDA.w $0E17               ;
                    STA.w $0E15               ;
                    LDA.w $0E16               ;
                    STA.w $0E14               ;
                    RTS                       ;

CODE_03FEC5:        LDA.b #$06                ;
                    STA.b $04                 ;
                    REP   #$20                ;
                    LDA.w $0E14               ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.w $0E12               ;
                    SEP   #$20                ;
                    LDA.w $0E13               ;
                    BNE   CODE_03FEDF         ;
                    LDA.b #$00                ;
                    BRA   CODE_03FEE1         ;

CODE_03FEDF:        LDA.b #$01                ;
CODE_03FEE1:        STA.w $0D00,y             ;
                    RTS                       ;

CODE_03FEE5:        REP   #$20                ;
                    LDA.w $0E14               ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.w $0E12               ;
                    SEP   #$20                ;
                    LDA.w $0E13               ;
                    BNE   CODE_03FEFB         ;
                    LDA.b #$00                ;
                    BRA   CODE_03FEFD         ;

CODE_03FEFB:        LDA.b #$01                ;
CODE_03FEFD:        STA.w $0D10,y             ;
                    STA.w $0D08,y             ;
                    STA.w $0D00,y             ;
                    RTS                       ;

                    REP   #$20                ;
                    LDA.w $0E14               ;
                    SEC                       ;
                    SBC.b $42                 ;
                    STA.w $0E12               ;
                    SEP   #$20                ;
                    LDA.w $0E13               ;
                    BNE   CODE_03FF1D         ;
                    LDA.b #$00                ;
                    BRA   CODE_03FF1F         ;

CODE_03FF1D:        LDA.b #$01                ;
CODE_03FF1F:        STA.w $0C08,y             ;
                    STA.w $0C00,y             ;
                    RTS                       ;

                    STA.w $0C00,y             ;
                    STA.w $0C08,y             ;
                    RTS                       ;

                    REP   #$20                ;
                    PLA                       ;
                    CLC                       ;
                    ADC.b $04                 ;
                    STA.b $04                 ;
                    PHA                       ;
                    SEP   #$20                ;
                    LDA.b #$01                ;
                    RTS                       ;

CODE_03FF3B:        REP   #$20                ;
                    LDA.w $0E14               ;
                    CLC                       ;
                    ADC.w #$0008              ;
                    STA.w $0E14               ;
                    SEP   #$20                ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    RTS                       ;

CODE_03FF4E:        LDA.b $03                 ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LDA.b $00                 ;
                    BCC   CODE_03FF62         ;
                    STA.w $0806,y             ;
                    LDA.b $01                 ;
                    STA.w $0802,y             ;
                    LDA.b #$40                ;
                    BNE   CODE_03FF6C         ;
CODE_03FF62:        STA.w $0802,y             ;
                    LDA.b $01                 ;
                    STA.w $0806,y             ;
                    LDA.b #$00                ;
CODE_03FF6C:        ORA.b $04                 ;
                    STA.w $0803,y             ;
                    STA.w $0807,y             ;
                    LDA.b $02                 ;
                    STA.w $0801,y             ;
                    STA.w $0805,y             ;
                    LDA.b $05                 ;
                    STA.w $0800,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0804,y             ;
                    LDA.b $02                 ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.b $02                 ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b #$08                ;
                    TAY                       ;
                    INX                       ;
                    INX                       ;
                    RTS                       ;

CODE_03FF96:        LDA.b $03                 ;
                    LSR   A                   ;
                    LSR   A                   ;
                    LDA.b $00                 ;
                    BCC   CODE_03FFAA         ;
                    STA.w $0906,y             ;
                    LDA.b $01                 ;
                    STA.w $0902,y             ;
                    LDA.b #$40                ;
                    BNE   CODE_03FFB4         ;
CODE_03FFAA:        STA.w $0902,y             ;
                    LDA.b $01                 ;
                    STA.w $0906,y             ;
                    LDA.b #$00                ;
CODE_03FFB4:        ORA.b $04                 ;
                    STA.w $0903,y             ;
                    STA.w $0907,y             ;
                    LDA.b $02                 ;
                    STA.w $0901,y             ;
                    STA.w $0905,y             ;
                    LDA.b $05                 ;
                    STA.w $0900,y             ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.w $0904,y             ;
                    LDA.b $02                 ;
                    CLC                       ;
                    ADC.b #$08                ;
                    STA.b $02                 ;
                    TYA                       ;
                    CLC                       ;
                    ADC.b #$08                ;
                    TAY                       ;
                    INX                       ;
                    INX                       ;
                    RTS                       ;