CODE_0388BB:        JSR.w .main             ; $03:88BB: 20 D0 88    ;Princess/toad saved sequence activator
                    LDA.w $0772             ; $03:88BE: AD 72 07    ;
                    BEQ   +                 ; $03:88C1: F0 07       ;
                    LDX.b #$00              ; $03:88C3: A2 00       ;
                    STX.b $9E               ; $03:88C5: 86 9E       ;
                    JSR.w CODE_03C3B0       ; $03:88C7: 20 B0 C3    ;
+                   JSR.w CODE_03FD13       ; $03:88CA: 20 13 FD    ;
                    JMP.w CODE_03F710       ; $03:88CD: 4C 10 F7    ;

.main               LDA.w $1680             ; $03:88D0: AD 80 16    ;\
                    BNE   +                 ; $03:88D3: D0 0F       ; |If world 8, jump to other pointers
                    LDA.w $075F             ; $03:88D5: AD 5F 07    ; |
                    CMP.b #$07              ; $03:88D8: C9 07       ; |
                    BEQ   +                 ; $03:88DA: F0 08       ;/
                    LDA.w $0772             ; $03:88DC: AD 72 07    ;
                    ASL   A                 ; $03:88DF: 0A          ;
                    TAX                     ; $03:88E0: AA          ;
                    JMP.w (PNTR_0388EC,x)   ; $03:88E1: 7C EC 88    ;

+                   LDA.w $0772             ; $03:88E4: AD 72 07    ;
                    ASL   A                 ; $03:88E7: 0A          ;
                    TAX                     ; $03:88E8: AA          ;
                    JMP.w (PNTR_0388FA,x)   ; $03:88E9: 7C FA 88    ;

;-------Routines for saving a toad.
PNTR_0388EC:        dw CODE_03D4D0                                  ;$00 - Collapse bridge if necessary
                    dw CODE_0389D2									;
                    dw CODE_0389EA									;
                    dw CODE_038A55									;
                    dw CODE_038A6B									;
                    dw CODE_038993									;
                    dw CODE_038AD4									;

;-------Routines for saving the princess.
PNTR_0388FA:        dw CODE_03D4D0                                  ;$00 - Collapse bridge if necessary
                    dw CODE_0389CC									;
                    dw CODE_0389EA									;
                    dw CODE_038918									;
                    dw CODE_03892C									;
                    dw CODE_038993									;
                    dw CODE_038955									;
                    dw CODE_03895C									;
                    dw CODE_03896B									;
                    dw CODE_03897C									;
                    dw CODE_038981									;
                    dw CODE_038985									;
                    dw CODE_038AD4									;
                    dw CODE_038989									;$0D - Wait until player pushes start button
                    dw CODE_03898E									;$0E - Player chose to continue the game

CODE_038918:        LDA.w $0754               ; $03:8918: AD 54 07    ;
                    BEQ   +                   ; $03:891B: F0 08       ;
                    JSL.l CODE_04DE2D         ; $03:891D: 22 2D DE 04 ;
                    INC.w $0772               ; $03:8921: EE 72 07    ;
                    RTS                       ; $03:8924: 60          ;

+                   INC.w $0772               ; $03:8925: EE 72 07    ;
                    INC.w $0772               ; $03:8928: EE 72 07    ;
                    RTS                       ; $03:892B: 60          ;

CODE_03892C:        STZ.w $0FF4               ; $03:892C: 9C F4 0F    ;
                    STZ.w $0FF6               ; $03:892F: 9C F6 0F    ;
                    STZ.w $0FF5               ; $03:8932: 9C F5 0F    ;
                    STZ.w $0FF7               ; $03:8935: 9C F7 0F    ;
                    STZ.w $0FF8               ; $03:8938: 9C F8 0F    ;
                    STZ.w $0FF9               ; $03:893B: 9C F9 0F    ;
                    STZ.w $0FFA               ; $03:893E: 9C FA 0F    ;
                    STZ.w $0FFB               ; $03:8941: 9C FB 0F    ;
                    LDA.b #$02                ; $03:8944: A9 02       ;
                    STA.w $078F               ; $03:8946: 8D 8F 07    ;
                    JSR.w CODE_03AD70         ; $03:8949: 20 70 AD    ;
                    LDA.w $0754               ; $03:894C: AD 54 07    ;
                    BNE   +                   ; $03:894F: D0 03       ;
                    INC.w $0772               ; $03:8951: EE 72 07    ;
+                   RTS                       ; $03:8954: 60          ;

CODE_038955:        INC.w $0772               ; $03:8955: EE 72 07    ;
                    INC.w $0F87               ; $03:8958: EE 87 0F    ;
                    RTS                       ; $03:895B: 60          ;

CODE_03895C:        JSL.l CODE_04DC5F         ; $03:895C: 22 5F DC 04 ;
                    LDA.w $0F87               ; $03:8960: AD 87 0F    ;
                    CMP.b #$06                ; $03:8963: C9 06       ;
                    BCC   +                   ; $03:8965: 90 03       ;
                    INC.w $0772               ; $03:8967: EE 72 07    ;
+                   RTS                       ; $03:896A: 60          ;

CODE_03896B:        LDA.b #$0E                ; $03:896B: A9 0E       ;\
                    STA.w $1602               ; $03:896D: 8D 02 16    ;/Princess got rescued music.
                    JSL.l CODE_04D860         ; $03:8970: 22 60 D8 04 ;Upload new palettes for the kiss sequence
                    JSL.l CODE_05DE12         ; $03:8974: 22 12 DE 05 ;
                    INC.w $0772               ; $03:8978: EE 72 07    ;
                    RTS                       ; $03:897B: 60          ;

CODE_03897C:        JSL.l CODE_04DE8B         ; $03:897C: 22 8B DE 04 ;
                    RTS                       ; $03:8980: 60          ;

CODE_038981:        INC.w $0772               ; $03:8981: EE 72 07    ;
                    RTS                       ; $03:8984: 60          ;

CODE_038985:        INC.w $0772               ; $03:8985: EE 72 07    ;
                    RTS                       ; $03:8988: 60          ;

CODE_038989:        JSL.l CODE_04862A         ; $03:8989: 22 2A 86 04 ;Wait until player pushes the start button
                    RTS                       ; $03:898D: 60          ;

CODE_03898E:        JSL.l CODE_048640         ; $03:898E: 22 40 86 04 ;Player chose to continue the game
                    RTS                       ; $03:8992: 60          ;

CODE_038993:        LDA.w $07B1               ; $03:8993: AD B1 07    ;
                    CMP.b #$06                ; $03:8996: C9 06       ;
                    BCS   ++                  ; $03:8998: B0 31       ;
                    LDA.w $2143               ; $03:899A: AD 43 21    ;
                    AND.b #$7F                ; $03:899D: 29 7F       ;\
                    CMP.b #$4B                ; $03:899F: C9 4B       ; |If the "Timer converted to score" sound...
                    BEQ   +                   ; $03:89A1: F0 05       ;/...is already playing, skip the SFX write
                    LDA.b #$4B                ; $03:89A3: A9 4B       ;\"Timer converted to score" sound
                    STA.w $1603               ; $03:89A5: 8D 03 16    ;/(At level end)
+                   JSR.w CODE_03D809         ; $03:89A8: 20 09 D8    ;
                    LDA.w $07E9               ; $03:89AB: AD E9 07    ;\
                    ORA.w $07EA               ; $03:89AE: 0D EA 07    ; |Check if timer is 000 during decrement
                    ORA.w $07EB               ; $03:89B1: 0D EB 07    ; |at level end. If it is not 000, return
                    BNE   ++                  ; $03:89B4: D0 15       ;/
                    LDA.b #$4C                ; $03:89B6: A9 4C       ;\Stops the "Timer converted to score" sound
                    STA.w $1603               ; $03:89B8: 8D 03 16    ;/(at level end)
                    STA.w $0E1A               ; $03:89BB: 8D 1A 0E    ;
                    LDA.b #$30                ; $03:89BE: A9 30       ;
                    STA.w $0788               ; $03:89C0: 8D 88 07    ;
                    LDA.b #$06                ; $03:89C3: A9 06       ;
                    STA.w $07B1               ; $03:89C5: 8D B1 07    ;
                    INC.w $0772               ; $03:89C8: EE 72 07    ;
++                  RTS                       ; $03:89CB: 60          ;

CODE_0389CC:        JSL.l CODE_04DE54         ; $03:89CC: 22 54 DE 04 ;
                    BRA   CODE_0389DB         ; $03:89D0: 80 09       ;

CODE_0389D2:        LDA.w $0B76               ; $03:89D2: AD 76 0B    ;
                    BEQ   CODE_0389E5         ; $03:89D5: F0 0E       ;
                    JSL.l CODE_04ED07         ; $03:89D7: 22 07 ED 04 ;
CODE_0389DB:        LDX.w $071B               ; $03:89DB: AE 1B 07    ;
                    INX                       ; $03:89DE: E8          ;
                    STX.w $0203               ; $03:89DF: 8E 03 02    ;
                    JMP.w CODE_038F16         ; $03:89E2: 4C 16 8F    ;

CODE_0389E5:        JSL.l CODE_04ECCA         ; $03:89E5: 22 CA EC 04 ;
                    RTS                       ; $03:89E9: 60          ;

CODE_0389EA:        LDA.b $96                 ; $03:89EA: A5 96       ;
                    BEQ   +                   ; $03:89EC: F0 01       ;
                    RTS                       ; $03:89EE: 60          ;

+                   LDA.w $0F82               ; $03:89EF: AD 82 0F    ;
                    BEQ   +                   ; $03:89F2: F0 04       ;
                    JSL.l CODE_04DD55         ; $03:89F4: 22 55 DD 04 ;
+                   LDY.b #$00                ; $03:89F8: A0 00       ;
                    STY.w $0204               ; $03:89FA: 8C 04 02    ;
                    LDA.b $78                 ; $03:89FD: A5 78       ;
                    CMP.w $0203               ; $03:89FF: CD 03 02    ;
                    BNE   ++                  ; $03:8A02: D0 24       ;
                    LDA.w $075F               ; $03:8A04: AD 5F 07    ;
                    CMP.b #$07                ; $03:8A07: C9 07       ;
                    BNE   +                   ; $03:8A09: D0 09       ;
                    INC.w $0204               ; $03:8A0B: EE 04 02    ;
                    JSL.l CODE_04DBDA         ; $03:8A0E: 22 DA DB 04 ;
                    BRA   +++                 ; $03:8A12: 80 18       ;

+                   CMP.b #$02                ; $03:8A14: C9 02       ;
                    BNE   +                   ; $03:8A16: D0 09       ;
                    LDA.w $0219               ; $03:8A18: AD 19 02    ;
                    CMP.b #$44                ; $03:8A1B: C9 44       ;
                    BCS   +++                 ; $03:8A1D: B0 0D       ;
                    BRA   ++                  ; $03:8A1F: 80 07       ;

+                   LDA.w $0219               ; $03:8A21: AD 19 02    ;
                    CMP.b #$54                ; $03:8A24: C9 54       ;
                    BCS   +++                 ; $03:8A26: B0 04       ;
++                  INC.w $0204               ; $03:8A28: EE 04 02    ;
                    INY                       ; $03:8A2B: C8          ;
+++                 TYA                       ; $03:8A2C: 98          ;
                    JSR.w CODE_03AFEA         ; $03:8A2D: 20 EA AF    ;
                    LDA.w $071A               ; $03:8A30: AD 1A 07    ;
                    CMP.w $0203               ; $03:8A33: CD 03 02    ;
                    BEQ   +                   ; $03:8A36: F0 17       ;
                    LDA.w $0768               ; $03:8A38: AD 68 07    ;
                    CLC                       ; $03:8A3B: 18          ;
                    ADC.b #$80                ; $03:8A3C: 69 80       ;
                    STA.w $0768               ; $03:8A3E: 8D 68 07    ;
                    LDA.b #$01                ; $03:8A41: A9 01       ;
                    ADC.b #$00                ; $03:8A43: 69 00       ;
                    TAY                       ; $03:8A45: A8          ;
                    JSR.w CODE_03AE82         ; $03:8A46: 20 82 AE    ;
                    JSR.w CODE_03AE2C         ; $03:8A49: 20 2C AE    ;
                    INC.w $0204               ; $03:8A4C: EE 04 02    ;
+                   LDA.w $0204               ; $03:8A4F: AD 04 02    ;
                    BEQ   CODE_038AD0         ; $03:8A52: F0 7C       ;
                    RTS                       ; $03:8A54: 60          ;

CODE_038A55:        INC.w $0F7F               ; $03:8A55: EE 7F 0F    ;
                    LDA.w $0F7F               ; $03:8A58: AD 7F 0F    ;
                    CMP.b #$70                ; $03:8A5B: C9 70       ;
                    BNE   +                   ; $03:8A5D: D0 0B       ;
                    LDA.b #$01                ; $03:8A5F: A9 01       ;
                    STA.w $0F7E               ; $03:8A61: 8D 7E 0F    ;
                    STZ.w $0F7F               ; $03:8A64: 9C 7F 0F    ;
                    INC.w $0772               ; $03:8A67: EE 72 07    ;
+                   RTS                       ; $03:8A6A: 60          ;

CODE_038A6B:        LDA.w $0749               ; $03:8A6B: AD 49 07    ;
                    BNE   +++                 ; $03:8A6E: D0 43       ;
                    LDA.w $0719               ; $03:8A70: AD 19 07    ;
                    BEQ   ++                  ; $03:8A73: F0 17       ;
                    CMP.b #$09                ; $03:8A75: C9 09       ;
                    BCS   +++                 ; $03:8A77: B0 3A       ;
                    LDY.w $075F               ; $03:8A79: AC 5F 07    ;
                    CPY.b #$07                ; $03:8A7C: C0 07       ;
                    BNE   +                   ; $03:8A7E: D0 08       ;
                    CMP.b #$03                ; $03:8A80: C9 03       ;
                    BCC   +++                 ; $03:8A82: 90 2F       ;
                    SBC.b #$01                ; $03:8A84: E9 01       ;
                    BRA   ++                  ; $03:8A86: 80 04       ;

+                   CMP.b #$02                ; $03:8A88: C9 02       ;
                    BCC   +++                 ; $03:8A8A: 90 27       ;
++                  TAY                       ; $03:8A8C: A8          ;
                    BNE   +                   ; $03:8A8D: D0 08       ;
                    LDA.w $0753               ; $03:8A8F: AD 53 07    ;
                    BEQ   ++                  ; $03:8A92: F0 14       ;
                    INY                       ; $03:8A94: C8          ;
                    BNE   ++                  ; $03:8A95: D0 11       ;
+                   INY                       ; $03:8A97: C8          ;
                    LDA.w $075F               ; $03:8A98: AD 5F 07    ;
                    CMP.b #$07                ; $03:8A9B: C9 07       ;
                    BEQ   ++                  ; $03:8A9D: F0 09       ;
                    DEY                       ; $03:8A9F: 88          ;
                    CPY.b #$04                ; $03:8AA0: C0 04       ;
                    BCS   ++++                ; $03:8AA2: B0 22       ;
                    CPY.b #$03                ; $03:8AA4: C0 03       ;
                    BCS   +++                 ; $03:8AA6: B0 0B       ;
++                  CPY.b #$03                ; $03:8AA8: C0 03       ;
                    BNE   +                   ; $03:8AAA: D0 00       ;
+                   TYA                       ; $03:8AAC: 98          ;
                    CLC                       ; $03:8AAD: 18          ;
                    ADC.b #$0C                ; $03:8AAE: 69 0C       ;
                    STA.w $0773               ; $03:8AB0: 8D 73 07    ;[?]Happens during toad rescued
+++                 LDA.w $0749               ; $03:8AB3: AD 49 07    ;
                    CLC                       ; $03:8AB6: 18          ;
                    ADC.b #$04                ; $03:8AB7: 69 04       ;
                    STA.w $0749               ; $03:8AB9: 8D 49 07    ;
                    LDA.w $0719               ; $03:8ABC: AD 19 07    ;
                    ADC.b #$00                ; $03:8ABF: 69 00       ;
                    STA.w $0719               ; $03:8AC1: 8D 19 07    ;
                    CMP.b #$07                ; $03:8AC4: C9 07       ;
++++                BCC   CODE_038AD3         ; $03:8AC6: 90 0B       ;
                    LDA.b #$06                ; $03:8AC8: A9 06       ;
                    STA.w $07B1               ; $03:8ACA: 8D B1 07    ;
                    STA.w $0E67               ; $03:8ACD: 8D 67 0E    ;
CODE_038AD0:        INC.w $0772               ; $03:8AD0: EE 72 07    ;
CODE_038AD3:        RTS                       ; $03:8AD3: 60          ;

CODE_038AD4:        LDA.w $07B1               ; $03:8AD4: AD B1 07    ;
                    BNE   CODE_038B07         ; $03:8AD7: D0 2E       ;
                    LDA.w $1680               ; $03:8AD9: AD 80 16    ;
                    BNE   CODE_038B08         ; $03:8ADC: D0 2A       ;
                    LDY.w $075F               ; $03:8ADE: AC 5F 07    ;\
                    CPY.b #$07                ; $03:8AE1: C0 07       ; |
                    BCS   CODE_038B08         ; $03:8AE3: B0 23       ;/ If current world is 8 or higher, branch
                    LDA.b #$00                ; $03:8AE5: A9 00       ;\
                    STA.w $0760               ; $03:8AE7: 8D 60 07    ; |
                    STA.w $075C               ; $03:8AEA: 8D 5C 07    ; |Zero out player's current level number (set it to level 1)
                    STA.w $0772               ; $03:8AED: 8D 72 07    ;/ Set operation mode to 0
                    INC.w $075F               ; $03:8AF0: EE 5F 07    ;Increase current world by 1
                    LDA.b #$01                ; $03:8AF3: A9 01       ;\
                    STA.w $0BA5               ; $03:8AF5: 8D A5 0B    ;/Lock animations (for some reason)
                    JSR.w CODE_03A22B         ; $03:8AF8: 20 2B A2    ;Swap players if necessary
                    JSL.l CODE_04C00B         ; $03:8AFB: 22 0B C0 04 ;Set level number and map type
                    INC.w $0757               ; $03:8AFF: EE 57 07    ;Increase operation mode to $01 (because it was set to 0 earlier)
                    LDA.b #$01                ; $03:8B02: A9 01       ;\
                    STA.w $0770               ; $03:8B04: 8D 70 07    ;/Game operation mode = main
CODE_038B07:        RTS                       ; $03:8B07: 60          ;

CODE_038B08:        JMP.w CODE_03A204         ; $03:8B08: 4C 04 A2    ;Handle new world after rescuing the princess

                    RTS                       ; $03:8B0B: 60          ;