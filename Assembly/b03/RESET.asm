;-------Main SMB1 RESET routine
CODE_038015:        NOP                     ; $03:8015: EA          ;\[]
                    NOP                     ; $03:8016: EA          ;/
                    LDA.b #$AA              ; $03:8017: A9 AA       ;\
                    STA.l $702000           ; $03:8019: 8F 00 20 70 ; |Copier checks
                    CMP.l $700000           ; $03:801D: CF 00 00 70 ; |
                    BNE   CODE_038011       ; $03:8021: D0 EE       ; |If SRAM is not properly mirrored,
                    LDA.b #$55              ; $03:8023: A9 55       ; |show anti-piracy message
                    STA.l $702000           ; $03:8025: 8F 00 20 70 ; |
                    CMP.l $700000           ; $03:8029: CF 00 00 70 ; |
                    BNE   CODE_038011       ; $03:802D: D0 E2       ;/
                    SEI                     ; $03:802F: 78          ;Set interrupt flag
                    STZ.w $4200             ; $03:8030: 9C 00 42    ;Disable NMI, IRQ, and auto-joypad read
                    STZ.w $420C             ; $03:8033: 9C 0C 42    ;HDMA Disabled
                    STZ.w $420B             ; $03:8036: 9C 0B 42    ;DMA Disabled
                    LDA.b #$80              ; $03:8039: A9 80       ;\Forced blank
                    STA.w $2100             ; $03:803B: 8D 00 21    ;/
                    PHK                     ; $03:803E: 4B          ;\Set program bank to current bank
                    PLB                     ; $03:803F: AB          ;/
                    LDA.b #$01              ; $03:8040: A9 01       ;\[?]Relates to BG tile animations
                    STA.w $028C             ; $03:8042: 8D 8C 02    ;/
                    LDA.b #$03              ; $03:8045: A9 03       ;\[?]Seems to relate to the "More difficult
                    STA.w $0F0B             ; $03:8047: 8D 0B 0F    ;/quest" flag
                    STZ.w $028E             ; $03:804A: 9C 8E 02    ;[?]Possibly BG tile animation index
                    STZ.w $0E67             ; $03:804D: 9C 67 0E    ;[?]
                    LDA.l $700009           ; $03:8050: AF 09 00 70 ;\
                    STA.w $0E24             ; $03:8054: 8D 24 0E    ; |[?]Current level
                    STA.l $7FFB01           ; $03:8057: 8F 01 FB 7F ;/
                    LDA.l $700008           ; $03:805B: AF 08 00 70 ;\
                    STA.w $075F             ; $03:805F: 8D 5F 07    ; |[?]Current world
                    STA.l $7FFB00           ; $03:8062: 8F 00 FB 7F ;/
                    ASL   A                 ; $03:8066: 0A          ;
                    ASL   A                 ; $03:8067: 0A          ;
                    CLC                     ; $03:8068: 18          ;
                    ADC.l $700009           ; $03:8069: 6F 09 00 70 ;
                    TAX                     ; $03:806D: AA          ;
                    LDA.l DATA_05D272,x     ; $03:806E: BF 72 D2 05 ;
                    STA.l $700009           ; $03:8072: 8F 09 00 70 ;
                    STA.l $7FFB02           ; $03:8076: 8F 02 FB 7F ;
                    STA.w $0760             ; $03:807A: 8D 60 07    ;
                    LDA.b #$03              ; $03:807D: A9 03       ;\8x8 and 16x16 sprites; base address: $C000
                    STA.w $2101             ; $03:807F: 8D 01 21    ;/
                    LDA.b #$01              ; $03:8082: A9 01       ;\64x32 BG1 tilemap; base address: $0000
                    STA.w $2107             ; $03:8084: 8D 07 21    ;/
                    LDA.b #$09              ; $03:8087: A9 09       ;\64x32 BG2 tilemap; base address: $1000
                    STA.w $2108             ; $03:8089: 8D 08 21    ;/
                    LDA.b #$59              ; $03:808C: A9 59       ;\64x32 BG3 tilemap; base address: $B000
                    STA.w $2109             ; $03:808E: 8D 09 21    ;/
                    STZ.w $210A             ; $03:8091: 9C 0A 21    ;No BG4 tilemap
                    LDA.b #$11              ; $03:8094: A9 11       ;\BG1 GFX address: $2000; BG2 GFX address: $2000
                    STA.w $210B             ; $03:8096: 8D 0B 21    ;/
                    LDA.b #$05              ; $03:8099: A9 05       ;\BG3 GFX address: $A000; no BG4 GFX
                    STA.w $210C             ; $03:809B: 8D 0C 21    ;/
                    STZ.w $2133             ; $03:809E: 9C 33 21    ;No external sync, mode 7, hires, overscan, or interlace
                    STZ.w $1681             ; $03:80A1: 9C 81 16    ;[?]
                    STZ.w $0770             ; $03:80A4: 9C 70 07    ;[?]Set play mode to normal
                    STZ.w $0772             ; $03:80A7: 9C 72 07    ;[?]Black out the screen
                    LDA.b #$00              ; $03:80AA: A9 00       ;\[?]
                    STA.l $7FFFFF           ; $03:80AC: 8F FF FF 7F ;/
                    JSL.l CODE_04FDC4       ; $03:80B0: 22 C4 FD 04 ;Clear BG1/BG2 layer scrolling
                    LDA.b #$09              ; $03:80B4: A9 09       ;\[?]
                    STA.w $120D             ; $03:80B6: 8D 0D 12    ;/
                    STZ.w $0E7E             ; $03:80B9: 9C 7E 0E    ;
                    LDA.b #$10              ; $03:80BC: A9 10       ;
                    STA.w $120B             ; $03:80BE: 8D 0B 12    ;
                    STZ.w $120C             ; $03:80C1: 9C 0C 12    ;
                    STZ.w $1204             ; $03:80C4: 9C 04 12    ;
                    STZ.w $1205             ; $03:80C7: 9C 05 12    ;
                    STZ.w $1206             ; $03:80CA: 9C 06 12    ;
                    STZ.w $1209             ; $03:80CD: 9C 09 12    ;
                    LDA.b #$20              ; $03:80D0: A9 20       ;
                    STA.w $120A             ; $03:80D2: 8D 0A 12    ;
                    LDA.b #$20              ; $03:80D5: A9 20       ;
                    STA.w $0EE0             ; $03:80D7: 8D E0 0E    ;
                    LDA.b #$40              ; $03:80DA: A9 40       ;
                    STA.w $0EE1             ; $03:80DC: 8D E1 0E    ;
                    LDA.b #$80              ; $03:80DF: A9 80       ;
                    STA.w $0EE2             ; $03:80E1: 8D E2 0E    ;
                    STZ.w $1203             ; $03:80E4: 9C 03 12    ;
                    LDA.b #$80              ; $03:80E7: A9 80       ;
                    STA.w $1201             ; $03:80E9: 8D 01 12    ;
                    STZ.w $0154             ; $03:80EC: 9C 54 01    ;
                    STZ.w $15E5             ; $03:80EF: 9C E5 15    ;
                    STZ.w $0E7F             ; $03:80F2: 9C 7F 0E    ;
                    STZ.w $0776             ; $03:80F5: 9C 76 07    ;
                    STA.w $0722             ; $03:80F8: 8D 22 07    ;
                    STZ.w $0E67             ; $03:80FB: 9C 67 0E    ;
                    STZ.b $BA               ; $03:80FE: 64 BA       ;
                    STZ.w $0ED6             ; $03:8100: 9C D6 0E    ;
                    STZ.w $0EF9             ; $03:8103: 9C F9 0E    ;
                    STZ.w $0ED4             ; $03:8106: 9C D4 0E    ;
                    STZ.w $1200             ; $03:8109: 9C 00 12    ;
                    STZ.w $0773             ; $03:810C: 9C 73 07    ;
                    STZ.w $028D             ; $03:810F: 9C 8D 02    ;
                    REP   #$20              ; $03:8112: C2 20       ;16-bit A
                    LDA.w #$0000            ; $03:8114: A9 00 00    ;
                    STA.w $1000             ; $03:8117: 8D 00 10    ;
                    STA.w $1100             ; $03:811A: 8D 00 11    ;
                    LDA.w #$FFFF            ; $03:811D: A9 FF FF    ;
                    STA.w $1702             ; $03:8120: 8D 02 17    ;
                    STA.l $7F0002           ; $03:8123: 8F 02 00 7F ;
                    STA.l $7F2002           ; $03:8127: 8F 02 20 7F ;
                    PHD                     ; $03:812B: 0B          ;Push direct page
                    LDA.w #$4300            ; $03:812C: A9 00 43    ;\Direct page: $4300
                    TCD                     ; $03:812F: 5B          ;/
                    LDX.b #$80              ; $03:8130: A2 80       ;\Increment after writing $2119/reading $213A
                    STX.w $2115             ; $03:8132: 8E 15 21    ;/Increment by 1; no remapping
                    REP   #$20              ; $03:8135: C2 20       ;16-bit A
                    LDA.w #$2000>>1         ; $03:8137: A9 00 10    ;\
                    STA.w $2116             ; $03:813A: 8D 16 21    ; |Write BG1/2 GFX data to VRAM
                    LDA.w #$1801            ; $03:813D: A9 01 18    ; |
                    STA.b $4300             ; $03:8140: 85 00       ; |Base register: $2118 (VRAM Data Write low byte)
                    LDA.w #DATA_068000      ; $03:8142: A9 00 80    ; |Writing mode: 2 regs write once
                    STA.b $4302             ; $03:8145: 85 02       ; |Source: $06:8000 (SMB1 BG1/2 GFX)
                    LDY.b #DATA_068000>>$10 ; $03:8147: A0 06       ; |Dest: VRAM $2000
                    STY.b $4304             ; $03:8149: 84 04       ; |Size: 0x4000 bytes (0x200 tiles)
                    LDA.w #$4000            ; $03:814B: A9 00 40    ; |
                    STA.b $4305             ; $03:814E: 85 05       ; |
                    LDX.b #$01              ; $03:8150: A2 01       ; |
                    STX.w $420B             ; $03:8152: 8E 0B 42    ;/
                    LDA.w #$C000>>1         ; $03:8155: A9 00 60    ;\
                    STA.w $2116             ; $03:8158: 8D 16 21    ; |Write OBJ GFX data to VRAM
                    LDA.w #DATA_078000      ; $03:815B: A9 00 80    ; |
                    STA.b $4302             ; $03:815E: 85 02       ; |Base register: $2118 (VRAM Data Write low byte)
                    LDY.b #DATA_078000>>$10 ; $03:8160: A0 07       ; |Writing mode: 2 regs write once
                    STY.b $4304             ; $03:8162: 84 04       ; |Source: $07:8000 (SMB1 OBJ GFX)
                    LDA.w #$4000            ; $03:8164: A9 00 40    ; |Dest: VRAM $C000
                    STA.b $4305             ; $03:8167: 85 05       ; |Size: 0x4000 bytes (0x200 tiles)
                    STX.w $420B             ; $03:8169: 8E 0B 42    ;/
                    LDA.w #$A000>>1         ; $03:816C: A9 00 50    ;\
                    STA.w $2116             ; $03:816F: 8D 16 21    ; |Write BG3 GFX data to VRAM
                    LDA.w #DATA_0CF800      ; $03:8172: A9 00 F8    ; |
                    STA.b $4302             ; $03:8175: 85 02       ; |Base register: $2118 (VRAM Data Write low byte)
                    LDY.b #DATA_0CF800>>$10 ; $03:8177: A0 0C       ; |Writing mode: 2 regs write once
                    STY.b $4304             ; $03:8179: 84 04       ; |Source: $07:8000 (SMB1 BG3 GFX)
                    LDA.w #$0800            ; $03:817B: A9 00 08    ; |Dest: VRAM $C000
                    STA.b $4305             ; $03:817E: 85 05       ; |Size: 0x800 bytes (0x80 tiles; 2BPP format)
                    STX.w $420B             ; $03:8180: 8E 0B 42    ;/
                    PLD                     ; $03:8183: 2B          ;Recover direct page
                    SEP   #$20              ; $03:8184: E2 20       ;8-bit A
                    JSL.l CODE_0480AE       ; $03:8186: 22 AE 80 04 ;
                    STZ.w $1608             ; $03:818A: 9C 08 16    ;\
                    STZ.w $1609             ; $03:818D: 9C 09 16    ; |[?]Possible SFX hardware mirrors
                    STZ.w $160F             ; $03:8190: 9C 0F 16    ; |
                    STZ.w $160E             ; $03:8193: 9C 0E 16    ; |
                    STZ.w $160A             ; $03:8196: 9C 0A 16    ; |
                    STA.w $160D             ; $03:8199: 8D 0D 16    ; |
                    LDA.b #$01              ; $03:819C: A9 01       ; |
                    STA.w $160C             ; $03:819E: 8D 0C 16    ;/
                    LDA.b #$81              ; $03:81A1: A9 81       ;\
                    STA.b $09               ; $03:81A3: 85 09       ; |Enable NMI and auto-joypad read
                    STA.w $4200             ; $03:81A5: 8D 00 42    ;/
                    CLI                     ; $03:81A8: 58          ;Clear interrupt disable flag

;-------SMB1 Main Program Loop
.loop               LDA.w $0154             ; $03:81A9: AD 54 01    ;\Wait for "Main program loop initialize" flag to be
                    BEQ   .loop             ; $03:81AC: F0 FB       ;/set during NMI.
                    JSL.l CODE_05C800       ; $03:81AE: 22 00 C8 05 ;
                    LDA.w $07B7             ; $03:81B2: AD B7 07    ;\
                    AND.b #$02              ; $03:81B5: 29 02       ; |[?]Random number generator
                    STA.w $07C7             ; $03:81B7: 8D C7 07    ; |
                    LDA.w $07B8             ; $03:81BA: AD B8 07    ; |
                    AND.b #$02              ; $03:81BD: 29 02       ; |
                    EOR.w $07C7             ; $03:81BF: 4D C7 07    ; |
                    CLC                     ; $03:81C2: 18          ; |
                    BEQ   +                 ; $03:81C3: F0 01       ; |
                    SEC                     ; $03:81C5: 38          ; |
+                   ROR.w $07B7             ; $03:81C6: 6E B7 07    ; |
                    ROR.w $07B8             ; $03:81C9: 6E B8 07    ; |
                    ROR.w $07B9             ; $03:81CC: 6E B9 07    ; |
                    ROR.w $07BA             ; $03:81CF: 6E BA 07    ; |
                    ROR.w $07BB             ; $03:81D2: 6E BB 07    ; |
                    ROR.w $07BC             ; $03:81D5: 6E BC 07    ; |
                    ROR.w $07BD             ; $03:81D8: 6E BD 07    ;/
                    JSL.l CODE_048163       ; $03:81DB: 22 63 81 04 ;[?]SFX Mirrors
                    LDA.l $700007           ; $03:81DF: AF 07 00 70 ;
                    BEQ   ++                ; $03:81E3: F0 20       ;
                    PHX                     ; $03:81E5: DA          ;
                    LDX.w $0EC3             ; $03:81E6: AE C3 0E    ;
                    LDA.w $0FFA,x           ; $03:81E9: BD FA 0F    ;
                    AND.b #$20              ; $03:81EC: 29 20       ;
                    BEQ   +                 ; $03:81EE: F0 03       ;
                    INC.w $15E5             ; $03:81F0: EE E5 15    ;
+                   LDA.w $0FFA,x           ; $03:81F3: BD FA 0F    ;
                    PLX                     ; $03:81F6: FA          ;
                    AND.b #$10              ; $03:81F7: 29 10       ;
                    BNE   ++                ; $03:81F9: D0 0A       ;
                    LDA.w $15E5             ; $03:81FB: AD E5 15    ;
                    AND.b #$01              ; $03:81FE: 29 01       ;
                    BEQ   ++                ; $03:8200: F0 03       ;
                    JMP.w .end              ; $03:8202: 4C D4 82    ;

++                  JSL.l CODE_05E634       ; $03:8205: 22 34 E6 05 ;
                    JSR.w CODE_038555       ; $03:8209: 20 55 85    ;
                    JSL.l CODE_05EE3A       ; $03:820C: 22 3A EE 05 ;
                    LDA.b $5C               ; $03:8210: A5 5C       ;
                    BNE   +                 ; $03:8212: D0 04       ;
                    JSL.l CODE_0488BF       ; $03:8214: 22 BF 88 04 ;
+                   LDA.w $0ED6             ; $03:8218: AD D6 0E    ;
                    BMI   ++                ; $03:821B: 30 1E       ;
                    BEQ   +++               ; $03:821D: F0 40       ;
                    LDA.w $07B0             ; $03:821F: AD B0 07    ;
                    BEQ   +++               ; $03:8222: F0 3B       ;
                    LDX.w $0753             ; $03:8224: AE 53 07    ;
                    LDA.w $0FFA,x           ; $03:8227: BD FA 0F    ;
                    BMI   +                 ; $03:822A: 30 07       ;
                    LDA.w $0FF6,x           ; $03:822C: BD F6 0F    ;
                    AND.b #$90              ; $03:822F: 29 90       ;
                    BEQ   +++               ; $03:8231: F0 2C       ;
+                   STZ.w $07B0             ; $03:8233: 9C B0 07    ;
                    STZ.w $0ED6             ; $03:8236: 9C D6 0E    ;
                    BRA   +++               ; $03:8239: 80 24       ;

++                  LDA.w $0FFA             ; $03:823B: AD FA 0F    ;
                    ORA.w $0FF6             ; $03:823E: 0D F6 0F    ;
                    AND.b #$40              ; $03:8241: 29 40       ;
                    BNE   +                 ; $03:8243: D0 0A       ;
                    LDA.w $0FFB             ; $03:8245: AD FB 0F    ;
                    ORA.w $0FF7             ; $03:8248: 0D F7 0F    ;
                    AND.b #$40              ; $03:824B: 29 40       ;
                    BEQ   +++               ; $03:824D: F0 10       ;
+                   LDA.w $1201             ; $03:824F: AD 01 12    ;
                    CMP.b #$0F              ; $03:8252: C9 0F       ;
                    BNE   +++               ; $03:8254: D0 09       ;
                    LDA.b #$80              ; $03:8256: A9 80       ;\Fade out music
                    STA.w $1602             ; $03:8258: 8D 02 16    ;/
                    JML.l CODE_0080DE       ; $03:825B: 5C DE 80 00 ;

+++                 LDA.w $0E7F             ; $03:825F: AD 7F 0E    ;
                    BEQ   +                 ; $03:8262: F0 05       ;
                    JSR.w CODE_03C296       ; $03:8264: 20 96 C2    ;
                    BRA   .end              ; $03:8267: 80 6B       ;

+                   LDA.w $0776             ; $03:8269: AD 76 07    ;
                    LSR   A                 ; $03:826C: 4A          ;
                    BCS   +++               ; $03:826D: B0 5E       ;
                    PHD                     ; $03:826F: 0B          ;
                    LDA.b #$07              ; $03:8270: A9 07       ;
                    XBA                     ; $03:8272: EB          ;
                    LDA.b #$00              ; $03:8273: A9 00       ;
                    TCD                     ; $03:8275: 5B          ;
                    LDA.b $47               ; $03:8276: A5 47       ;
                    BEQ   +                 ; $03:8278: F0 04       ;
                    DEC.b $47               ; $03:827A: C6 47       ;
                    BNE   ++                ; $03:827C: D0 15       ;
+                   LDX.b #$18              ; $03:827E: A2 18       ;
                    DEC.b $87               ; $03:8280: C6 87       ;
                    BPL   .sub              ; $03:8282: 10 06       ;
                    LDA.b #$14              ; $03:8284: A9 14       ;
                    STA.b $87               ; $03:8286: 85 87       ;
                    LDX.b #$2B              ; $03:8288: A2 2B       ;
.sub                LDA.b $88,x             ; $03:828A: B5 88       ;
                    BEQ   +                 ; $03:828C: F0 02       ;
                    DEC.b $88,x             ; $03:828E: D6 88       ;
+                   DEX                     ; $03:8290: CA          ;
                    BPL   .sub              ; $03:8291: 10 F7       ;
++                  PLD                     ; $03:8293: 2B          ;
                    LDA.w $07B0             ; $03:8294: AD B0 07    ;
                    BNE   +                 ; $03:8297: D0 08       ;
                    LDA.w $0ED6             ; $03:8299: AD D6 0E    ;
                    AND.b #$80              ; $03:829C: 29 80       ;
                    STA.w $0ED6             ; $03:829E: 8D D6 0E    ;
+                   INC.b $09               ; $03:82A1: E6 09       ;
                    INC.w $0E68             ; $03:82A3: EE 68 0E    ;
                    LDA.w $0E68             ; $03:82A6: AD 68 0E    ;
                    AND.b #$18              ; $03:82A9: 29 18       ;
                    CMP.b #$18              ; $03:82AB: C9 18       ;
                    BNE   +                 ; $03:82AD: D0 03       ;
                    STZ.w $0E68             ; $03:82AF: 9C 68 0E    ;
+                   JSL.l CODE_05D472       ; $03:82B2: 22 72 D4 05 ;
                    LDA.w $0722             ; $03:82B6: AD 22 07    ;
                    BEQ   +                 ; $03:82B9: F0 08       ;
                    LDA.b $1B               ; $03:82BB: A5 1B       ;
                    LSR   A                 ; $03:82BD: 4A          ;
                    BCS   +                 ; $03:82BE: B0 03       ;
                    JSR.w CODE_0385C3       ; $03:82C0: 20 C3 85    ;
+                   JSR.w CODE_038545       ; $03:82C3: 20 45 85    ;
                    LDA.w $1680             ; $03:82C6: AD 80 16    ;
                    BMI   +++               ; $03:82C9: 30 02       ;
                    BRA   .end              ; $03:82CB: 80 07       ;

+++                 JSR.w CODE_0385F3       ; $03:82CD: 20 F3 85    ;
                    JSL.l CODE_05DE4C       ; $03:82D0: 22 4C DE 05 ;
.end                JSL.l CODE_05DD7A       ; $03:82D4: 22 7A DD 05 ;
                    STZ.w $0154             ; $03:82D8: 9C 54 01    ;
                    JMP.w .loop             ; $03:82DB: 4C A9 81    ;
