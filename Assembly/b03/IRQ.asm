;SMB1 IRQ ROUTINE
CODE_03850D:        PHB                     ; $03:850D: 8B          ;\SMB1 IRQ Routine
                    PHK                     ; $03:850E: 4B          ; |Set current program bank
                    PLB                     ; $03:850F: AB          ;/
                    LDA.w $4211             ; $03:8510: AD 11 42    ;\If IRQ isn't fired yet, return
                    BPL   .end              ; $03:8513: 10 2E       ;/
                    LDA.w $0EDE             ; $03:8515: AD DE 0E    ;\If this bit is set, return
                    BEQ   .end              ; $03:8518: F0 29       ;/(Seems like it is used as "IRQ enable flag")
                    LDA.w $0ED1             ; $03:851A: AD D1 0E    ;\"Starry night" IRQ mode
                    BEQ   .normal           ; $03:851D: F0 13       ;/If it is clear, go to normal IRQ mode
-                   BIT.w $4212             ; $03:851F: 2C 12 42    ;\
                    BVC   -                 ; $03:8522: 50 FB       ;/Wait till H-blank
                    LDA.w $0EFD             ; $03:8524: AD FD 0E    ;\ Used with Starry BG IRQ mode
                    STA.w $210F             ; $03:8527: 8D 0F 21    ; |Set BG2 Horizontal scroll
                    LDA.w $0EFE             ; $03:852A: AD FE 0E    ; |
                    STA.w $210F             ; $03:852D: 8D 0F 21    ;/
                    BRA   .end              ; $03:8530: 80 11       ;Return

.normal             BIT.w $4212             ; $03:8532: 2C 12 42    ;\
                    BVC   .normal           ; $03:8535: 50 FB       ;/Wait till H-blank
                    LDA.w $0EEE             ; $03:8537: AD EE 0E    ;\
                    STA.w $2111             ; $03:853A: 8D 11 21    ; |Set BG3 horizontal scroll
                    LDA.w $0EEF             ; $03:853D: AD EF 0E    ; |
                    STA.w $2111             ; $03:8540: 8D 11 21    ;/
.end                PLB                     ; $03:8543: AB          ;\Recover program bank & return
                    RTL                     ; $03:8544: 6B          ;/