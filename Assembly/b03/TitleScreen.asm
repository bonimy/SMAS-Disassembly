CODE_03868D:        LDA.w $0772             ; $03:868D: AD 72 07    ;
                    ASL   A                 ; $03:8690: 0A          ;
                    TAX                     ; $03:8691: AA          ;
                    JSR.w (PNTR_0386AC,x)   ; $03:8692: FC AC 86    ;
                    LDA.l $701FF2           ; $03:8695: AF F2 1F 70 ;
                    BEQ   +                 ; $03:8699: F0 0D       ;
                    STZ.w $1600             ; $03:869B: 9C 00 16    ;\
                    STZ.w $1601             ; $03:869E: 9C 01 16    ; |Clear sound registers
                    STZ.w $1602             ; $03:86A1: 9C 02 16    ; |
                    STZ.w $1603             ; $03:86A4: 9C 03 16    ;/
                    RTS                     ; $03:86A7: 60          ;

+                   STZ.w $1602             ; $03:86A8: 9C 02 16    ;
                    RTS                     ; $03:86AB: 60          ;

PNTR_0386AC:        dw CODE_039D91
                    dw CODE_038C18
                    dw CODE_039EBA
                    dw CODE_0386B4

CODE_0386B4:        LDA.l $701FF4           ; $03:86B4: AF F4 1F 70 ;
                    BNE   +                 ; $03:86B8: D0 1F       ;
                    LDA.l $701FF6           ; $03:86BA: AF F6 1F 70 ;
                    BEQ   +                 ; $03:86BE: F0 19       ;
                    LDA.w $0FF7             ; $03:86C0: AD F7 0F    ;
                    AND.b #$10              ; $03:86C3: 29 10       ;
                    BEQ   +                 ; $03:86C5: F0 12       ;
                    LDA.w $077A             ; $03:86C7: AD 7A 07    ;
                    BNE   ++                ; $03:86CA: D0 17       ;
                    LDA.w $07B2             ; $03:86CC: AD B2 07    ;
                    BEQ   ++                ; $03:86CF: F0 12       ;
                    LDA.b #$2A              ; $03:86D1: A9 2A       ;\"WRONG" sound
                    STA.w $1603             ; $03:86D3: 8D 03 16    ;/
                    JMP.w +++               ; $03:86D6: 4C A1 87    ;

+                   LDA.w $0FF6             ; $03:86D9: AD F6 0F    ;
                    ORA.w $0FF7             ; $03:86DC: 0D F7 0F    ;
                    BIT.b #$10              ; $03:86DF: 89 10       ;
                    BEQ   +                 ; $03:86E1: F0 37       ;
++                  JMP.w .sub              ; $03:86E3: 4C D3 87    ;

-                   LDA.b #$00              ; $03:86E6: A9 00       ;\
                    STA.l $701FE0           ; $03:86E8: 8F E0 1F 70 ; |
                    STA.l $701FE1           ; $03:86EC: 8F E1 1F 70 ; |Reset high score and its display
                    STA.l $701FE2           ; $03:86F0: 8F E2 1F 70 ; |
                    STA.l $701FE3           ; $03:86F4: 8F E3 1F 70 ; |
                    STA.l $701FE4           ; $03:86F8: 8F E4 1F 70 ; |
                    STA.l $701FE5           ; $03:86FC: 8F E5 1F 70 ; |
                    STA.w $07C8             ; $03:8700: 8D C8 07    ; |
                    STA.w $07C9             ; $03:8703: 8D C9 07    ; |
                    STA.w $07CA             ; $03:8706: 8D CA 07    ; |
                    STA.w $07CB             ; $03:8709: 8D CB 07    ; |
                    STA.w $07CC             ; $03:870C: 8D CC 07    ; |
                    STA.w $07CD             ; $03:870F: 8D CD 07    ;/
                    LDA.b #$08              ; $03:8712: A9 08       ;\High score reset sound
                    STA.w $1600             ; $03:8714: 8D 00 16    ;/
                    JMP.w .return           ; $03:8717: 4C C1 87    ;

+                   LDA.l $701FF2           ; $03:871A: AF F2 1F 70 ;
                    BNE   ++                ; $03:871E: D0 33       ;
                    LDA.w $0FF8             ; $03:8720: AD F8 0F    ;
                    CMP.b #$B0              ; $03:8723: C9 B0       ;
                    BNE   +                 ; $03:8725: D0 07       ;
                    LDA.w $0FF4             ; $03:8727: AD F4 0F    ;
                    CMP.b #$80              ; $03:872A: C9 80       ;
                    BEQ   -                 ; $03:872C: F0 B8       ;Reset high score
+                   LDA.w $0FF9             ; $03:872E: AD F9 0F    ;
                    CMP.b #$B0              ; $03:8731: C9 B0       ;
                    BNE   +                 ; $03:8733: D0 07       ;
                    LDA.w $0FF5             ; $03:8735: AD F5 0F    ;
                    CMP.b #$80              ; $03:8738: C9 80       ;
                    BEQ   -                 ; $03:873A: F0 AA       ;Reset high score
+                   LDA.l $7FFB06           ; $03:873C: AF 06 FB 7F ;
                    BMI   +                 ; $03:8740: 30 07       ;
                    LDA.b #$40              ; $03:8742: A9 40       ;
                    STA.w $07B2             ; $03:8744: 8D B2 07    ;
                    BRA   ++++              ; $03:8747: 80 5B       ;

+                   LDA.w $0FF6             ; $03:8749: AD F6 0F    ;
                    ORA.w $0FF7             ; $03:874C: 0D F7 0F    ;
                    BIT.b #$2C              ; $03:874F: 89 2C       ;
                    BNE   +                 ; $03:8751: D0 0C       ;
++                  LDX.w $07B2             ; $03:8753: AE B2 07    ;
                    BNE   ++++              ; $03:8756: D0 4C       ;
                    JSR.w CODE_038883       ; $03:8758: 20 83 88    ;
                    BCS   .return           ; $03:875B: B0 64       ;
                    BRA   +++++             ; $03:875D: 80 48       ;

+                   LDA.w $07B2             ; $03:875F: AD B2 07    ;
                    BEQ   .return           ; $03:8762: F0 5D       ;
                    LDA.b #$18              ; $03:8764: A9 18       ;
                    STA.w $07B2             ; $03:8766: 8D B2 07    ;
                    LDA.l $7FFB06           ; $03:8769: AF 06 FB 7F ;
                    BMI   +                 ; $03:876D: 30 05       ;
                    STA.w $077A             ; $03:876F: 8D 7A 07    ;
                    BRA   +++               ; $03:8772: 80 2D       ;

+                   LDA.l $701FF2           ; $03:8774: AF F2 1F 70 ;
                    BNE   ++++              ; $03:8778: D0 2A       ;
                    LDA.w $0FF6             ; $03:877A: AD F6 0F    ;
                    ORA.w $0FF7             ; $03:877D: 0D F7 0F    ;
                    BIT.b #$20              ; $03:8780: 89 20       ;
                    BEQ   +                 ; $03:8782: F0 07       ;
                    LDA.w $077A             ; $03:8784: AD 7A 07    ;
                    EOR.b #$01              ; $03:8787: 49 01       ;
                    BRA   ++                ; $03:8789: 80 0E       ;

+                   AND.b #$0C              ; $03:878B: 29 0C       ;
                    BEQ   +++               ; $03:878D: F0 12       ;
                    EOR.b #$08              ; $03:878F: 49 08       ;
                    LSR   A                 ; $03:8791: 4A          ;
                    LSR   A                 ; $03:8792: 4A          ;
                    LSR   A                 ; $03:8793: 4A          ;
                    CMP.w $077A             ; $03:8794: CD 7A 07    ;
                    BEQ   +++               ; $03:8797: F0 08       ;
++                  STA.w $077A             ; $03:8799: 8D 7A 07    ;
                    LDA.b #$01              ; $03:879C: A9 01       ;\Collected a coin sound
                    STA.w $1603             ; $03:879E: 8D 03 16    ;/
+++                 JSR.w CODE_038861       ; $03:87A1: 20 61 88    ;
++++                STZ.w $0FF4             ; $03:87A4: 9C F4 0F    ;
+++++               LDA.w $1603             ; $03:87A7: AD 03 16    ;
                    PHA                     ; $03:87AA: 48          ;
                    JSR.w CODE_03AD74       ; $03:87AB: 20 74 AD    ;
                    STZ.w $1600             ; $03:87AE: 9C 00 16    ;
                    STZ.w $1601             ; $03:87B1: 9C 01 16    ;
                    PLA                     ; $03:87B4: 68          ;
                    STA.w $1603             ; $03:87B5: 8D 03 16    ;
                    LDA.b $0F               ; $03:87B8: A5 0F       ;
                    CMP.b #$06              ; $03:87BA: C9 06       ;
                    BNE   +                 ; $03:87BC: D0 7B       ;
                    STZ.w $0EC8             ; $03:87BE: 9C C8 0E    ;
.return             STZ.w $0770             ; $03:87C1: 9C 70 07    ;
                    STZ.w $0772             ; $03:87C4: 9C 72 07    ;
                    STZ.w $0722             ; $03:87C7: 9C 22 07    ;
                    LDA.b #$01              ; $03:87CA: A9 01       ;
                    STA.w $0E7F             ; $03:87CC: 8D 7F 0E    ;
                    INC.w $0774             ; $03:87CF: EE 74 07    ;
                    RTS                     ; $03:87D2: 60          ;

.sub                LDY.w $07B2             ; $03:87D3: AC B2 07    ;
                    BEQ   .return           ; $03:87D6: F0 E9       ;
                    LDA.b #$29              ; $03:87D8: A9 29       ;\"CORRECT" sound
                    STA.w $1603             ; $03:87DA: 8D 03 16    ;/
                    LDA.l $700008           ; $03:87DD: AF 08 00 70 ;
                    JSR.w CODE_038846       ; $03:87E1: 20 46 88    ;
                    LDA.b #$01              ; $03:87E4: A9 01       ;
                    STA.w $0E67             ; $03:87E6: 8D 67 0E    ;
                    JSR.w CODE_03F710       ; $03:87E9: 20 10 F7    ;
                    JSL.l CODE_04C00B       ; $03:87EC: 22 0B C0 04 ;
                    INC.w $075D             ; $03:87F0: EE 5D 07    ;
                    INC.w $0764             ; $03:87F3: EE 64 07    ;
                    INC.w $0757             ; $03:87F6: EE 57 07    ;
                    INC.w $0770             ; $03:87F9: EE 70 07    ;
                    LDA.w $07FC             ; $03:87FC: AD FC 07    ;
                    STA.w $076A             ; $03:87FF: 8D 6A 07    ;
                    STZ.w $0772             ; $03:8802: 9C 72 07    ;
                    STZ.w $07B2             ; $03:8805: 9C B2 07    ;
                    LDX.b #$0B              ; $03:8808: A2 0B       ;
                    LDA.b #$00              ; $03:880A: A9 00       ;
-                   STA.w $07DA,x           ; $03:880C: 9D DA 07    ;
                    DEX                     ; $03:880F: CA          ;
                    BPL   -                 ; $03:8810: 10 FA       ;
                    PHX                     ; $03:8812: DA          ;
                    STZ.b $E4               ; $03:8813: 64 E4       ;
                    LDA.w $075E             ; $03:8815: AD 5E 07    ;
                    JSR.w CODE_03883A       ; $03:8818: 20 3A 88    ;
                    STA.w $07DF             ; $03:881B: 8D DF 07    ;
                    LDA.b $E4               ; $03:881E: A5 E4       ;
                    STA.w $07DE             ; $03:8820: 8D DE 07    ;
                    STZ.b $E4               ; $03:8823: 64 E4       ;
                    LDA.w $06BB             ; $03:8825: AD BB 06    ;
                    JSR.w CODE_03883A       ; $03:8828: 20 3A 88    ;
                    STA.w $07E5             ; $03:882B: 8D E5 07    ;
                    LDA.b $E4               ; $03:882E: A5 E4       ;
                    STA.w $07E4             ; $03:8830: 8D E4 07    ;
                    LDA.b #$01              ; $03:8833: A9 01       ;
                    STA.w $0E1A             ; $03:8835: 8D 1A 0E    ;
                    PLX                     ; $03:8838: FA          ;
+                   RTS                     ; $03:8839: 60          ;

CODE_03883A:        CMP.b #$0A              ; $03:883A: C9 0A       ;
                    BCC   +                 ; $03:883C: 90 07       ;
                    INC.b $E4               ; $03:883E: E6 E4       ;
                    SEC                     ; $03:8840: 38          ;
                    SBC.b #$0A              ; $03:8841: E9 0A       ;
                    BRA   CODE_03883A       ; $03:8843: 80 F5       ;

+                   RTS                     ; $03:8845: 60          ;

CODE_038846:        STA.w $075F             ; $03:8846: 8D 5F 07    ;
                    STA.w $0766             ; $03:8849: 8D 66 07    ;
                    PHA                     ; $03:884C: 48          ;
                    JSL.l CODE_05C95B       ; $03:884D: 22 5B C9 05 ;
                    PLA                     ; $03:8851: 68          ;
                    RTS                     ; $03:8852: 60          ;

DATA_038853:        dw $000C,$4902,$0580,$122E
                    dw $1024,$1024,$FFFF

CODE_038861:        REP   #$20              ; $03:8861: C2 20       ;
                    LDY.b #$0C              ; $03:8863: A0 0C       ;
-                   LDA.w DATA_038853,y     ; $03:8865: B9 53 88    ;
                    STA.w $1700,y           ; $03:8868: 99 00 17    ;
                    DEY                     ; $03:886B: 88          ;
                    DEY                     ; $03:886C: 88          ;
                    BPL   -                 ; $03:886D: 10 F6       ;
                    LDY.w $077A             ; $03:886F: AC 7A 07    ;
                    BEQ   +                 ; $03:8872: F0 0C       ;
                    LDA.w #$1024            ; $03:8874: A9 24 10    ;
                    STA.w $1706             ; $03:8877: 8D 06 17    ;
                    LDA.w #$122E            ; $03:887A: A9 2E 12    ;
                    STA.w $170A             ; $03:887D: 8D 0A 17    ;
+                   SEP   #$20              ; $03:8880: E2 20       ;
                    RTS                     ; $03:8882: 60          ;

;--------Demo screen playback
CODE_038883:        LDX.w $0717             ; $03:8883: AE 17 07    ;Load current demo action
                    LDA.w $0718             ; $03:8886: AD 18 07    ;Load current action timer
                    BNE   +++               ; $03:8889: D0 19       ;If the timer is still counting down, skip
                    INX                     ; $03:888B: E8          ;
                    INC.w $0717             ; $03:888C: EE 17 07    ;If timer expired, go to next action
                    SEC                     ; $03:888F: 38          ;and set carry by default for demo over.
                    LDA.w $07FB             ; $03:8890: AD FB 07    ;Load alternative demo flag
                    BEQ   +                 ; $03:8893: F0 06       ;Branch if set
                    LDA.l DATA_05EE22-1,x   ; $03:8895: BF 21 EE 05 ;Load alt demo action timer
                    BRA   ++                ; $03:8899: 80 04       ;branch to set value

+                   LDA.l DATA_05EDF5-1,x   ; $03:889B: BF F4 ED 05 ;Load normal demo action timer
++                  STA.w $0718             ; $03:889F: 8D 18 07    ;Set demo action timer
                    BEQ   .end              ; $03:88A2: F0 16       ;End demo if timer set to zero.
+++                 LDA.w $07FB             ; $03:88A4: AD FB 07    ;Load alternative demo flag
                    BEQ   +                 ; $03:88A7: F0 06       ;Branch if set.
                    LDA.l DATA_05EE0B-1,x   ; $03:88A9: BF 0A EE 05 ;Load alt demo action value
                    BRA   ++                ; $03:88AD: 80 04       ;branch to set value

+                   LDA.l DATA_05EDE0-1,x   ; $03:88AF: BF DF ED 05 ;Load demo action value
++                  STA.w $0FF4             ; $03:88B3: 8D F4 0F    ;Save to joypad 1 saved bits
                    DEC.w $0718             ; $03:88B6: CE 18 07    ;Decrement action timer
                    CLC                     ; $03:88B9: 18          ;Clear carry if demo still going
.end                RTS                     ; $03:88BA: 60          ;