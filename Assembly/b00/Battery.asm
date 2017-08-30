;-------[?]Tests the integrity of the battery
CODE_008C1B:        SEP   #$20                ;8-bit A
                    LDA.b #$00                ;\
                    STA.l $700007             ;/
                    REP   #$30                ;16-bit AXY
                    LDA.l $700002             ;\
                    CMP.w #$9743              ; |Checks that $70:0002 is #$9743 and that
                    BNE   +                   ; |$70:1FFC is #$5321. These were arbitrary values
                    LDA.l $701FFC             ; |to test that the battery SRAM had not been
                    CMP.w #$5321              ; |corrupted. If it was, reset it all.
                    BEQ   ++                  ;/
+                   SEP   #$10                ;8-bit XY
                    LDA.w #$2000              ;\
                    STA.b $00                 ; |Clear memory
                    LDA.w #$0000              ; |Source: $70:0000
                    LDY.b #$70                ; |Size: 0x2000 bytes
                    JSL.l CODE_00868E         ;/
                    REP   #$10                ;16-bit XY
                    LDX.w #$0000              ;\
-                   JSR.w CODE_008D83         ; |[?]Set up a table of delta values that
                    LDA.l $700004             ; |are all summed together.
                    INC   A                   ; |
                    STA.l $700004             ; |Perhaps this tests the integrity of the
                    CMP.w #$0010              ; |battery?
                    BCC   -                   ;/
                    LDA.w #$9743              ;\
                    STA.l $700002             ; |Set $70:0002 and $70:1FFC to their
                    LDA.w #$5321              ; |arbitrary values and restart the
                    STA.l $701FFC             ; |routine to try again.
                    JMP.w CODE_008C1B         ;/

++                  LDA.w #$0000              ;\
                    STA.l $700004             ; |Initialize X and Y registers
                    TAX                       ;/|
-                   AND.w #$0003              ;\|
                    ASL   A                   ; |Set Y register
                    TAY                       ;/
                    LDA.w DATA_008DDB,y       ;\
                    DEC   A                   ; |The number of elements at $00:8DE3,y
                    DEC   A                   ; |to add together
                    TAY                       ;/
                    STZ.b $00                 ;Set the initial sum to #$0000
                    STX.b $02                 ;Save X-register to $7E:0002
                    SEP   #$20                ;8-bit A
--                  LDA.l $700010,x           ;\
                    CLC                       ; |The delta values saved in SRAM are now
                    ADC.b $00                 ; |added together and stored to $7E:0000
                    STA.b $00                 ; |
                    LDA.b $01                 ; |
                    ADC.b #$00                ; |
                    STA.b $01                 ; |
                    INX                       ; |
                    DEY                       ; |
                    BNE   --                  ;/
                    REP   #$21                ;16-bit A, clear carry flag
                    LDA.b $00                 ;\
                    ADC.l $700010,x           ; |The sum should be zero on a working battery.
                    BNE   +                   ;/
                    INX                       ;\
                    INX                       ; |Update the X register and $70:0004. Repeat the
--                  LDA.l $700004             ; |check 16 (0x10) times at the other SRAM locations.
                    INC   A                   ; |
                    STA.l $700004             ; |
                    CMP.w #$0010              ; |
                    BCS   ++                  ; |
                    BRA   -                   ;/

+                   REP   #$30                ;16-bit AXY
                    LDX.b $02                 ;\
                    JSR.w CODE_008D83         ; |Rewrite the delta values and continue the loop
                    STX.b $02                 ; |regardless of success.
                    BRA   --                  ;/
++                  JMP.w .end                ;End the test now. The rest of the code is never used.
                    LDA.l $700389             ;\
                    STA.b $00                 ; |This looks like just random math that serves no purpose.
                    LDA.l $700370             ; |
                    AND.w #$00FF              ; |
                    CLC                       ; |
                    ADC.b $00                 ; |
                    SEC                       ; |
                    SBC.w #$0007              ; |
                    STA.b $00                 ; |
                    LDA.l $700371             ; |
                    AND.w #$00FF              ; |
                    CLC                       ; |
                    ADC.b $00                 ; |
                    SEC                       ; |
                    SBC.w #$0003              ; |
                    STA.l $700389             ; |
                    LDA.w #$0307              ; |
                    STA.l $700370             ; |
                    LDA.l $70038A             ; |
                    STA.b $00                 ; |
                    LDA.l $700379             ; |
                    AND.w #$00FF              ; |
                    CLC                       ; |
                    ADC.b $00                 ; |
                    SEC                       ; |
                    SBC.w #$000C              ; |
                    STA.b $00                 ; |
                    LDA.l $70037A             ; |
                    AND.w #$00FF              ; |
                    CLC                       ; |
                    ADC.b $00                 ; |
                    SEC                       ; |
                    SBC.w #$0003              ; |
                    STA.l $70038A             ; |
                    LDA.w #$030C              ; |
                    STA.l $700379             ; |
                    LDA.l $700388             ; |
                    STA.b $00                 ; |
                    LDA.l $700381             ; |
                    AND.w #$00FF              ; |
                    CLC                       ; |
                    ADC.b $00                 ; |
                    SEC                       ; |
                    SBC.w #$0006              ; |
                    STA.b $00                 ; |
                    LDA.l $700382             ; |
                    AND.w #$00FF              ; |
                    CLC                       ; |
                    ADC.b $00                 ; |
                    SEC                       ; |
                    SBC.w #$0001              ; |
                    STA.l $700388             ; |
                    LDA.w #$0106              ; |
                    STA.l $700381             ; |
                    LDA.l $7004A0             ; |
                    STA.b $00                 ; |
                    LDA.l $70038A             ; |
                    AND.w #$00FF              ; |
                    CLC                       ; |
                    ADC.b $00                 ; |
                    SEC                       ; |
                    SBC.w #$0006              ; |
                    STA.b $00                 ; |
                    LDA.l $70038B             ; |
                    AND.w #$00FF              ; |
                    CLC                       ; |
                    ADC.b $00                 ; |
                    SEC                       ; |
                    SBC.w #$0000              ; |
                    STA.l $7004A0             ; |
                    LDA.w #$0007              ; |
                    STA.l $70038A             ;/
.end                SEP   #$30                ;16-bit AXY
                    RTS                       ;

CODE_008D83:        LDA.l $700004             ;\
                    AND.w #$0003              ; |Set Y index for routine
                    ASL   A                   ; |(index is for word values)
                    TAY                       ;/
                    LDA.w DATA_008DDB,y       ;\
                    DEC   A                   ; |The number of elements at $00:8DE3,y
                    DEC   A                   ; |to add together
                    STA.b $0E                 ;/
                    LDA.w DATA_008DD3,y       ;\The start location for where to begin
                    TAY                       ;/adding at $00:8DE3,y
                    STZ.b $00                 ;Set the initial sum to #$0000.
                    SEP   #$20                ;8-bit A
-                   LDA.w DATA_008DE3,y       ;\
                    STA.l $700010,x           ; |Each value from $00:8DE3 is stored separately
                    CLC                       ; |in $70:0010,x and all of these values are
                    ADC.b $00                 ; |added together and the sum is stored to $7E:0000
                    STA.b $00                 ; |(as a word value). The start location is
                    LDA.b $01                 ; |determined by $00:8DD3 and the number of
                    ADC.b #$00                ; |elements to add together by $00:8DDB.
                    STA.b $01                 ;/
                    LDA.w DATA_008DE3,y       ;This serves no purpose
                    INX                       ;\
                    INY                       ; |Increment loop index (X and Y
                    DEC.b $0E                 ; |registers) and decrement loop
                    BNE   -                   ; |counter (which is a word value)
                    DEC.b $0F                 ; |and continue loop accordingly
                    BPL   -                   ;/
                    REP   #$20                ;16-bit A
                    LDA.w #$0000              ;\
                    SEC                       ; |Set the negative value of $7E:0000
                    SBC.b $00                 ; |to $70:0010,x
                    STA.l $700010,x           ;/
                    LDA.b $D0                 ;\
                    AND.w #$0003              ; |A routine involving the selected game
                    CMP.w #$0003              ; |cut for a reason we will never know.
                    BNE   +                   ;/
+                   INX                       ;\Increment the X register since the negative
                    INX                       ;/of $7E:0000 was written to its current index.
                    RTS                       ;

DATA_008DD3:        dw $0000,$0009,$0011,$001A ;
DATA_008DDB:        dw $0009,$0008,$0009,$0106 ;

DATA_008DE3:        db $FF,$FF,$FF,$04,$04,$00,$FF,$00 ;
                    db $00,$FF,$FF,$FF,$04,$00,$FF,$00 ;
                    db $00,$FF,$FF,$05,$00,$00,$00,$00 ;
                    db $00,$00,$FF,$FF,$04,$04,$70,$80 ;
                    db $80,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$D0,$C0,$A0,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $01,$00,$03,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$00,$00,$00 ;
                    db $00,$00,$00,$00,$00,$FF,$00,$00 ;