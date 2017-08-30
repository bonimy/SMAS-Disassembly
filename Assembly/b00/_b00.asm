; Super Mario All-Stars   (U) disassembly                        ;
; Disassembled by Roy and Ersanio and imamelia and wiiqwertyuiop ;
;                                                                ;
; Commenting and organization by SWR                             ;
;                                                                ;
; Data in bank 0 goes here.                                      ;

incsrc RESET.asm                          ;
incsrc StartGame.asm
incsrc NMI.asm
incsrc IRQ.asm
incsrc Registers.asm                      ;*
incsrc SPC-700.asm
incsrc Battery.asm                        ;*
incsrc LoadSaveData.asm                   ;*
incsrc ErrorCart.asm
incsrc ErrorPirate.asm

DATA_0096FF:        incbin DATA_0096FF.bin
DATA_009780:        incbin DATA_009780.bin

ORG $009B80
incsrc HallScreen.asm
incsrc GameSelect.asm
incsrc EraseSaveData.asm
incsrc HallScreenAnimate.asm

ORG $00C000
incsrc Other.asm

ORG $00FFC0
INTERNALHEADER:
                    db "SUPER MARIO ALL_STARS"         ;ROM NAME
                    db $20                             ;MAP MODE. Mode 20 = 2.68 MHz (= Normal Speed)
                    db $02                             ;CARTRIDGE TYPE: ROM + RAM + SRAM
                    db $0B                             ;ROM SIZE: 9-16 MBIT
                    db $03                             ;RAM SIZE: 64k RAM
                    db $01                             ;DEST. CODE: North America. This ROM comes from America?
                    db $01                             ;FIXED VALUE. It was supposed to be 33?
                    db $00                             ;MASK ROM VERSION. This ROM is not revised.
                    dw $55A3                           ;COMPLEMENT CHECK
                    dw $AA5C                           ;CHECKSUM

NATIVEVECTORS:
                    dw $FFFF                           ;Unused vector
                    dw $FFFF                           ;Unused vector
                    dw N_VECTOR_COP                    ;COP
                    dw $FFFF                           ;BRK
                    dw N_VECTOR_ABORT                  ;ABORT
                    dw N_VECTOR_NMI                    ;NMI
                    dw N_VECTOR_RESET                  ;RESET
                    dw N_VECTOR_IRQ                    ;IRQ

EMULATIONVECTORS:
                    dw $FFFF                           ;Unused vector
                    dw $FFFF                           ;Unused vector
                    dw E_VECTOR_COP                    ;COP
                    dw E_VECTOR_BRK                    ;BRK
                    dw E_VECTOR_ABORT                  ;ABORT
                    dw E_VECTOR_NMI                    ;NMI
                    dw E_VECTOR_RESET                  ;RESET
                    dw E_VECTOR_IRQ                    ;IRQ
