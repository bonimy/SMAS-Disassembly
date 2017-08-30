CODE_038C18:    LDA $073C               ; $03:8C18: AD 3C 07    ;\
                ASL A                   ; $03:8C1B: 0A          ; | Current screen routine to execute
                TAX                     ; $03:8C1C: AA          ; |
                JMP (PNTR_038C20,x)     ; $03:8C1D: 7C 20 8C    ;/

PNTR_038C20:    dw CODE_038C3E                                  ;$00 -
                dw CODE_038C50                                  ;$01 -
                dw CODE_038C83                                  ;$02 -
                dw CODE_038C8B                                  ;$03 -
                dw CODE_038CFF                                  ;$04 -
                dw CODE_039213                                  ;$05 -
                dw CODE_038D7B                                  ;$06 - Display intermediate
                dw CODE_039213                                  ;$07 -
                dw CODE_038E37                                  ;$08 -
                dw CODE_038C6F                                  ;$09 -
                dw CODE_038C7A                                  ;$0A -
                dw CODE_038C7F                                  ;$0B -
                dw CODE_038E65                                  ;$0C -
                dw CODE_038EF1                                  ;$0D -
                dw CODE_038F11                                  ;$0E - Write top score

CODE_038C3E:    LDA $0770               ; $03:8C3E: AD 70 07    ;
                BEQ CODE_038C6C         ; $03:8C41: F0 29       ;
                LDX #$03                ; $03:8C43: A2 03       ;
                STZ $0773               ; $03:8C45: 9C 73 07    ;
                LDA #$01                ; $03:8C48: A9 01       ;
                STA $1200               ; $03:8C4A: 8D 00 12    ;
                JMP CODE_038F0D         ; $03:8C4D: 4C 0D 8F    ;

CODE_038C50:    LDA $0744               ; $03:8C50: AD 44 07    ;\
                PHA                     ; $03:8C53: 48          ; | Save background color and current player status
                LDA $0756               ; $03:8C54: AD 56 07    ; | to stack
                PHA                     ; $03:8C57: 48          ;/
                STZ $0756               ; $03:8C58: 9C 56 07    ;Small powerup
                LDA #$02                ; $03:8C5B: A9 02       ;\
                STA $0744               ; $03:8C5D: 8D 44 07    ;/Set background color
                JSL CODE_049A88         ; $03:8C60: 22 88 9A 04 ;
                PLA                     ; $03:8C64: 68          ;\
                STA $0756               ; $03:8C65: 8D 56 07    ; | Restore background color and current player powerup
                PLA                     ; $03:8C68: 68          ; |
                STA $0744               ; $03:8C69: 8D 44 07    ;/
CODE_038C6C:    JMP CODE_038F0D         ; $03:8C6C: 4C 0D 8F    ;To next screen routine

CODE_038C6F:    LDA $5C                 ; $03:8C6F: A5 5C       ;
                JSL CODE_05C8FB         ; $03:8C71: 22 FB C8 05 ;
                JSL CODE_04956B         ; $03:8C75: 22 6B 95 04 ;
                RTS                     ; $03:8C79: 60          ;

CODE_038C7A:    JSL CODE_049A7D         ; $03:8C7A: 22 7D 9A 04 ;
                RTS                     ; $03:8C7E: 60          ;

CODE_038C7F:    INC $073C               ; $03:8C7F: EE 3C 07    ;
                RTS                     ; $03:8C82: 60          ;

CODE_038C83:    LDA #$00                ; $03:8C83: A9 00       ;
                JSR CODE_0390FC         ; $03:8C85: 20 FC 90    ;
                JMP CODE_038F0D         ; $03:8C88: 4C 0D 8F    ;

CODE_038C8B:    JSR CODE_03BD5E         ; $03:8C8B: 20 5E BD    ;
                REP #$30                ; $03:8C8E: C2 30       ;
                LDX $1700               ; $03:8C90: AE 00 17    ;
                LDA #$7258              ; $03:8C93: A9 58 72    ;
                STA $1702,x             ; $03:8C96: 9D 02 17    ;
                LDA #$0700              ; $03:8C99: A9 00 07    ;
                STA $1704,x             ; $03:8C9C: 9D 04 17    ;
                LDA #$2028              ; $03:8C9F: A9 28 20    ;
                STA $1706,x             ; $03:8CA2: 9D 06 17    ;
                SEP #$20                ; $03:8CA5: E2 20       ;
                LDA $075F               ; $03:8CA7: AD 5F 07    ;
                INC A                   ; $03:8CAA: 1A          ;
                STA $1708,x             ; $03:8CAB: 9D 08 17    ;
                LDA #$20                ; $03:8CAE: A9 20       ;
                STA $1709,x             ; $03:8CB0: 9D 09 17    ;
                STA $170B,x             ; $03:8CB3: 9D 0B 17    ;
                STA $170D,x             ; $03:8CB6: 9D 0D 17    ;
                LDA #$24                ; $03:8CB9: A9 24       ;
                STA $170A,x             ; $03:8CBB: 9D 0A 17    ;
                LDA $075C               ; $03:8CBE: AD 5C 07    ;
                INC A                   ; $03:8CC1: 1A          ;
                STA $170C,x             ; $03:8CC2: 9D 0C 17    ;
                LDA #$FF                ; $03:8CC5: A9 FF       ;
                STA $170E,x             ; $03:8CC7: 9D 0E 17    ;
                LDA $0770               ; $03:8CCA: AD 70 07    ;
                BNE CODE_038CE3         ; $03:8CCD: D0 14       ;
                LDA $701FF2             ; $03:8CCF: AF F2 1F 70 ;
                BNE CODE_038CE3         ; $03:8CD3: D0 0E       ;
                LDA $7FFB06             ; $03:8CD5: AF 06 FB 7F ;
                BMI CODE_038CE3         ; $03:8CD9: 30 08       ;
                LDA $7FFB00             ; $03:8CDB: AF 00 FB 7F ;
                INC A                   ; $03:8CDF: 1A          ;
                STA $1708,x             ; $03:8CE0: 9D 08 17    ;
CODE_038CE3:    REP #$20                ; $03:8CE3: C2 20       ;
                TXA                     ; $03:8CE5: 8A          ;
                CLC                     ; $03:8CE6: 18          ;
                ADC #$000C              ; $03:8CE7: 69 0C 00    ;
                STA $1700               ; $03:8CEA: 8D 00 17    ;
                TAX                     ; $03:8CED: AA          ;
                SEP #$20                ; $03:8CEE: E2 20       ;
                LDA $07FC               ; $03:8CF0: AD FC 07    ;"More difficult quest" flag. Sets 076A too and shows star next to world
                BEQ CODE_038CFA         ; $03:8CF3: F0 05       ;
                LDA #$2A                ; $03:8CF5: A9 2A       ;
                STA $16FA,x             ; $03:8CF7: 9D FA 16    ;
CODE_038CFA:    SEP #$10                ; $03:8CFA: E2 10       ;
                JMP CODE_038F0D         ; $03:8CFC: 4C 0D 8F    ;

CODE_038CFF:    LDA $0759               ; $03:8CFF: AD 59 07    ;
                BEQ CODE_038D75         ; $03:8D02: F0 71       ;
                STZ $0759               ; $03:8D04: 9C 59 07    ;
                LDY #$00                ; $03:8D07: A0 00       ;
                JSR CODE_0385F3         ; $03:8D09: 20 F3 85    ;
                JSL CODE_0491DD         ; $03:8D0C: 22 DD 91 04 ;
                LDA #$01                ; $03:8D10: A9 01       ;
                STA $0ED6               ; $03:8D12: 8D D6 0E    ;
                LDA #$02                ; $03:8D15: A9 02       ;
                JSR CODE_038D9D         ; $03:8D17: 20 9D 8D    ;
                LDA $077A               ; $03:8D1A: AD 7A 07    ;
                BEQ CODE_038D74         ; $03:8D1D: F0 55       ;
                LDA $0761               ; $03:8D1F: AD 61 07    ;
                BMI CODE_038D74         ; $03:8D22: 30 50       ;
                REP #$20                ; $03:8D24: C2 20       ;
                LDA #$7258              ; $03:8D26: A9 58 72    ;
                STA $1702,y             ; $03:8D29: 99 02 17    ;
                LDA #$0700              ; $03:8D2C: A9 00 07    ;
                STA $1704,y             ; $03:8D2F: 99 04 17    ;
                LDA #$2028              ; $03:8D32: A9 28 20    ;
                STA $1706,y             ; $03:8D35: 99 06 17    ;
                SEP #$20                ; $03:8D38: E2 20       ;
                LDA $0766               ; $03:8D3A: AD 66 07    ;
                INC A                   ; $03:8D3D: 1A          ;
                STA $1708,y             ; $03:8D3E: 99 08 17    ;
                LDA #$20                ; $03:8D41: A9 20       ;
                STA $1709,y             ; $03:8D43: 99 09 17    ;
                STA $170B,y             ; $03:8D46: 99 0B 17    ;
                STA $170D,y             ; $03:8D49: 99 0D 17    ;
                LDA #$24                ; $03:8D4C: A9 24       ;
                STA $170A,y             ; $03:8D4E: 99 0A 17    ;
                LDA $0763               ; $03:8D51: AD 63 07    ;
                INC A                   ; $03:8D54: 1A          ;
                STA $170C,y             ; $03:8D55: 99 0C 17    ;
                LDA #$FF                ; $03:8D58: A9 FF       ;
                STA $170E,y             ; $03:8D5A: 99 0E 17    ;
                REP #$20                ; $03:8D5D: C2 20       ;
                TYA                     ; $03:8D5F: 98          ;
                CLC                     ; $03:8D60: 18          ;
                ADC #$000C              ; $03:8D61: 69 0C 00    ;
                STA $1700               ; $03:8D64: 8D 00 17    ;
                TAY                     ; $03:8D67: A8          ;
                SEP #$20                ; $03:8D68: E2 20       ;
                LDA $0781               ; $03:8D6A: AD 81 07    ;
                BEQ CODE_038D74         ; $03:8D6D: F0 05       ;
                LDA #$2A                ; $03:8D6F: A9 2A       ;
                STA $16FA,y             ; $03:8D71: 99 FA 16    ;
CODE_038D74:    RTS                     ; $03:8D74: 60          ;

CODE_038D75:    INC $073C               ; $03:8D75: EE 3C 07    ;
                JMP CODE_038F0D         ; $03:8D78: 4C 0D 8F    ;

CODE_038D7B:    LDA $0770               ; $03:8D7B: AD 70 07    ;\
                BEQ CODE_038DC9         ; $03:8D7E: F0 49       ;/Skip if game operating mode is title screen
                CMP #$03                ; $03:8D80: C9 03       ;\
                BEQ CODE_038DCF         ; $03:8D82: F0 4B       ;/If game over, display game over instead.
                LDA $0752               ; $03:8D84: AD 52 07    ;\
                BNE CODE_038DC9         ; $03:8D87: D0 40       ;/Branch if an exit is taken
                LDY $5C                 ; $03:8D89: A4 5C       ;\
                CPY #$03                ; $03:8D8B: C0 03       ; | Check for castle level
                BEQ CODE_038D94         ; $03:8D8D: F0 05       ;/ If castle, branch
                LDA $0769               ; $03:8D8F: AD 69 07    ;\
                BNE CODE_038DC9         ; $03:8D92: D0 35       ;/ Go to next screen task if level preview skip flag is set
CODE_038D94:    JSR CODE_03F861         ; $03:8D94: 20 61 F8    ;
                JSL CODE_0492E7         ; $03:8D97: 22 E7 92 04 ;
                LDA #$01                ; $03:8D9B: A9 01       ;
CODE_038D9D:    JSR CODE_0390FC         ; $03:8D9D: 20 FC 90    ;
                JSR CODE_039224         ; $03:8DA0: 20 24 92    ;
                STZ $1204               ; $03:8DA3: 9C 04 12    ;
                STZ $1205               ; $03:8DA6: 9C 05 12    ;
                STZ $1206               ; $03:8DA9: 9C 06 12    ;
                STZ $1209               ; $03:8DAC: 9C 09 12    ;
                LDA #$20                ; $03:8DAF: A9 20       ;
                STA $120A               ; $03:8DB1: 8D 0A 12    ;
                STZ $1203               ; $03:8DB4: 9C 03 12    ;
                LDA #$02                ; $03:8DB7: A9 02       ;
                STA $0E7F               ; $03:8DB9: 8D 7F 0E    ;
                STZ $0E4F               ; $03:8DBC: 9C 4F 0E    ;
                STZ $1201               ; $03:8DBF: 9C 01 12    ;
                STZ $0E7E               ; $03:8DC2: 9C 7E 0E    ;No screen pixelation/mosaic
                STZ $0774               ; $03:8DC5: 9C 74 07    ;
                RTS                     ; $03:8DC8: 60          ;

CODE_038DC9:    LDA #$08                ; $03:8DC9: A9 08       ;
                STA $073C               ; $03:8DCB: 8D 3C 07    ;
                RTS                     ; $03:8DCE: 60          ;

CODE_038DCF:    STZ $1204               ; $03:8DCF: 9C 04 12    ;
                STZ $1205               ; $03:8DD2: 9C 05 12    ;
                STZ $1206               ; $03:8DD5: 9C 06 12    ;
                STZ $1209               ; $03:8DD8: 9C 09 12    ;
                LDA #$20                ; $03:8DDB: A9 20       ;
                STA $120A               ; $03:8DDD: 8D 0A 12    ;
                STZ $1203               ; $03:8DE0: 9C 03 12    ;
                LDA $0774               ; $03:8DE3: AD 74 07    ;
                BEQ CODE_038DFA         ; $03:8DE6: F0 12       ;
                STZ $0E4F               ; $03:8DE8: 9C 4F 0E    ;
                STZ $0774               ; $03:8DEB: 9C 74 07    ;
                STZ $1201               ; $03:8DEE: 9C 01 12    ;
                LDA #$02                ; $03:8DF1: A9 02       ;
                STA $0E7F               ; $03:8DF3: 8D 7F 0E    ;
                JSL CODE_0491DD         ; $03:8DF6: 22 DD 91 04 ;
CODE_038DFA:    LDA #$09                ; $03:8DFA: A9 09       ;
                STA $07B0               ; $03:8DFC: 8D B0 07    ;
                LDA #$03                ; $03:8DFF: A9 03       ;
                JSR CODE_0390FC         ; $03:8E01: 20 FC 90    ;
                LDA $077A               ; $03:8E04: AD 7A 07    ;
                BEQ CODE_038E0E         ; $03:8E07: F0 05       ;
                LDA $0761               ; $03:8E09: AD 61 07    ;
                BPL CODE_038E2D         ; $03:8E0C: 10 1F       ;
CODE_038E0E:    PHX                     ; $03:8E0E: DA          ;
                PHY                     ; $03:8E0F: 5A          ;
                REP #$10                ; $03:8E10: C2 10       ;
                LDX #$0000              ; $03:8E12: A2 00 00    ;
                STZ $E5                 ; $03:8E15: 64 E5       ;
                LDY $E4                 ; $03:8E17: A4 E4       ;
CODE_038E19:    LDA DATA_039030,x       ; $03:8E19: BD 30 90    ;
                STA $1702,y             ; $03:8E1C: 99 02 17    ;
                INX                     ; $03:8E1F: E8          ;
                INY                     ; $03:8E20: C8          ;
                INC A                   ; $03:8E21: 1A          ;
                BNE CODE_038E19         ; $03:8E22: D0 F5       ;
                STY $1700               ; $03:8E24: 8C 00 17    ;
                SEP #$10                ; $03:8E27: E2 10       ;
                PLY                     ; $03:8E29: 7A          ;
                PLX                     ; $03:8E2A: FA          ;
                BRA CODE_038E31         ; $03:8E2B: 80 04       ;

CODE_038E2D:    JSL CODE_0486DF         ; $03:8E2D: 22 DF 86 04 ;
CODE_038E31:    STZ $0EC3               ; $03:8E31: 9C C3 0E    ;
                JMP CODE_038F16         ; $03:8E34: 4C 16 8F    ;

CODE_038E37:    LDA $0774               ; $03:8E37: AD 74 07    ;
                BEQ CODE_038E42         ; $03:8E3A: F0 06       ;
                CMP #$01                ; $03:8E3C: C9 01       ;
                BEQ CODE_038E4F         ; $03:8E3E: F0 0F       ;
                BRA CODE_038E4C         ; $03:8E40: 80 0A       ;

CODE_038E42:    LDA #$01                ; $03:8E42: A9 01       ;
                STA $0E7F               ; $03:8E44: 8D 7F 0E    ;
                STZ $0E4F               ; $03:8E47: 9C 4F 0E    ;
                BRA CODE_038E64         ; $03:8E4A: 80 18       ;

CODE_038E4C:    INC $0774               ; $03:8E4C: EE 74 07    ;
CODE_038E4F:    JSR CODE_03A295         ; $03:8E4F: 20 95 A2    ;
                LDA $071F               ; $03:8E52: AD 1F 07    ;
                BNE CODE_038E4F         ; $03:8E55: D0 F8       ;
                DEC $071E               ; $03:8E57: CE 1E 07    ;
                BPL CODE_038E5F         ; $03:8E5A: 10 03       ;
                INC $073C               ; $03:8E5C: EE 3C 07    ;
CODE_038E5F:    LDA #$06                ; $03:8E5F: A9 06       ;
                STA $0773               ; $03:8E61: 8D 73 07    ;
CODE_038E64:    RTS                     ; $03:8E64: 60          ;

CODE_038E65:    LDA $0770               ; $03:8E65: AD 70 07    ;
                BEQ CODE_038E6D         ; $03:8E68: F0 03       ;
                JMP CODE_038F16         ; $03:8E6A: 4C 16 8F    ;

CODE_038E6D:    PHB                     ; $03:8E6D: 8B          ;
                LDA.b #DATA_05D850>>16  ; $03:8E6E: A9 05       ;
                PHA                     ; $03:8E70: 48          ;
                PLB                     ; $03:8E71: AB          ;
                LDA #$01                ; $03:8E72: A9 01       ;
                STA $0EC8               ; $03:8E74: 8D C8 0E    ;
                REP #$30                ; $03:8E77: C2 30       ;
                LDX $1700               ; $03:8E79: AE 00 17    ;
                LDY #$0000              ; $03:8E7C: A0 00 00    ;
CODE_038E7F:    LDA.w DATA_05D850,y     ; $03:8E7F: B9 50 D8    ;
                STA $1702,x             ; $03:8E82: 9D 02 17    ;
                INC A                   ; $03:8E85: 1A          ;
                BEQ CODE_038E8E         ; $03:8E86: F0 06       ;
                INX                     ; $03:8E88: E8          ;
                INX                     ; $03:8E89: E8          ;
                INY                     ; $03:8E8A: C8          ;
                INY                     ; $03:8E8B: C8          ;
                BRA CODE_038E7F         ; $03:8E8C: 80 F1       ;

CODE_038E8E:    STX $1700               ; $03:8E8E: 8E 00 17    ;
                SEP #$30                ; $03:8E91: E2 30       ;
                PLB                     ; $03:8E93: AB          ;
                STZ $0E20               ; $03:8E94: 9C 20 0E    ;
                LDA #$80                ; $03:8E97: A9 80       ;
                STA $1602               ; $03:8E99: 8D 02 16    ;
                STA $0ED6               ; $03:8E9C: 8D D6 0E    ;
                LDA #$05                ; $03:8E9F: A9 05       ;
                STA $0773               ; $03:8EA1: 8D 73 07    ;
                LDA $7FFB06             ; $03:8EA4: AF 06 FB 7F ;
                BMI CODE_038EAD         ; $03:8EA8: 30 03       ;
                JSR CODE_038EB0         ; $03:8EAA: 20 B0 8E    ;
CODE_038EAD:    JMP CODE_038F0D         ; $03:8EAD: 4C 0D 8F    ;

CODE_038EB0:    PHX                     ; $03:8EB0: DA          ;
                PHY                     ; $03:8EB1: 5A          ;
                REP #$30                ; $03:8EB2: C2 30       ;
                LDA $7FFB06             ; $03:8EB4: AF 06 FB 7F ;
                AND #$0001              ; $03:8EB8: 29 01 00    ;
                ASL A                   ; $03:8EBB: 0A          ;
                TAY                     ; $03:8EBC: A8          ;
                LDX $1700               ; $03:8EBD: AE 00 17    ;
                LDA #$024A              ; $03:8EC0: A9 4A 02    ;
                CLC                     ; $03:8EC3: 18          ;
                ADC DATA_038EED,y       ; $03:8EC4: 79 ED 8E    ;
                XBA                     ; $03:8EC7: EB          ;
                STA $1702,x             ; $03:8EC8: 9D 02 17    ;
                LDA #$4018              ; $03:8ECB: A9 18 40    ;
                XBA                     ; $03:8ECE: EB          ;
                STA $1704,x             ; $03:8ECF: 9D 04 17    ;
                LDA #$0024              ; $03:8ED2: A9 24 00    ;
                STA $1706,x             ; $03:8ED5: 9D 06 17    ;
                LDA #$FFFF              ; $03:8ED8: A9 FF FF    ;
                STA $1708,x             ; $03:8EDB: 9D 08 17    ;
                LDA $1700               ; $03:8EDE: AD 00 17    ;
                CLC                     ; $03:8EE1: 18          ;
                ADC #$0006              ; $03:8EE2: 69 06 00    ;
                STA $1700               ; $03:8EE5: 8D 00 17    ;
                SEP #$30                ; $03:8EE8: E2 30       ;
                PLY                     ; $03:8EEA: 7A          ;
                PLX                     ; $03:8EEB: FA          ;
                RTS                     ; $03:8EEC: 60          ;

DATA_038EED:    dw $0040,$0000                                  ;

CODE_038EF1:    LDA $0770               ; $03:8EF1: AD 70 07    ;
                BNE CODE_038F16         ; $03:8EF4: D0 20       ;
                LDX #$00                ; $03:8EF6: A2 00       ;
CODE_038EF8:    STA $0300,x             ; $03:8EF8: 9D 00 03    ;
                STA $0400,x             ; $03:8EFB: 9D 00 04    ;
                DEX                     ; $03:8EFE: CA          ;
                BNE CODE_038EF8         ; $03:8EFF: D0 F7       ;
                LDA $7FFB06             ; $03:8F01: AF 06 FB 7F ;
                BMI CODE_038F0A         ; $03:8F05: 30 03       ;
                STA $077A               ; $03:8F07: 8D 7A 07    ;
CODE_038F0A:    JSR CODE_038861         ; $03:8F0A: 20 61 88    ;
CODE_038F0D:    INC $073C               ; $03:8F0D: EE 3C 07    ;
                RTS                     ; $03:8F10: 60          ;

;Write Top Score screen routine task
CODE_038F11:    LDA #$FA                ; $03:8F11: A9 FA       ;
                JSR CODE_03BD64         ; $03:8F13: 20 64 BD    ;
CODE_038F16:    INC $0772               ; $03:8F16: EE 72 07    ; Move to next screen routine task
                RTS                     ; $03:8F19: 60          ;

DATA_038F1A:    db $58,$43,$00,$09,$16,$20,$0A,$20              ;
                db $1B,$20,$12,$20,$18,$20,$58,$52              ;
                db $00,$15,$20,$20,$18,$20,$1B,$20              ;
                db $15,$20,$0D,$20,$28,$20,$28,$20              ;
                db $1D,$20,$12,$20,$16,$20,$0E,$20              ;
                db $58,$68,$00,$09,$00,$20,$28,$20              ;
                db $28,$20,$27,$24,$25,$20,$FF,$59              ;
                db $6D,$00,$0F,$28,$20,$28,$20,$28              ;
                db $20,$25,$20,$28,$20,$28,$20,$28              ;
                db $20,$28,$20,$59,$E0,$40,$FE,$28              ;
                db $00,$59,$0B,$00,$13,$20,$20,$18              ;
                db $20,$1B,$20,$15,$20,$0D,$20,$28              ;
                db $20,$28,$20,$28,$20,$24,$20,$28              ;
                db $20,$58,$AC,$40,$0D,$28,$20,$FF              ;
                db $09,$6D,$00,$09,$E0,$19,$E1,$19              ;
                db $E2,$19,$E3,$19,$E4,$19,$09,$8D              ;
                db $00,$09,$F0,$19,$F1,$19,$F2,$19              ;
                db $F3,$19,$F4,$19,$09,$AC,$00,$0D              ;
                db $CA,$19,$CB,$19,$CC,$19,$CD,$19              ;
                db $24,$00,$CE,$19,$CF,$19,$09,$CC              ;
                db $00,$0D,$DA,$19,$DB,$19,$DC,$19              ;
                db $DD,$19,$24,$00,$DE,$19,$DF,$19              ;
                db $FF,$08,$CD,$00,$09,$E0,$19,$E1              ;
                db $19,$E2,$19,$E3,$19,$E4,$19,$08              ;
                db $ED,$00,$09,$F0,$19,$F1,$19,$F2              ;
                db $19,$F3,$19,$F4,$19,$09,$2B,$00              ;
                db $13,$C0,$19,$C1,$19,$C2,$19,$C3              ;
                db $19,$C4,$19,$C5,$19,$C6,$19,$C7              ;
                db $19,$C8,$19,$C9,$19,$09,$4B,$00              ;
                db $13,$D0,$19,$D1,$19,$D2,$19,$D3              ;
                db $19,$D4,$19,$D5,$19,$D6,$19,$D7              ;
                db $19,$D8,$19,$D9,$19,$09,$6D,$40              ;
                db $08,$24,$00,$09,$8D,$40,$08,$24              ;
                db $00,$09,$AC,$40,$0C,$24,$00,$09              ;
                db $CC,$40,$0C,$24,$00,$FF                      ;

DATA_039030:    db $09,$AB,$00,$0F,$A1,$02,$A2,$02              ;
                db $A3,$02,$A4,$02,$A5,$02,$A6,$02              ;
                db $A7,$02,$A8,$02,$09,$EB,$00,$19              ;
                db $AE,$02,$AF,$02,$B0,$02,$B1,$02              ;
                db $AD,$02,$A1,$02,$A2,$02,$A3,$02              ;
                db $A4,$02,$A5,$02,$A6,$02,$A7,$02              ;
                db $A8,$02,$0A,$2B,$00,$11,$AE,$02              ;
                db $AF,$02,$B0,$02,$B1,$02,$AD,$02              ;
                db $A9,$02,$AA,$02,$AB,$02,$AC,$02              ;
                db $FF,$05,$84,$00,$29,$20,$08,$0E              ;
                db $08,$15,$08,$0C,$08,$18,$08,$16              ;
                db $08,$0E,$08,$24,$00,$1D,$08,$18              ;
                db $08,$24,$00,$20,$08,$0A,$08,$1B              ;
                db $08,$19,$08,$24,$00,$23,$08,$18              ;
                db $08,$17,$08,$0E,$08,$2B,$08,$05              ;
                db $E5,$00,$01,$24,$08,$05,$ED,$00              ;
                db $01,$24,$08,$05,$F5,$00,$01,$24              ;
                db $08,$FF                                      ;

DATA_0390BA:    db $E5,$19,$E6,$19,$E7,$19,$E8,$19              ;
                db $E9,$19                                      ;

DATA_0390C4:    db $F5,$19,$F6,$19,$F7,$19,$F8,$19              ;
                db $F9,$19                                      ;

DATA_0390CE:    db $15,$20,$1E,$20,$12,$20,$10,$20              ;
                db $12,$20                                      ;

DATA_0390D8:    db $04,$03,$02,$00,$24,$05,$24,$00              ;
                db $08,$07,$06,$00                              ;

DATA_0390E4:    dw $0000,$0000,$0037,$0037                      ;
                dw $0070,$008C,$00B1,$00CD                      ;
                dw $015F,$015F,$0116,$0116                      ;

CODE_0390FC:    PHA                     ; $03:90FC: 48          ;
                ASL A                   ; $03:90FD: 0A          ;
                TAY                     ; $03:90FE: A8          ;
                CPY #$04                ; $03:90FF: C0 04       ;
                BCC CODE_03910F         ; $03:9101: 90 0C       ;
                CPY #$08                ; $03:9103: C0 08       ;
                BCC CODE_039109         ; $03:9105: 90 02       ;
                LDY #$08                ; $03:9107: A0 08       ;
CODE_039109:    LDA $077A               ; $03:9109: AD 7A 07    ;
                BNE CODE_03910F         ; $03:910C: D0 01       ;
                INY                     ; $03:910E: C8          ;
CODE_03910F:    STY $F3                 ; $03:910F: 84 F3       ;
                TYA                     ; $03:9111: 98          ;
                ASL A                   ; $03:9112: 0A          ;
                AND #$FF                ; $03:9113: 29 FF       ;
                REP #$30                ; $03:9115: C2 30       ;
                AND #$00FF              ; $03:9117: 29 FF 00    ;
                TAY                     ; $03:911A: A8          ;
                LDX DATA_0390E4,y       ; $03:911B: BE E4 90    ;
                LDY $1700               ; $03:911E: AC 00 17    ;
                SEP #$20                ; $03:9121: E2 20       ;
CODE_039123:    LDA DATA_038F1A,x       ; $03:9123: BD 1A 8F    ;
                CMP #$FF                ; $03:9126: C9 FF       ;
                BEQ CODE_039131         ; $03:9128: F0 07       ;
                STA $1702,y             ; $03:912A: 99 02 17    ;
                INX                     ; $03:912D: E8          ;
                INY                     ; $03:912E: C8          ;
                BRA CODE_039123         ; $03:912F: 80 F2       ;

CODE_039131:    LDA #$FF                ; $03:9131: A9 FF       ;
                STA $1702,y             ; $03:9133: 99 02 17    ;
                STY $E4                 ; $03:9136: 84 E4       ;
                SEP #$10                ; $03:9138: E2 10       ;
                PLA                     ; $03:913A: 68          ;
                TAX                     ; $03:913B: AA          ;
                CMP #$04                ; $03:913C: C9 04       ;
                BCC CODE_039143         ; $03:913E: 90 03       ;
                JMP CODE_0391DA         ; $03:9140: 4C DA 91    ;

CODE_039143:    DEX                     ; $03:9143: CA          ;
                BNE CODE_0391A2         ; $03:9144: D0 5C       ;
                JSL CODE_048895         ; $03:9146: 22 95 88 04 ;
                PHX                     ; $03:914A: DA          ;
                LDX $1700               ; $03:914B: AE 00 17    ;
                LDA $075A               ; $03:914E: AD 5A 07    ;
                INC A                   ; $03:9151: 1A          ;
                CMP #$0A                ; $03:9152: C9 0A       ;
                BCC CODE_039183         ; $03:9154: 90 2D       ;
                STZ $E4                 ; $03:9156: 64 E4       ;
                STZ $E5                 ; $03:9158: 64 E5       ;
CODE_03915A:    SEC                     ; $03:915A: 38          ;
                SBC #$64                ; $03:915B: E9 64       ;
                BCC CODE_039163         ; $03:915D: 90 04       ;
                INC $E4                 ; $03:915F: E6 E4       ;
                BRA CODE_03915A         ; $03:9161: 80 F7       ;

CODE_039163:    CLC                     ; $03:9163: 18          ;
                ADC #$64                ; $03:9164: 69 64       ;
CODE_039166:    SEC                     ; $03:9166: 38          ;
                SBC #$0A                ; $03:9167: E9 0A       ;
                BCC CODE_03916F         ; $03:9169: 90 04       ;
                INC $E5                 ; $03:916B: E6 E5       ;
                BRA CODE_039166         ; $03:916D: 80 F7       ;

CODE_03916F:    CLC                     ; $03:916F: 18          ;
                ADC #$0A                ; $03:9170: 69 0A       ;
                STA $E6                 ; $03:9172: 85 E6       ;
                LDY $E4                 ; $03:9174: A4 E4       ;
                BEQ CODE_03917C         ; $03:9176: F0 04       ;
                TYA                     ; $03:9178: 98          ;
                STA $170E,x             ; $03:9179: 9D 0E 17    ;
CODE_03917C:    LDA $E5                 ; $03:917C: A5 E5       ;
                STA $1710,x             ; $03:917E: 9D 10 17    ;
                LDA $E6                 ; $03:9181: A5 E6       ;
CODE_039183:    STA $1712,x             ; $03:9183: 9D 12 17    ;
                LDY $075F               ; $03:9186: AC 5F 07    ;
                INY                     ; $03:9189: C8          ;
                TYA                     ; $03:918A: 98          ;
                STA $172E,x             ; $03:918B: 9D 2E 17    ;
                LDY $075C               ; $03:918E: AC 5C 07    ;
                INY                     ; $03:9191: C8          ;
                TYA                     ; $03:9192: 98          ;
                STA $1732,x             ; $03:9193: 9D 32 17    ;
                LDA $07FC               ; $03:9196: AD FC 07    ;"More difficult quest" flag. Sets 076A too and shows star next to world
                BEQ CODE_0391A0         ; $03:9199: F0 05       ;
                LDA #$2A                ; $03:919B: A9 2A       ;
                STA $172C,x             ; $03:919D: 9D 2C 17    ;
CODE_0391A0:    PLX                     ; $03:91A0: FA          ;
                RTS                     ; $03:91A1: 60          ;

CODE_0391A2:    LDA $077A               ; $03:91A2: AD 7A 07    ;
                BEQ CODE_0391D9         ; $03:91A5: F0 32       ;
                LDA $0EC3               ; $03:91A7: AD C3 0E    ;
                BEQ CODE_0391D9         ; $03:91AA: F0 2D       ;
                PHY                     ; $03:91AC: 5A          ;
                LDA $1700               ; $03:91AD: AD 00 17    ;
                CLC                     ; $03:91B0: 18          ;
                ADC #$09                ; $03:91B1: 69 09       ;
                TAY                     ; $03:91B3: A8          ;
                LDA $F3                 ; $03:91B4: A5 F3       ;
                CMP #$04                ; $03:91B6: C9 04       ;
                BEQ CODE_0391BE         ; $03:91B8: F0 04       ;
                CMP #$06                ; $03:91BA: C9 06       ;
                BNE CODE_0391CF         ; $03:91BC: D0 11       ;
CODE_0391BE:    LDA DATA_0390BA,y       ; $03:91BE: B9 BA 90    ;
                STA $1706,y             ; $03:91C1: 99 06 17    ;
                LDA DATA_0390C4,y       ; $03:91C4: B9 C4 90    ;
                STA $1714,y             ; $03:91C7: 99 14 17    ;
                DEY                     ; $03:91CA: 88          ;
                BPL CODE_0391BE         ; $03:91CB: 10 F1       ;
                BRA CODE_0391D8         ; $03:91CD: 80 09       ;

CODE_0391CF:    LDA DATA_0390CE,y       ; $03:91CF: B9 CE 90    ;
                STA $1706,y             ; $03:91D2: 99 06 17    ;
                DEY                     ; $03:91D5: 88          ;
                BPL CODE_0391CF         ; $03:91D6: 10 F7       ;
CODE_0391D8:    PLY                     ; $03:91D8: 7A          ;
CODE_0391D9:    RTS                     ; $03:91D9: 60          ;

CODE_0391DA:    SBC #$04                ; $03:91DA: E9 04       ;
                ASL A                   ; $03:91DC: 0A          ;
                ASL A                   ; $03:91DD: 0A          ;
                TAX                     ; $03:91DE: AA          ;
                REP #$30                ; $03:91DF: C2 30       ;
                LDA $1700               ; $03:91E1: AD 00 17    ;
                CLC                     ; $03:91E4: 18          ;
                ADC #$0000              ; $03:91E5: 69 00 00    ;
                TAY                     ; $03:91E8: A8          ;
                SEP #$30                ; $03:91E9: E2 30       ;
                LDA #$12                ; $03:91EB: A9 12       ;
                CLC                     ; $03:91ED: 18          ;
                ADC $1700               ; $03:91EE: 6D 00 17    ;
                STA $E6                 ; $03:91F1: 85 E6       ;
CODE_0391F3:    LDA DATA_0390D8,x       ; $03:91F3: BD D8 90    ;
                STA $1734,y             ; $03:91F6: 99 34 17    ;
                INX                     ; $03:91F9: E8          ;
                INY                     ; $03:91FA: C8          ;
                INY                     ; $03:91FB: C8          ;
                INY                     ; $03:91FC: C8          ;
                INY                     ; $03:91FD: C8          ;
                INY                     ; $03:91FE: C8          ;
                INY                     ; $03:91FF: C8          ;
                CPY $E6                 ; $03:9200: C4 E6       ;
                BCC CODE_0391F3         ; $03:9202: 90 EF       ;
                REP #$20                ; $03:9204: C2 20       ;
                LDA #$0040              ; $03:9206: A9 40 00    ;
                CLC                     ; $03:9209: 18          ;
                ADC $1700               ; $03:920A: 6D 00 17    ;
                STA $1700               ; $03:920D: 8D 00 17    ;
                SEP #$20                ; $03:9210: E2 20       ;
                RTS                     ; $03:9212: 60          ;

CODE_039213:    LDA $07B0               ; $03:9213: AD B0 07    ;
                BNE CODE_03922C         ; $03:9216: D0 14       ;
                LDA $0770               ; $03:9218: AD 70 07    ;
                CMP #$03                ; $03:921B: C9 03       ;
                BEQ CODE_039224         ; $03:921D: F0 05       ;
                LDA #$01                ; $03:921F: A9 01       ;
                STA $0E7F               ; $03:9221: 8D 7F 0E    ;
CODE_039224:    LDA #$07                ; $03:9224: A9 07       ;
                STA $07B0               ; $03:9226: 8D B0 07    ;
                INC $073C               ; $03:9229: EE 3C 07    ;
CODE_03922C:    RTS                     ; $03:922C: 60          ;
