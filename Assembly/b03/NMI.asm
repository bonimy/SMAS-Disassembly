;-------Message display command low byte
PNTR_0382DE:        db       $1702
                    db DATA_0399B8
                    db DATA_0399B8
                    db DATA_0399B8
                    db DATA_0399B8
                    db       $1702
                    db       $1A02
                    db       $1A02
                    db DATA_0399B8
                    db DATA_0399B8
                    db DATA_0399B8
                    db DATA_0399B8
                    db DATA_0399B9
                    db DATA_0399DE
                    db DATA_039A03
                    db DATA_039A56
                    db DATA_039A81
                    db DATA_039ABC
                    db DATA_039ADB

;-------Message display command high byte
PNTR_0382F1:        db       $1702>>8
                    db DATA_0399B8>>8
                    db DATA_0399B8>>8
                    db DATA_0399B8>>8
                    db DATA_0399B8>>8
                    db       $1702>>8
                    db       $1A02>>8
                    db       $1A02>>8
                    db DATA_0399B8>>8
                    db DATA_0399B8>>8
                    db DATA_0399B8>>8
                    db DATA_0399B8>>8
                    db DATA_0399B9>>8
                    db DATA_0399DE>>8
                    db DATA_039A03>>8
                    db DATA_039A56>>8
                    db DATA_039A81>>8
                    db DATA_039ABC>>8
                    db DATA_039ADB>>8

DATA_038304:        db $00,$00,$00,$03

;SMB1 NMI ROUTINE
CODE_038308:        PHB                     ; $03:8308: 8B          ;\
                    PHK                     ; $03:8309: 4B          ; |Set program bank to this one
                    PLB                     ; $03:830A: AB          ;/
                    LDA.w $4210             ; $03:830B: AD 10 42    ;Read to enable NMI
                    LDA.w $1201             ; $03:830E: AD 01 12    ;\ Forced blank if
                    BNE   +                 ; $03:8311: D0 02       ; |the screen is pitch-black
                    LDA.b #$80              ; $03:8313: A9 80       ; |
+                   STA.w $2100             ; $03:8315: 8D 00 21    ;/ Otherwise, normal brightness
                    STZ.w $420C             ; $03:8318: 9C 0C 42    ;Reset HDMA
                    LDA.w $0154             ; $03:831B: AD 54 01    ;
                    BEQ   +                 ; $03:831E: F0 03       ;
                    JMP.w .skip             ; $03:8320: 4C 48 84    ;

+                   INC.w $0154             ; $03:8323: EE 54 01    ;
                    LDX.w $0773             ; $03:8326: AE 73 07    ;
                    LDA.w PNTR_0382DE,x     ; $03:8329: BD DE 82    ;
                    STA.b $00               ; $03:832C: 85 00       ;
                    LDA.w PNTR_0382F1,x     ; $03:832E: BD F1 82    ;
                    STA.b $01               ; $03:8331: 85 01       ;
                    LDA.b #$03              ; $03:8333: A9 03       ;
                    STA.b $02               ; $03:8335: 85 02       ;
                    JSR.w CODE_039BBC       ; $03:8337: 20 BC 9B    ;
                    LDX.w $0773             ; $03:833A: AE 73 07    ;
                    CPX.b #$06              ; $03:833D: E0 06       ;
                    BNE   +                 ; $03:833F: D0 11       ;
                    LDA.w $82DE             ; $03:8341: AD DE 82    ;
                    STA.b $00               ; $03:8344: 85 00       ;
                    LDA.w $82F1             ; $03:8346: AD F1 82    ;
                    STA.b $01               ; $03:8349: 85 01       ;
                    LDA.b #$03              ; $03:834B: A9 03       ;
                    STA.b $02               ; $03:834D: 85 02       ;
                    JSR.w CODE_039BBC       ; $03:834F: 20 BC 9B    ;
+                   PHD                     ; $03:8352: 0B          ;\
                    LDA.b #$43              ; $03:8353: A9 43       ; |
                    XBA                     ; $03:8355: EB          ; |Direct page: $4300
                    LDA.b #$00              ; $03:8356: A9 00       ; |
                    TCD                     ; $03:8358: 5B          ;/
                    REP   #$10              ; $03:8359: C2 10       ;16-bit XY
                    LDA.b #$81              ; $03:835B: A9 81       ;
                    STA.w $2115             ; $03:835D: 8D 15 21    ;
                    LDY.w #$1801            ; $03:8360: A0 01 18    ;
                    STY.b $4300             ; $03:8363: 84 00       ;
                    LDA.w $0EF9             ; $03:8365: AD F9 0E    ;
                    BEQ   +                 ; $03:8368: F0 33       ;
                    LDA.b #$7F              ; $03:836A: A9 7F       ;
                    STA.b $4304             ; $03:836C: 85 04       ;
                    REP   #$20              ; $03:836E: C2 20       ;
                    LDY.w #$0040            ; $03:8370: A0 40 00    ;
                    LDX.w #$0000            ; $03:8373: A2 00 00    ;
                    LDA.l $7F0002,x         ; $03:8376: BF 02 00 7F ;
-                   STA.w $2116             ; $03:837A: 8D 16 21    ;
                    TXA                     ; $03:837D: 8A          ;
                    CLC                     ; $03:837E: 18          ;
                    ADC.w #$0004            ; $03:837F: 69 04 00    ;
                    STA.b $4302             ; $03:8382: 85 02       ;
                    STY.b $4305             ; $03:8384: 84 05       ;
                    TXA                     ; $03:8386: 8A          ;
                    CLC                     ; $03:8387: 18          ;
                    ADC.w #$0042            ; $03:8388: 69 42 00    ;
                    TAX                     ; $03:838B: AA          ;
                    LDA.w #$0001            ; $03:838C: A9 01 00    ;
                    STA.w $420B             ; $03:838F: 8D 0B 42    ;
                    LDA.l $7F0002,x         ; $03:8392: BF 02 00 7F ;
                    BPL   -                 ; $03:8396: 10 E2       ;
                    SEP   #$20              ; $03:8398: E2 20       ;
                    STZ.w $0EF9             ; $03:839A: 9C F9 0E    ;
+                   LDA.w $0ED4             ; $03:839D: AD D4 0E    ;
                    BEQ   +                 ; $03:83A0: F0 34       ;
                    LDA.b #$7F              ; $03:83A2: A9 7F       ;
                    STA.b $4304             ; $03:83A4: 85 04       ;
                    REP   #$20              ; $03:83A6: C2 20       ;
                    LDY.w #$0038            ; $03:83A8: A0 38 00    ;
                    LDX.w #$0000            ; $03:83AB: A2 00 00    ;
                    LDA.l $7F2002,x         ; $03:83AE: BF 02 20 7F ;
-                   STA.w $2116             ; $03:83B2: 8D 16 21    ;
                    TXA                     ; $03:83B5: 8A          ;
                    CLC                     ; $03:83B6: 18          ;
                    ADC.w #$2004            ; $03:83B7: 69 04 20    ;
                    STA.b $4302             ; $03:83BA: 85 02       ;
                    STY.b $4305             ; $03:83BC: 84 05       ;
                    TXA                     ; $03:83BE: 8A          ;
                    CLC                     ; $03:83BF: 18          ;
                    ADC.w #$003A            ; $03:83C0: 69 3A 00    ;
                    TAX                     ; $03:83C3: AA          ;
                    LDA.w #$0001            ; $03:83C4: A9 01 00    ;
                    STA.w $420B             ; $03:83C7: 8D 0B 42    ;
                    LDA.l $7F2002,x         ; $03:83CA: BF 02 20 7F ;
                    BPL   -                 ; $03:83CE: 10 E2       ;
                    STZ.w $2000             ; $03:83D0: 9C 00 20    ;
                    STZ.w $0ED4             ; $03:83D3: 9C D4 0E    ;
+                   SEP   #$30              ; $03:83D6: E2 30       ;
                    LDA.b #$80              ; $03:83D8: A9 80       ;
                    STA.w $2115             ; $03:83DA: 8D 15 21    ;
                    JSR.w CODE_039B1D       ; $03:83DD: 20 1D 9B    ;
                    LDA.w $1200             ; $03:83E0: AD 00 12    ;
                    BEQ   ++                ; $03:83E3: F0 2B       ;
                    BMI   +                 ; $03:83E5: 30 24       ;
                    REP   #$10              ; $03:83E7: C2 10       ;
                    STZ.w $2121             ; $03:83E9: 9C 21 21    ;
                    LDY.w #$2200            ; $03:83EC: A0 00 22    ;
                    STY.b $4300             ; $03:83EF: 84 00       ;
                    LDY.w #$1000            ; $03:83F1: A0 00 10    ;
                    STY.b $4302             ; $03:83F4: 84 02       ;
                    LDA.b #$00              ; $03:83F6: A9 00       ;
                    STA.b $4304             ; $03:83F8: 85 04       ;
                    LDY.w #$0200            ; $03:83FA: A0 00 02    ;
                    STY.b $4305             ; $03:83FD: 84 05       ;
                    LDA.b #$01              ; $03:83FF: A9 01       ;
                    STA.w $420B             ; $03:8401: 8D 0B 42    ;
                    SEP   #$10              ; $03:8404: E2 10       ;
                    STZ.w $1200             ; $03:8406: 9C 00 12    ;
                    BRA   ++                ; $03:8409: 80 05       ;

+                   LDA.b #$01              ; $03:840B: A9 01       ;
                    STA.w $1200             ; $03:840D: 8D 00 12    ;
++                  PLD                     ; $03:8410: 2B          ;
                    LDY.b #$00              ; $03:8411: A0 00       ;
                    LDX.w $0773             ; $03:8413: AE 73 07    ;
                    CPX.b #$06              ; $03:8416: E0 06       ;
                    BNE   +                 ; $03:8418: D0 02       ;
                    INY                     ; $03:841A: C8          ;
                    INY                     ; $03:841B: C8          ;
+                   REP   #$20              ; $03:841C: C2 20       ;
                    LDA.w DATA_038304,y     ; $03:841E: B9 04 83    ;
                    REP   #$10              ; $03:8421: C2 10       ;
                    TAX                     ; $03:8423: AA          ;
                    STZ.w $1700,x           ; $03:8424: 9E 00 17    ;
                    LDA.w #$FFFF            ; $03:8427: A9 FF FF    ;
                    STA.w $1702,x           ; $03:842A: 9D 02 17    ;
                    LDA.w #$0000            ; $03:842D: A9 00 00    ;
                    STA.l $7F0000           ; $03:8430: 8F 00 00 7F ;
                    LDA.w $5C               ; $03:8434: AD 5C 00    ;
                    AND.w #$00FF            ; $03:8437: 29 FF 00    ;
                    BEQ   +                 ; $03:843A: F0 07       ;
                    LDA.w #$0000            ; $03:843C: A9 00 00    ;
                    STA.l $7F2000           ; $03:843F: 8F 00 20 7F ;
+                   SEP   #$30              ; $03:8443: E2 30       ;
                    STZ.w $0773             ; $03:8445: 9C 73 07    ;

.skip               PHD                     ; $03:8448: 0B          ;\
                    LDA.b #$21              ; $03:8449: A9 21       ; |
                    XBA                     ; $03:844B: EB          ; |Direct page: $2100
                    LDA.b #$00              ; $03:844C: A9 00       ; |
                    TCD                     ; $03:844E: 5B          ;/
                    LDA.w $120E             ; $03:844F: AD 0E 12    ;\$7E:120E: Window 2 left position
                    STA.b $2128             ; $03:8452: 85 28       ;/
                    LDA.w $120F             ; $03:8454: AD 0F 12    ;\$7E:120F: Window 2 right position
                    STA.b $2129             ; $03:8457: 85 29       ;/
                    LDA.w $1210             ; $03:8459: AD 10 12    ;\$7E:1210: Direct color register
                    STA.b $2132             ; $03:845C: 85 32       ;/
                    LDA.w $1209             ; $03:845E: AD 09 12    ;\$7E:1209: Color addition select
                    STA.b $2130             ; $03:8461: 85 30       ;/
                    LDA.w $120A             ; $03:8463: AD 0A 12    ;\$7E:120A: CGADSUB
                    STA.b $2131             ; $03:8466: 85 31       ;/
                    LDA.w $1204             ; $03:8468: AD 04 12    ;\$7E:1204: Window mask settings for BG1 and 2
                    STA.b $2123             ; $03:846B: 85 23       ;/
                    LDA.w $1205             ; $03:846D: AD 05 12    ;\$7E:1205: Window mask settings for BG3 and 4
                    STA.b $2124             ; $03:8470: 85 24       ;/
                    LDA.w $1206             ; $03:8472: AD 06 12    ;\$7E:1206: Window mask settings for OAM and color wind
                    STA.b $2125             ; $03:8475: 85 25       ;/
                    LDA.w $120B             ; $03:8477: AD 0B 12    ;\$7E:120B: Main screen designation
                    STA.b $212C             ; $03:847A: 85 2C       ;/
                    LDA.w $120C             ; $03:847C: AD 0C 12    ;\$7E:120C: Subscreen designation
                    STA.b $212D             ; $03:847F: 85 2D       ;/
                    LDA.w $1207             ; $03:8481: AD 07 12    ;\$7E:1207: Window mask designation for main screen
                    STA.b $212E             ; $03:8484: 85 2E       ;/
                    LDA.w $1208             ; $03:8486: AD 08 12    ;\$7E:1208: Window mask designation for sub screen
                    STA.b $212F             ; $03:8489: 85 2F       ;/
                    LDA.w $0EE0             ; $03:848B: AD E0 0E    ;\$7E:0EE0: Direct color register
                    STA.b $2132             ; $03:848E: 85 32       ;/
                    LDA.w $0EE1             ; $03:8490: AD E1 0E    ;\$7E:0EE1: Direct color register
                    STA.b $2132             ; $03:8493: 85 32       ;/
                    LDA.w $0EE2             ; $03:8495: AD E2 0E    ;\$7E:0EE2: Direct color register
                    STA.b $2132             ; $03:8498: 85 32       ;/
                    LDA.w $120D             ; $03:849A: AD 0D 12    ;\$7E:120D: Game mode
                    STA.b $2105             ; $03:849D: 85 05       ;/
                    LDA.w $0E7E             ; $03:849F: AD 7E 0E    ;\$7E:0E7E: Screen pixelation/Mosaic
                    STA.b $2106             ; $03:84A2: 85 06       ;/
                    STZ.b $2111             ; $03:84A4: 64 11       ;\Zero out BG3 horizontal scroll
                    STZ.b $2111             ; $03:84A6: 64 11       ;/
                    LDA.w $0ED1             ; $03:84A8: AD D1 0E    ;\
                    BEQ   +                 ; $03:84AB: F0 0A       ; |If starry night IRQ flag is set
                    LDA.w $0EEE             ; $03:84AD: AD EE 0E    ; |
                    STA.b $210F             ; $03:84B0: 85 0F       ; |$7E:0EEE-$7E:0EEF: BG2 Horizontal scroll
                    LDA.w $0EEF             ; $03:84B2: AD EF 0E    ; |
                    STA.b $210F             ; $03:84B5: 85 0F       ;/
+                   LDA.w $0E7F             ; $03:84B7: AD 7F 0E    ;\
                    BNE   ++                ; $03:84BA: D0 2A       ;/Fade in/out things?
                    LDA.w $073F             ; $03:84BC: AD 3F 07    ;\$7E:073F: BG1 xscroll offset low byte
                    STA.b $210D             ; $03:84BF: 85 0D       ;/
                    LDA.w $071A             ; $03:84C1: AD 1A 07    ;\$7E:071A: BG1 xscroll offset high byte
                    STA.b $210D             ; $03:84C4: 85 0D       ;/
                    LDA.w $0ED1             ; $03:84C6: AD D1 0E    ;\
                    BNE   +                 ; $03:84C9: D0 0A       ;/If not Starry Night BG flag
                    LDA.w $0EFD             ; $03:84CB: AD FD 0E    ;\$7E:0EFD: BG2 xscroll offset low byte
                    STA.b $210F             ; $03:84CE: 85 0F       ;/
                    LDA.w $0EFE             ; $03:84D0: AD FE 0E    ;\$7E:0EFE: BG2 xscroll offset high byte
                    STA.b $210F             ; $03:84D3: 85 0F       ;/
+                   LDA.w $0740             ; $03:84D5: AD 40 07    ;\$7E:0E70: BG1 yscroll offset low byte
                    STA.b $210E             ; $03:84D8: 85 0E       ;/
                    STZ.b $210E             ; $03:84DA: 64 0E       ;BG1 yscroll offset high byte hardcoded at #$00
                    LDA.w $0ED2             ; $03:84DC: AD D2 0E    ;\$7E:0ED2: BG2 yscroll offset low byte
                    STA.b $2110             ; $03:84DF: 85 10       ;/
                    LDA.w $0ED3             ; $03:84E1: AD D3 0E    ;\$7E:0ED3: BG2 yscroll offset high byte
                    STA.b $2110             ; $03:84E4: 85 10       ;/
++                  PLD                     ; $03:84E6: 2B          ;recover direct page
                    LDA.w $1203             ; $03:84E7: AD 03 12    ;\$7E:1203: HDMA enable
                    STA.w $420C             ; $03:84EA: 8D 0C 42    ;/
                    LDX.b #$81              ; $03:84ED: A2 81       ;\
                    LDA.w $0EDE             ; $03:84EF: AD DE 0E    ;/If IRQ is active
                    BEQ   +                 ; $03:84F2: F0 14       ;Read IRQ flag for whatever reason
                    LDA.w $4211             ; $03:84F4: AD 11 42    ;
                    LDA.w $0EF2             ; $03:84F7: AD F2 0E    ;\$7E:0EF2: V-timer
                    STA.w $4209             ; $03:84FA: 8D 09 42    ; |With $00 as vtimer high byte
                    STZ.w $420A             ; $03:84FD: 9C 0A 42    ;/
                    STZ.w $4207             ; $03:8500: 9C 07 42    ;\
                    STZ.w $4208             ; $03:8503: 9C 08 42    ;/Store zero to h-timer
                    LDX.b #$A1              ; $03:8506: A2 A1       ;\
+                   STX.w $4200             ; $03:8508: 8E 00 42    ;/Enable NMI, IRQ, and auto joypad-read enable, only
                    PLB                     ; $03:850B: AB          ;when IRQ itself is enabled.
                    RTL                     ; $03:850C: 6B          ;Return from NMI