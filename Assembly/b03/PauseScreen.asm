;-------[?]Pause routine
CODE_038555:        LDA.w $0770             ; $03:8555: AD 70 07    ;\
                    CMP.b #$02              ; $03:8558: C9 02       ; |Branch if operation mode is Defeated Bowser
                    BEQ   .skip             ; $03:855A: F0 1F       ;/
                    CMP.b #$01              ; $03:855C: C9 01       ;\
                    BNE   .end              ; $03:855E: D0 5E       ;/Branch if operation mode is Main
                    LDA.w $0772             ; $03:8560: AD 72 07    ;
                    CMP.b #$03              ; $03:8563: C9 03       ;
                    BNE   .end              ; $03:8565: D0 57       ;
                    LDA.w $0E67             ; $03:8567: AD 67 0E    ;
                    BNE   .end              ; $03:856A: D0 52       ;
                    LDA.w $1201             ; $03:856C: AD 01 12    ;
                    CMP.b #$0F              ; $03:856F: C9 0F       ;
                    BNE   .end              ; $03:8571: D0 4B       ;
                    LDA.w $0777             ; $03:8573: AD 77 07    ;\
                    BEQ   +                 ; $03:8576: F0 04       ; |Branch if Timer to disable start button = 0
                    DEC.w $0777             ; $03:8578: CE 77 07    ;/Otherwise, keep decreasing
.skip               RTS                     ; $03:857B: 60          ;

+                   LDA.b $0F               ; $03:857C: A5 0F       ;
                    CMP.b #$02              ; $03:857E: C9 02       ;
                    BEQ   .end              ; $03:8580: F0 3C       ;
                    CMP.b #$03              ; $03:8582: C9 03       ;
                    BEQ   .end              ; $03:8584: F0 38       ;
                    LDA.w $0B7A             ; $03:8586: AD 7A 0B    ;
                    BNE   .end              ; $03:8589: D0 33       ;
                    LDA.w $0B75             ; $03:858B: AD 75 0B    ;
                    CMP.b #$02              ; $03:858E: C9 02       ;
                    BCS   .end              ; $03:8590: B0 2C       ;
                    LDA.w $0F8A             ; $03:8592: AD 8A 0F    ;
                    BEQ   +                 ; $03:8595: F0 05       ;
                    DEC.w $0F8A             ; $03:8597: CE 8A 0F    ;
                    BRA   .end              ; $03:859A: 80 22       ;

+                   LDA.w $0B75             ; $03:859C: AD 75 0B    ;\If within pause screen
                    BNE   .end              ; $03:859F: D0 1D       ;/Skip "pause game" button check function
                    LDY.w $0753             ; $03:85A1: AC 53 07    ;\
                    LDA.w $0FF6,y           ; $03:85A4: B9 F6 0F    ; |Get controller data based on player #.
                    AND.b #$10              ; $03:85A7: 29 10       ; | if start is not pressed, continue
                    BEQ   .end              ; $03:85A9: F0 13       ;/
                    LDA.b #$11              ; $03:85AB: A9 11       ;\Else, pause the game
                    STA.w $0777             ; $03:85AD: 8D 77 07    ;/Timer to disable start button (works while outside pause, fading into it)
                    LDA.b #$F1              ; $03:85B0: A9 F1       ;\
                    STA.w $1602             ; $03:85B2: 8D 02 16    ; |Tone down volume of music
                    LDA.b #$43              ; $03:85B5: A9 43       ; |Play pause sound
                    STA.w $1600             ; $03:85B7: 8D 00 16    ;/
                    JSL.l CODE_05DE31       ; $03:85BA: 22 31 DE 05 ;
.end                RTS                     ; $03:85BE: 60          ;

CODE_0385BF:        JSR.w CODE_0385F8       ; $03:85BF: 20 F8 85    ;
                    RTL                     ; $03:85C2: 6B          ;

CODE_0385C3:        PHD                     ; $03:85C3: 0B          ;\
                    LDA.b #$0B              ; $03:85C4: A9 0B       ; |Direct page: $0B00
                    XBA                     ; $03:85C6: EB          ; |
                    LDA.b #$00              ; $03:85C7: A9 00       ; |
                    TCD                     ; $03:85C9: 5B          ;/
                    LDA.b #$90              ; $03:85CA: A9 90       ;
                    STA.b $0B62             ; $03:85CC: 85 62       ;
                    LDA.b #$94              ; $03:85CE: A9 94       ;
                    STA.b $0B63             ; $03:85D0: 85 63       ;
                    LDA.b #$98              ; $03:85D2: A9 98       ;
                    STA.b $0B64             ; $03:85D4: 85 64       ;
                    LDA.b #$9C              ; $03:85D6: A9 9C       ;
                    STA.b $0B65             ; $03:85D8: 85 65       ;
                    LDA.b #$A0              ; $03:85DA: A9 A0       ;
                    STA.b $0B66             ; $03:85DC: 85 66       ;
                    LDA.b #$A4              ; $03:85DE: A9 A4       ;
                    STA.b $0B67             ; $03:85E0: 85 67       ;
                    LDA.b #$A8              ; $03:85E2: A9 A8       ;
                    STA.b $0B68             ; $03:85E4: 85 68       ;
                    LDA.b #$AC              ; $03:85E6: A9 AC       ;
                    STA.b $0B69             ; $03:85E8: 85 69       ;
                    LDA.b #$58              ; $03:85EA: A9 58       ;
                    STA.b $0B6A             ; $03:85EC: 85 6A       ;
                    PLD                     ; $03:85EE: 2B          ;
                    LDA.b $96               ; $03:85EF: A5 96       ;
                    BNE   CODE_038635       ; $03:85F1: D0 42       ;
											; $03:85F3: AD 67 0E
CODE_0385F3:        LDA.w $0E67             ; $03:85F6: D0 74       ;
                    BNE   CODE_03866C       ; $03:85F8: A2 00       ;
CODE_0385F8:        LDX.b #$00              ; $03:85FA: A9 F0       ;
                    LDA.b #$F0              ; $03:85FC: 9D 01 08    ;
-                   STA.w $0801,x           ; $03:85FF: 9D 41 08    ;
                    STA.w $0841,x           ; $03:8602: 9D 81 08    ;
                    STA.w $0881,x           ; $03:8605: 9D C1 08    ;
                    STA.w $08C1,x           ; $03:8608: 9D 01 09    ;
                    STA.w $0901,x           ; $03:860B: 9D 41 09    ;
                    STA.w $0941,x           ; $03:860E: 9D 81 09    ;
                    STA.w $0981,x           ; $03:8611: 9D C1 09    ;
                    STA.w $09C1,x           ; $03:8614: 9E 00 0C    ;
                    STZ.w $0C00,x           ; $03:8617: 9E 40 0C    ;
                    STZ.w $0C40,x           ; $03:861A: 9E 80 0C    ;
                    STZ.w $0C80,x           ; $03:861D: 9E C0 0C    ;
                    STZ.w $0CC0,x           ; $03:8620: 9E 00 0D    ;
                    STZ.w $0D00,x           ; $03:8623: 9E 40 0D    ;
                    STZ.w $0D40,x           ; $03:8626: 9E 80 0D    ;
                    STZ.w $0D80,x           ; $03:8629: 9E C0 0D    ;
                    STZ.w $0DC0,x           ; $03:862C: E8          ;
                    INX                     ; $03:862D: E8          ;
                    INX                     ; $03:862E: E8          ;
                    INX                     ; $03:862F: E8          ;
                    INX                     ; $03:8630: E0 40       ;
                    CPX.b #$40              ; $03:8632: D0 C8       ;
                    BNE   -                 ; $03:8634: 60          ;
                    RTS                     ;
											; $03:8635: A2 00
CODE_038635:        LDX.b #$00              ; $03:8637: A9 F0       ;
                    LDA.b #$F0              ; $03:8639: 9D 41 08    ;
-                   STA.w $0841,x           ; $03:863C: 9D 81 08    ;
                    STA.w $0881,x           ; $03:863F: 9D C1 08    ;
                    STA.w $08C1,x           ; $03:8642: 9D 01 09    ;
                    STA.w $0901,x           ; $03:8645: 9D 41 09    ;
                    STA.w $0941,x           ; $03:8648: 9D 81 09    ;
                    STA.w $0981,x           ; $03:864B: 9D C1 09    ;
                    STA.w $09C1,x           ; $03:864E: 9E 40 0C    ;
                    STZ.w $0C40,x           ; $03:8651: 9E 80 0C    ;
                    STZ.w $0C80,x           ; $03:8654: 9E C0 0C    ;
                    STZ.w $0CC0,x           ; $03:8657: 9E 00 0D    ;
                    STZ.w $0D00,x           ; $03:865A: 9E 40 0D    ;
                    STZ.w $0D40,x           ; $03:865D: 9E 80 0D    ;
                    STZ.w $0D80,x           ; $03:8660: 9E C0 0D    ;
                    STZ.w $0DC0,x           ; $03:8663: E8          ;
                    INX                     ; $03:8664: E8          ;
                    INX                     ; $03:8665: E8          ;
                    INX                     ; $03:8666: E8          ;
                    INX                     ; $03:8667: E0 40       ;
                    CPX.b #$40              ; $03:8669: D0 CE       ;
                    BNE   -                 ; $03:866B: 60          ;
                    RTS                     ;
											; $03:866C: A9 F0
CODE_03866C:        LDA.b #$F0              ; $03:866E: 8D 51 08    ;
                    STA.w $0851             ; $03:8671: 8D 55 08    ;
                    STA.w $0855             ; $03:8674: 8D B1 08    ;
                    STA.w $08B1             ; $03:8677: 8D B5 08    ;
                    STA.w $08B5             ; $03:867A: 8D B9 08    ;
                    STA.w $08B9             ; $03:867D: 8D BD 08    ;
                    STA.w $08BD             ; $03:8680: 8D C1 08    ;
                    STA.w $08C1             ; $03:8683: 8D C5 08    ;
                    STA.w $08C5             ; $03:8686: 8D C9 08    ;
                    STA.w $08C9             ; $03:8689: 8D CD 08    ;
                    STA.w $08CD             ; $03:868C: 60          ;
                    RTS                     ;