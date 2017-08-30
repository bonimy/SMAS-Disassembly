; Super Mario All-Stars   (U) disassembly                        ;
; Disassembled by Roy and Ersanio and imamelia and wiiqwertyuiop ;
;                                                                ;
; Commenting and organization by SWR                             ;
;                                                                ;
; Code for Game Select sequence goes here.                       ;

;-------Fade out screen, prepare for gameplay
CODE_00A2C5:        DEC.w $0100               ;\Wait for screen to fade out
                    BNE   +                   ;/
                    INC.b $E0                 ;Set next program mode
                    STZ.b $E1                 ;Clear program submode value
                    STZ.b $E3                 ;Clear program submode timer
                    LDA.b #$80                ;\Force blank
                    STA.w $0100               ;/
+                   SEP   #$20                ;8-bit A
                    RTL                       ;

;-------Initialize Game Select screen
CODE_00A2D8:        LDA.l $70000E             ;\Load file index for game in Game Select screen
                    STA.b $D1                 ;/
                    LDA.l $70000F             ;\Load game index in Game Select screen
                    STA.b $D0                 ;/
                    STA.w $0218               ;Horizontal offset index for file menu in Game Select screen
                    LDX.b #$01                ;\Initialize DMA registers and data for Game Select
                    JSL.l CODE_00849C         ;/
                    JSR.w CODE_008ABC         ;[?]Load SPC-700 data for Game Select screen
                    LDA.b #$0F                ;\Set maximum screen brightness
                    STA.w $0100               ;/
                    INC.w $0AC0               ;Set "Update palette" flag
                    INC.b $E0                 ;Go to next game mode
                    STZ.b $E1                 ;Clear submode index
                    LDA.b #$44                ;\Initialize next submode timer to #$44
                    STA.b $E3                 ;/
                    STZ.b $FD                 ;Reset frame counter
                    JSR.w CODE_00A30D         ;[?]Initialize File Select tileset
                    LDA.b #$41                ;\Play SFX (Screen in)
                    STA.w $63                 ;/
                    JMP.w CODE_00A39B         ;

;-------[?]Initialize File Select tileset
CODE_00A30D:        REP   #$10                ;16-bit XY
                    LDY.w #$0000              ;Initialize Y index
-                   LDA.b #$00                ;\Clear high byte of A
                    XBA                       ;/
                    PHY                       ;Push Y index
                    TYA                       ;\
                    ASL   A                   ; |Set Y to index words
                    TAY                       ;/
                    LDX.w DATA_00A80C,y       ;Set start index?
                    PLY                       ;Recover Y index
                    LDA.l $700010,x           ;\Load "File Select" save data. Branch if value is nonnegative
                    BMI   +                   ;/(normally it is $FFFF)
                    INC   A                   ;Increment A (values were originally zero-based)
+                   STA.w $80,y               ;
                    STA.w $B0,y               ;
                    LDA.l $700010+1,x         ;
                    BMI   +                   ;
                    INC   A                   ;
+                   STA.b $00                 ;
                    TYA                       ;
                    AND.b #$01                ;
                    BEQ   +                   ;
                    TYA                       ;
                    AND.b #$02                ;
                    BNE   +                   ;
                    LDA.b $00                 ;
                    BRA   ++                  ;

+                   LDA.b #$FF                ;
++                  STA.w $90,y               ;
                    STA.w $C0,y               ;
                    LDA.l $700014,x           ;
                    STA.w $A0,y               ;
                    LDA.l $700015,x           ;
                    STA.w $70,y               ;
                    PHX                       ;
                    TYX                       ;
                    STA.l $700490,x           ;
                    PLX                       ;
                    INY                       ;Increment Y index
                    CPY.w #$0010              ;\Repeat 16 (0x10) times
                    BCC   -                   ;/
                    SEP   #$10                ;8-bit XY
                    RTS                       ;

DATA_00A367:        dw $6127,$612D,$6133,$6139
                    dw $6187,$618D,$6193,$6199
                    dw $61E7,$61ED,$61F3,$61F9
                    dw $6247,$624D,$6253,$6259

DATA_00A387:        db $1F,$21,$22,$22,$64,$F0,$64,$F1
                    db $64,$F4,$64,$F5,$64,$F2,$64,$F3
                    db $64,$F6,$64,$F7

CODE_00A39B:        LDA.b $E1                 ;\Execute code depending on submode value
                    BNE   CODE_00A3F5         ;/
                    LDA.b $FD                 ;\
                    LSR   A                   ; |[?]Wait for frame counter to be an even number
                    BCS   .end0               ;/
                    REP   #$20                ;16-bit A
                    LDX.b $E3                 ;\
                    LDA.l DATA_009FAB,x       ; |Get triangle fading GFX offset for this frame
                    STA.b $E5                 ;/
                    DEX                       ;\
                    DEX                       ; |Prepare offset index for next frame
                    STX.b $E3                 ;/
                    BPL   .end0               ;End code if $E3 >= 0
                    LDA.w #$0002              ;\Play SFX (Screen in)
                    STA.w $62                 ;/
                    INC.b $E1                 ;Go to next game submode
                    LDX.b #$01                ;\Set "File Select mode" flag
                    STX.w $0219               ;/
                    LDA.w #$0000              ;\Set BG2/BG3 tilemap address to VRAM $0000
                    STA.w $0105               ;/(These BGs are unused)
                    STZ.w $0107               ;Set BG1 GFX address to VRAM $0000; no BG1 horizontal scroll
                    LDA.w #$0032              ;\
                    STA.b $14                 ; |[]Unused code
                    STZ.b $15                 ; |
                    LDA.w #$00C0              ; |Judging by the context of surrounding code, this could
                    STA.b $16                 ; |have once assigned values to hardware register mirrors
                    LDA.w #$0000              ; |(the DP is not set to $0100 though). This is just a
                    STA.b $19                 ; |guess...
                    STZ.b $1A                 ;/
                    LDA.w #$0001              ;\Enable BG1 on mainscreen; disable subscreen
                    STA.w $0117               ;/
                    LDA.w #$0020              ;\
                    STA.b $1B                 ; |[]Unused code
                    LDA.w #$0061              ; |
                    STA.b $1C                 ; |Probably same as previous unused code.
                    LDA.w #$0040              ; |
                    STA.b $20                 ;/
.end0               SEP   #$20                ;8-bit A
                    RTL                       ;

;-------Check if menu is scrolling
CODE_00A3F5:        LDA.w $0216               ;\Timer for BG1 scrolling right
                    BNE   .rightscroll        ;/
                    LDA.w $0217               ;\Timer for BG1 scrolling left
                    BNE   .leftscroll         ;/
                    LDX.w $021A               ;\Branch if "File Select open/close" flag is set
                    BNE   +                   ;/
                    LDX.w $0220               ;\Branch if "File Select menu open" flag is set
                    BNE   +                   ;/
                    LDA.b $F4                 ;\Get controller data of both controllers
                    ORA.b $F5                 ;/
                    AND.b #$03                ;\Branch unless the right or left button
                    BEQ   .endscroll          ;/is being pressed
                    AND.b #$01                ;\Branch unless the right button is being
                    BEQ   .initleftscroll     ;/pressed
                    LDA.w $0218               ;\
                    AND.b #$03                ; |Set game index to X register
                    TAX                       ;/
                    LDA.w DATA_00A387,x       ;\Set timer for scrolling to next game
                    STA.w $0216               ;/(scrolling right)
                    INC.w $0218               ;Increment scroll index
                    LDA.b #$01                ;\Play SFX (game select)
                    STA.w $63                 ;/
.rightscroll        DEC.w $0216               ;\Decrement "scroll to right" timer
                    BEQ   .endscroll          ;/
                    REP   #$20                ;16-bit A
                    LDA.w $0214               ;\
                    CLC                       ; |Scroll BG1 IRQ right 4 pixels per frame
                    ADC.w #$0004              ; |
                    AND.w #$01FF              ; |
                    STA.w $0214               ;/
                    SEP   #$20                ;8-bit A
                    BRA   .endscroll          ;

.initleftscroll     DEC.w $0218               ;Decrement scroll index
                    LDA.w $0218               ;\
                    AND.b #$03                ; |Set game index to X register
                    TAX                       ;/
                    LDA.w DATA_00A387,x       ;\Set timer for scrolling to next game
                    STA.w $0217               ;/(scrolling right)
                    LDA.b #$01                ;\Play SFX (game select)
                    STA.w $63                 ;/
.leftscroll         DEC.w $0217               ;\Decrement "scroll to right" timer
                    BEQ   .endscroll          ;/
                    REP   #$20                ;16-bit A
                    LDA.w $0214               ;\
                    SEC                       ; |Scroll BG1 IRQ left 4 pixels per frame
                    SBC.w #$0004              ; |
                    AND.w #$01FF              ; |
                    STA.w $0214               ;/
                    SEP   #$20                ;8-bit A
.endscroll          LDA.w $0216               ;\
                    ORA.w $0217               ; |Branch if neither timer is active (no scrolling)
                    BEQ   +                   ;/
                    JMP.w .end1               ;

;-------Check if game has been selected for gameplay
+                   STZ.b $00                 ;Clear "specific button pressed" flag
                    LDA.w $0224               ;\Branch unless "Begin gameplay" flag is set
                    BEQ   ++                  ;/
                    DEC.w $0223               ;Decrement wait timer for gameplay fade out
                    LDA.w $0223               ;\Once timer is clear, begin fading out screen
                    BNE   +                   ;/
                    LDA.b #$06                ;\Fade out screen, prepare for gameplay
                    STA.b $E0                 ;/
+                   JMP.w .end1               ;

;-------Check if File Select menu is in its open state
++                  LDA.w $0220               ;\Branch unless "File Select is open" flag is set
                    BEQ   +                   ;/
                    LDA.b $F4                 ;\
                    ORA.b $F5                 ; |Determined whether the X or Y button has been
                    ORA.b $F6                 ; |pressed on either controller for this frame
                    ORA.b $F7                 ; |
                    AND.b #$40                ; |
                    STA.b $00                 ;/
                    BNE   .closefilemenu      ;If it has been, close the menu
                    LDA.w $021A               ;\Close the menu if the "File Select open/close" flag
                    BNE   .closefilemenu      ;/is set (while the menu is still open)
                    BRA   +++                 ;


+                   LDA.w $021A               ;\Branch if "File Select open/close" flag is set
                    BNE   .closefilemenu      ;/
                    LDA.b $F4                 ;\
                    ORA.b $F5                 ; |Determine whether the Start button has been
                    AND.b #$10                ; |pressed on either controller for this frame
                    STA.b $00                 ;/
                    BNE   +                   ;Open file menu if start button has been pressed
                    BRA   +++                 ;

+                   LDA.b $00                 ;\Push "Start button pressed" flag
                    PHA                       ;/
                    JSR.w CODE_00A8AE         ;
                    PLA                       ;\Recover "Start button pressed" flag
                    STA.b $00                 ;/
.closefilemenu      LDA.w $0218               ;\
                    AND.b #$03                ; |Set game index to X register as a word index
                    ASL   A                   ; |
                    TAX                       ;/
                    JSR.w (PNTR_00A8A6,x)     ;
                    JMP.w .end1               ;

+++                 LDA.w $0220               ;\Branch if "File Select is open" flag is set
                    BNE   +                   ;/
                    JMP.w .end1               ;

+                   LDA.b $0C                 ;
                    STA.b $00                 ;
                    LDA.w $0218               ;
                    AND.b #$03                ;
                    STA.b $D0                 ;
                    LDA.b $F4                 ;
                    ORA.b $F5                 ;
                    AND.b #$20                ;
                    BEQ   +                   ;
                    LDA.l $700006             ;
                    EOR.b #$01                ;
                    STA.l $700006             ;
                    LDA.b #$01                ;
                    STA.w $63                 ;
                    JSR.w CODE_00AFEC         ;
                    JMP.w .end1               ;

+                   LDA.b $F4                 ;
                    ORA.b $F5                 ;
                    AND.b #$0C                ;
                    LSR   A                   ;
                    LSR   A                   ;
                    TAX                       ;
                    LDA.b $D1                 ;
                    CLC                       ;
                    ADC.w DATA_00B5EA,x       ;
                    AND.b #$03                ;
                    STA.b $D1                 ;
                    TXY                       ;
                    BEQ   ++                  ;
                    LDA.w $021A               ;
                    BNE   +                   ;
                    LDA.w $0220               ;
                    BEQ   +                   ;
                    JSR.w CODE_00B071         ;
                    LDA.b #$23                ;\SFX to play when you move cursor |> over files ABCD
                    STA.b $63                 ;/when selecting a save file after selecting a game.
                    JMP.w .end1               ;
+                   LDA.b $D1                 ;
++                  ASL   A                   ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.b $D0                 ;
                    STA.b $01                 ;
                    TAX                       ;
                    LDA.b $D2                 ;
                    BEQ   +                   ;
                    JMP.w ++++++++++          ;

+                   LDA.b $B0,x               ;
                    INC   A                   ;
                    BNE   ++                  ;
                    LDA.b $F4                 ;
                    ORA.b $F5                 ;
                    AND.b #$10                ;
                    BEQ   +                   ;
                    JMP.w ++++++++            ;

+                   LDA.b $F4                 ;
                    ORA.b $F5                 ;
                    AND.b #$83                ;
                    STA.b $00                 ;
                    LDA.b $F6                 ;
                    ORA.b $F7                 ;
                    AND.b #$80                ;
                    ORA.b $00                 ;
                    AND.b #$83                ;
                    BEQ   +                   ;
                    LDA.b #$2A                ;
                    STA.w $63                 ;
+                   JMP.w .end1               ;

++                  TXA                       ;
                    AND.b #$03                ;
                    CMP.b #$01                ;
                    BNE   +                   ;
                    JMP.w ++++++              ;

+                   LDA.b $F4                 ;
                    ORA.b $F5                 ;
                    AND.b #$83                ;
                    BNE   +                   ;
                    JMP.w +++++++             ;

+                   AND.b #$02                ;
                    BEQ   +                   ;
                    JMP.w +++++               ;

+                   LDA.b $B0,x               ;
                    CMP.b #$02                ;
                    BCS   +                   ;
                    LDA.b #$2A                ;
                    STA.w $63                 ;
+                   LDA.b $D0                 ;
                    BNE   +                   ;
                    LDA.l $700490,x           ;
                    BNE   ++                  ;
+                   LDA.w $80,x               ;
                    CMP.b #$01                ;
                    BEQ   +                   ;
++                  LDA.b #$4C                ;
                    STA.w $63                 ;
+                   INC.w $00B0,x             ;
                    LDA.b $D0                 ;
                    BNE   +++                 ;
                    LDA.l $700490,x           ;
                    BEQ   +++                 ;
                    LDA.b $70,x               ;
                    BNE   +                   ;
                    LDA.w $B0,x               ;
                    CMP.b #$09                ;
                    BCC   ++++                ;
                    LDA.b #$01                ;
                    STA.b $70,x               ;
                    STA.w $B0,x               ;
                    STA.w $C0,x               ;
                    BRA   ++++                ;

+                   LDA.w $B0,x               ;
                    CMP.w $0080,x             ;
                    BEQ   ++                  ;
                    BCC   +                   ;
                    STZ.b $70,x               ;
                    LDA.b #$01                ;
+                   STA.b $B0,x               ;
                    BRA   ++++                ;

++                  STA.b $B0,x               ;
                    LDA.b #$01                ;
                    STA.b $C0,x               ;
                    BRA   ++++                ;
+++                 LDA.w $B0,x               ;
                    CMP.w $0080,x             ;
                    BEQ   ++                  ;
                    BCC   +                   ;
                    LDA.b #$01                ;
+                   STA.b $B0,x               ;
                    BRA   ++++                ;

++                  STA.b $B0,x               ;
                    LDA.b #$01                ;
                    STA.b $C0,x               ;
                    LDA.w $0218               ;
                    AND.b #$03                ;
                    CMP.b #$01                ;
                    BNE   ++++                ;
                    JSR.w CODE_00B16B         ;
++++                JSR.w CODE_00B0DA         ;
                    JMP.w +++++++             ;

+++++               LDA.b $B0,x               ;
                    CMP.b #$02                ;
                    BCS   +                   ;
                    LDA.b #$2A                ;\SFX to play when you can't decrease world number
                    STA.b $63                 ;/in a FILE A/B/C/D select
+                   LDA.b $D0                 ;
                    BNE   +                   ;
                    LDA.l $700490,x           ;
                    BNE   ++                  ;
+                   LDA.b $80,x               ;
                    CMP.b #$01                ;
                    BNE   ++                  ;
                    JMP.w +++++++             ;

++                  LDA.b #$4C                ;
                    STA.b $63                 ;
                    DEC.b $B0,x               ;
                    LDA.b $D0                 ;
                    BNE   ++                  ;
                    LDA.l $700490,x           ;
                    BEQ   ++                  ;
                    LDA.b $B0,x               ;
                    BNE   ++                  ;
                    LDA.b $70,x               ;
                    BNE   +                   ;
                    LDA.l $700490,x           ;
                    STA.b $70,x               ;
                    BRA   ++                  ;
+                   STZ.b $70,x               ;
                    LDA.b #$08                ;
                    STA.b $B0,x               ;
++                  LDA.b $B0,x               ;
                    BNE   +                   ;
                    LDA.b $80,x               ;
                    STA.b $B0,x               ;
+                   JSR.w CODE_00B0DA         ;
                    JMP.w +++++++             ;

++++++              LDA.b $F4                 ;
                    ORA.b $F5                 ;
                    AND.b #$83                ;
                    BNE   +                   ;
                    JMP.w +++++++             ;

+                   LDA.b $80,x               ;
                    CMP.b #$01                ;
                    BEQ   +                   ;
                    BRA   ++                  ;
+                   LDA.w $90,x               ;
                    CMP.b #$01                ;
                    BNE   ++                  ;
                    LDA.b #$2A                ;
                    BRA   +++                 ;

++                  LDA.b #$4C                ;
+++                 STA.w $63                 ;
                    LDA.b $F4                 ;
                    ORA.b $F5                 ;
                    BMI   +++++               ;
                    AND.b #$01                ;
                    BNE   +++++               ;
                    LDA.b $B0,x               ;
                    CMP.b $80,x               ;
                    BNE   ++                  ;
                    DEC.b $C0,x               ;
                    BNE   +                   ;
                    DEC.b $B0,x               ;
                    BEQ   +++                 ;
                    LDA.b #$04                ;
                    STA.b $C0,x               ;
+                   BRA   ++++                ;

++                  DEC.b $C0,x               ;
                    BNE   ++++                ;
                    LDA.b #$04                ;
                    STA.b $C0,x               ;
                    DEC.b $B0,x               ;
                    BNE   ++++                ;
+++                 LDA.b $80,x               ;
                    STA.b $B0,x               ;
                    LDA.b $90,x               ;
                    STA.b $C0,x               ;
++++                LDA.w $A0,x               ;
                    BEQ   +                   ;
                    LDA.b $B0,x               ;
                    CMP.b #$09                ;
                    BNE   +                   ;
                    DEC.w $00B0,x             ;
+                   JMP.w ++++++              ;

+++++               INC.w $00C0,x             ;
                    LDA.b $B0,x               ;
                    CMP.w $0080,x             ;
                    BEQ   +                   ;
                    LDA.b $C0,x               ;
                    CMP.b #$05                ;
                    BCC   ++++                ;
                    INC.b $B0,x               ;
                    LDA.b $B0,x               ;
                    CMP.b $80,x               ;
                    BEQ   +++                 ;
                    BCC   +++                 ;
                    BRA   ++                  ;

+                   LDA.b $C0,x               ;
                    CMP.b $90,x               ;
                    BEQ   ++++                ;
                    BCC   ++++                ;
                    INC.b $B0,x               ;
                    LDA.b $B0,x               ;
                    CMP.b $80,x               ;
                    BEQ   ++++                ;
                    BCC   ++++                ;
++                  LDA.b #$01                ;
                    STA.b $B0,x               ;
+++                 LDA.b #$01                ;
++++                STA.w $C0,x               ;
                    LDA.w $A0,x               ;
                    BEQ   ++++++              ;
                    LDA.b $B0,x               ;
                    CMP.b #$09                ;
                    BNE   ++++++              ;
                    INC.w $00B0,x             ;
++++++              JSR.w CODE_00B0DA         ;
                    JSR.w CODE_00B16B         ;
+++++++             LDA.b #$00                ;
                    STA.b $00                 ;
                    LDA.b $0F                 ;
                    STA.b $01                 ;
                    LDA.b $D1                 ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ORA.b $D0                 ;
                    STA.b $0C                 ;
                    TAX                       ;
                    STZ.b $0D                 ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w DATA_00A367,y       ;
                    STA.b $02                 ;
                    LDA.w DATA_00A367+1,y     ;
                    STA.b $03                 ;
                    LDA.b $B0,x               ;
                    STA.b $04                 ;
                    STZ.b $05                 ;
                    LDA.b $C0,x               ;
                    STA.b $06                 ;
                    STZ.b $07                 ;
                    STX.b $29                 ;
                    LDX.b $29                 ;
                    LDA.b $F6                 ;
                    ORA.b $F7                 ;
                    AND.b #$80                ;
                    BNE   +                   ;
                    LDX.b $0C                 ;
++++++++            LDA.b $F4                 ;
                    ORA.b $F5                 ;
                    AND.b #$10                ;
                    BEQ   .end1               ;
                    LDA.b #$29                ;
                    STA.b $63                 ;
                    STA.w $0224               ;
                    LDA.b #$10                ;
                    STA.w $0223               ;
                    LDA.b #$70                ;
                    STA.w $0105               ;
                    LDA.b #$50                ;
                    STA.w $0107               ;
                    STZ.b $E3                 ;
                    BRA   ++                  ;

+                   STZ.w $0224               ;
                    LDA.b #$04                ;
                    STA.b $D2                 ;
                    INC.b $E0                 ;
                    LDA.b #$22                ;
                    STA.b $63                 ;
.end1               RTL                       ;

++                  LDA.b $D1                 ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ADC.b $D0                 ;
                    LDA.b $B0,x               ;
                    INC   A                   ;
                    BNE   +                   ;
                    LDA.b #$00                ;
                    STA.l $700008             ;
                    STA.l $700009             ;
                    LDA.b $D2                 ;
                    CMP.b #$04                ;
                    BNE   ++                  ;
                    LDA.b #$2A                ;
                    STA.w $63                 ;
                    DEC.b $E0                 ;
                    STZ.b $D2                 ;
                    BRA   ++                  ;

+                   LDA.b $D2                 ;
                    CMP.b #$04                ;
                    BNE   +                   ;
                    LDA.b #$22                ;
                    STA.w $63                 ;
                    LDA.b #$40                ;
                    STA.w $011B               ;
+                   LDA.b $B0,x               ;
                    DEC   A                   ;
                    BPL   +                   ;
                    LDA.b #$00                ;
+                   STA.l $700008             ;
                    LDA.b $C0,x               ;
                    DEC   A                   ;
                    BPL   +                   ;
                    LDA.b #$00                ;
+                   STA.l $700009             ;
++                  LDA.b $D1                 ;
                    ASL   A                   ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.b $D0                 ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w DATA_00A80C,x       ;
                    STA.l $700004             ;
                    LDA.w DATA_00A80C+1,x     ;
                    STA.l $700005             ;
                    RTL                       ;

++++++++++          LDA.b $F4                 ;\
                    ORA.b $F5                 ; |Branch unless Start button was pressed on either
                    AND.b #$10                ; |controller
                    BEQ   +                   ;/
                    INC.b $E0                 ;Go to next game mode
+                   LDA.b #$00                ;
                    STA.b $00                 ;
                    LDA.b $0F                 ;
                    STA.b $01                 ;
                    LDA.b $D1                 ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ORA.b $D0                 ;
                    STA.b $0C                 ;
                    TAX                       ;
                    STZ.b $0D                 ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w DATA_00A367,y       ;
                    STA.b $02                 ;
                    LDA.w DATA_00A367+1,y     ;
                    STA.b $03                 ;
                    LDA.b $B0,x               ;
                    STA.b $04                 ;
                    STZ.b $05                 ;
                    LDA.b $C0,x               ;
                    STA.b $06                 ;
                    STZ.b $07                 ;
                    RTL                       ;

DATA_00A80C:        dw $0000,$0009,$0011,$001A
                    dw $0120,$0129,$0131,$013A
                    dw $0240,$0249,$0251,$025A
                    dw $0360,$0369,$0371,$037A

CODE_00A82C:        LDA.b $D1                 ;
                    ASL   A                   ;
                    ASL   A                   ;
                    CLC                       ;
                    ADC.b $D0                 ;
                    ASL   A                   ;
                    TAX                       ;
                    REP   #$20                ;
                    LDA.w DATA_00A80C,x       ;
                    REP   #$10                ;
                    TAX                       ;
                    LDA.w #$FFFF              ;
                    STA.l $700010,x           ;
                    SEP   #$30                ;
                    JMP.w CODE_008C1B         ;

CODE_00A849:        PHB                       ;
                    LDA.b #$70                ;
                    PHA                       ;
                    PLB                       ;
                    REP   #$10                ;
                    LDA.b #$20                ;
                    STA.b $0E                 ;
                    LDA.b #$01                ;
                    STA.b $0F                 ;
                    LDX.w #$0000              ;
                    LDY.w $700004             ;
-                   LDA.w $700010,y           ;
                    STA.l $7FFB00,x           ;
                    INY                       ;
                    INX                       ;
                    CPX.b $0E                 ;
                    BNE   -                   ;
                    LDA.w $08               ;
                    STA.l $7FFB00             ;
                    LDA.w $700009             ;
                    STA.l $7FFB01             ;
                    LDA.l $70000F             ;
                    STA.b $00                 ;
                    BNE   +                   ;
                    LDA.l $70000E             ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ORA.b $00                 ;
                    XBA                       ;
                    LDA.b #$00                ;
                    XBA                       ;
                    TAX                       ;
                    LDA.l $700490,x           ;
                    STA.l $7FFB05             ;
+                   LDA.b #$00                ;
                    XBA                       ;
                    LDA.l $70000E             ;
                    AND.b #$03                ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAX                       ;
                    SEP   #$10                ;
                    PLB                       ;
                    RTL                       ;

PNTR_00A8A6:        dw CODE_00AA05
                    dw CODE_00AAA1
                    dw CODE_00AB74
                    dw CODE_00AC12

;-------Initialize "File Select tileset" buffer
CODE_00A8AE:        REP   #$20                ;16-bit A
                    LDX.b #$80                ;Initialize loop index
                    LDA.w #$02FF              ;Initialize value to write to buffer
-                   STA.w $0400+$000,x        ;\
                    STA.w $0400+$080,x        ; |Write value to "File Select tileset" buffer
                    STA.w $0400+$100,x        ; |
                    STA.w $0400+$180,x        ; |Value: #$02FF
                    STA.w $0400+$200,x        ; |Dest: $0400
                    STA.w $0400+$280,x        ; |Size: 0x780 bytes
                    STA.w $0400+$300,x        ;/
                    DEX                       ;\Decrement index
                    DEX                       ;/
                    BPL   -                   ;Continue loop until zero
                    LDY.b $D1                 ;\
                    LDX.w DATA_00AA01,y       ; |Set cursor arrow tile to point to the selected file
                    LDA.w #$034F              ; |Y: file index, X: height index, #$034F: cursor arrow tile
                    STA.w $0400+$DA,x         ;/
                    LDX.b #$00                ;Initialize X index
-                   LDA.w DATA_00A9B1,x       ;Get tileset tile
                    CMP.w #$FFFF              ;\Finish loop when terminating #$FFFF is reads
                    BEQ   +                   ;/
                    STA.w $0400+$0DC,x        ;\
                    STA.w $0400+$130,x        ; |Write "FILE" and bottom half of "NEW" text to Select File menu
                    STA.w $0400+$184,x        ; |
                    STA.w $0400+$1D8,x        ;/
                    INX                       ;\Increment X to index next word
                    INX                       ;/
                    BRA   -                   ;loop
+                   LDX.b #$00                ;Initialize loop index
                    LDA.w #$0360              ;Get first tileset tile
-                   STA.w $0400+$0BE,x        ;\
                    STA.w $0400+$112,x        ; |Write top half of "NEW" text to Select File menu
                    STA.w $0400+$166,x        ; |
                    STA.w $0400+$1BA,x        ;/
                    INC   A                   ;Get next tileset tile
                    INX                       ;\Increment X to index next word
                    INX                       ;/
                    CPX.b #$04<<1             ;\Loop 4 times
                    BNE   -                   ;/
                    REP   #$10                ;16-bit XY
                    LDX.w #$0000              ;Initialize loop index
                    LDA.w #$02F5              ;
                    STA.b $00                 ;
-                   LDA.b $00                 ;
                    STA.w $0400+$B8,x         ;
                    INC.b $00                 ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$002A              ;
                    TAX                       ;
                    CPX.w #$0150              ;
                    BNE   -                   ;
                    SEP   #$10                ;
                    LDX.b #$00                ;
                    LDA.w #$038B              ;
-                   STA.w $0622,x             ;
                    INC   A                   ;
                    INX                       ;
                    INX                       ;
                    CPX.b #$14                ;
                    BNE   -                   ;
                    LDX.b #$00                ;
-                   LDA.w DATA_00A9C7,x       ;
                    STA.w $067C,x             ;
                    LDA.w DATA_00A9C7+8,x     ;
                    STA.w $06A6,x             ;
                    LDA.w DATA_00A9C7+$10,x   ;
                    STA.w $06D0,x             ;
                    LDA.w DATA_00A9C7+$18,x   ;
                    STA.w $06FA,x             ;
                    INX                       ;
                    INX                       ;
                    CPX.b #$08                ;
                    BNE   -                   ;
                    LDA.w #$0368              ;
                    STA.b $00                 ;
                    LDA.w #$0378              ;
                    STA.b $02                 ;
                    LDX.b #$00                ;
-                   LDA.b $00                 ;
                    STA.w $0684,x             ;
                    STA.w $06CA,x             ;
                    LDA.b $02                 ;
                    STA.w $06AE,x             ;
                    STA.w $0702,x             ;
                    INC.b $00                 ;
                    INC.b $02                 ;
                    INX                       ;
                    INX                       ;
                    CPX.b #$06                ;
                    BNE   -                   ;
                    LDA.w #$0380              ;
                    LDX.b #$00                ;
-                   STA.w $0722,x             ;
                    INC   A                   ;
                    INX                       ;
                    INX                       ;
                    CPX.b #$0C                ;
                    BNE   -                   ;
                    LDA.l $700006             ;
                    AND.w #$00FF              ;
                    BEQ   +                   ;
                    LDA.w #$0368              ;
                    STA.w $0702               ;
                    INC   A                   ;
                    STA.w $0704               ;
                    INC   A                   ;
                    STA.w $0706               ;
                    LDA.w #$0386              ;
                    STA.w $072A               ;
                    INC   A                   ;
                    STA.w $072C               ;
+                   SEP   #$20                ;
                    RTS                       ;

;-------Tilemap data for the "FILE" and bottom half of "NEW" text in the Select File menu
DATA_00A9B1:        dw $02F2,$02F3,$02F4,$0351,$0351 ;
                    dw $0351,$0370,$0371,$0372,$0373 ;
                    dw $FFFF                         ;#$FFFF tells the loop to stop uploading tiles

DATA_00A9C7:        db $64,$03,$65,$03,$66,$03,$67,$03 ;Tilemap in selected game's file select
                    db $74,$03,$75,$03,$76,$03,$77,$03 ;Tilemap of the small controller in the bottom-left corner
                    db $6B,$03,$6C,$03,$6D,$03,$6E,$03 ;Format: tile, properties
                    db $7B,$03,$7C,$03,$7D,$03,$7E,$03 ;Tilemap is for controller -only-, not for the text around it.

DATA_00A9E7:        db $FF,$FF,$83,$03,$95,$03,$96,$03 ;
                    db $97,$03,$83,$03,$FF,$02,$98,$03 ;
                    db $99,$03,$9A,$03,$83,$03,$FF,$02 ;
                    db $5F,$03                         ;

;-------Tile offset of the cursor arrow in the File Select screen
DATA_00AA01:        db $00,$54,$A8,$FC

CODE_00AA05:        LDA.w $0220               ;
                    BNE   +++                 ;
                    LDA.w $021B               ;
                    BNE   ++                  ;
                    LDA.b $00                 ;
                    BNE   +                   ;
                    LDA.b #$01                ;
                    STA.w $0220               ;
                    STZ.w $021A               ;
                    JMP.w .end                ;
+                   LDA.b #$3F                ;
                    STA.w $63                 ;
                    REP   #$20                ;
                    LDA.w #$0300              ;
                    STA.b $00                 ;
                    LDA.w #$0310              ;
                    STA.b $02                 ;
                    LDX.b #$00                ;
-                   LDA.b $00                 ;
                    STA.w $0438,x             ;
                    LDA.b $02                 ;
                    STA.w $0462,x             ;
                    INC.b $00                 ;
                    INC.b $02                 ;
                    INX                       ;
                    INX                       ;
                    CPX.b #$10                ;
                    BNE   -                   ;
                    STZ.w $021E               ;
                    LDA.w #$00B0              ;
                    STA.b $00                 ;
                    JSR.w CODE_00ACF0         ;
                    LDA.w #$0016              ;
                    STA.b $00                 ;
                    LDX.b #$70                ;
                    STX.b $02                 ;
                    JSR.w CODE_00ADAB         ;
                    LDA.w #$78E5              ;
                    STA.w $021C               ;
                    SEP   #$20                ;
                    LDA.b #$01                ;
                    STA.w $021A               ;
                    LDA.b #$15                ;
                    STA.w $021B               ;
++                  JSR.w CODE_00ADF8         ;
                    BRA   .end                ;
+++                 LDA.w $021B               ;
                    BNE   ++                  ;
                    LDA.b $00                 ;
                    BNE   +                   ;
                    STZ.w $021A               ;
                    STZ.w $0220               ;
                    BRA   .end                ;
+                   LDA.b #$3F                ;
                    STA.w $63               ;
                    REP   #$20                ;
                    LDA.w #$070A              ;
                    STA.w $021E               ;
                    SEP   #$20                ;
                    LDA.b #$01                ;
                    STA.w $021A               ;
                    LDA.b #$16                ;
                    STA.w $021B               ;
++                  JSR.w CODE_00AEC9         ;
.end                RTS                       ;

CODE_00AAA1:        LDA.w $0220               ;
                    BEQ   +                   ;
                    JMP.w +++                 ;
+                   LDA.w $021B               ;
                    BNE   ++                  ;
                    LDA.b $00                 ;
                    BNE   +                   ;
                    LDA.b #$01                ;
                    STA.w $0220               ;
                    STZ.w $021A               ;
                    JMP.w .end                ;
+                   LDA.b #$3F                ;
                    STA.w $63               ;
                    REP   #$20                ;
                    LDA.w #$0300              ;
                    STA.b $00                 ;
                    LDA.w #$0310              ;
                    STA.b $02                 ;
                    LDX.b #$00                ;
-                   LDA.b $00                 ;
                    STA.w $0438,x             ;
                    LDA.b $02                 ;
                    STA.w $0462,x             ;
                    INC.b $00                 ;
                    INC.b $02                 ;
                    INX                       ;
                    INX                       ;
                    CPX.b #$10                ;
                    BNE   -                   ;
                    LDX.b #$00                ;
                    LDA.w #$02E0              ;
-                   STA.w $048C,x             ;
                    INC   A                   ;
                    INX                       ;
                    INX                       ;
                    CPX.b #$10                ;
                    BNE   -                   ;
                    STZ.w $021E               ;
                    LDA.w #$00B0              ;
                    INC   A                   ;
                    STA.b $00                 ;
                    JSR.w CODE_00AD5C         ;
                    LDA.w #$78F4              ;
                    STA.w $021C               ;
                    SEP   #$20                ;
                    LDA.b #$01                ;
                    STA.w $021A               ;
                    LDA.b #$15                ;
                    STA.w $021B               ;
++                  REP   #$20                ;
                    LDA.w #$000C              ;
                    STA.b $00                 ;
                    LDA.w #$0009              ;
                    STA.b $02                 ;
                    LDA.w #$0018              ;
                    STA.b $04                 ;
                    LDA.w #$0012              ;
                    STA.b $06                 ;
                    SEP   #$20                ;
                    JSR.w CODE_00AE4A         ;
                    BRA   .end                ;
+++                 LDA.w $021B               ;
                    BNE   ++                  ;
                    LDA.b $00                 ;
                    BNE   +                   ;
                    STZ.w $021A               ;
                    STZ.w $0220               ;
                    BRA   .end                ;
+                   LDA.b #$3F                ;
                    STA.w $63               ;
                    REP   #$20                ;
                    LDA.w #$0728              ;
                    STA.w $021E               ;
                    SEP   #$20                ;
                    LDA.b #$01                ;
                    STA.w $021A               ;
                    LDA.b #$16                ;
                    STA.w $021B               ;
++                  REP   #$20                ;
                    LDA.w #$000C              ;
                    STA.b $00                 ;
                    LDA.w #$0009              ;
                    STA.b $02                 ;
                    LDA.w #$0018              ;
                    STA.b $04                 ;
                    LDA.w #$0012              ;
                    STA.b $06                 ;
                    SEP   #$20                ;
                    JSR.w CODE_00AF3C         ;
.end                RTS                       ;

CODE_00AB74:        LDA.w $0220               ;
                    BNE   +++                 ;
                    LDA.w $021B               ;
                    BNE   ++                  ;
                    LDA.b $00                 ;
                    BNE   +                   ;
                    LDA.b #$01                ;
                    STA.w $0220               ;
                    STZ.w $021A               ;
                    JMP.w .end                ;
+                   LDA.b #$3F                ;
                    STA.w $63               ;
                    REP   #$20                ;
                    LDA.w #$0300              ;
                    STA.b $00                 ;
                    LDA.w #$0310              ;
                    STA.b $02                 ;
                    LDX.b #$00                ;
-                   LDA.b $00                 ;
                    STA.w $0436,x             ;
                    LDA.b $02                 ;
                    STA.w $0460,x             ;
                    INC.b $00                 ;
                    INC.b $02                 ;
                    INX                       ;
                    INX                       ;
                    CPX.b #$10                ;
                    BNE   -                   ;
                    LDA.w #$030B              ;
                    STA.w $0446               ;
                    LDA.w #$031B              ;
                    STA.w $0470               ;
                    STZ.w $021E               ;
                    LDA.w #$00B0              ;
                    INC   A                   ;
                    INC   A                   ;
                    STA.b $00                 ;
                    JSR.w CODE_00ACF0         ;
                    LDA.w #$7CE4              ;
                    STA.w $021C               ;
                    SEP   #$20                ;
                    LDA.b #$01                ;
                    STA.w $021A               ;
                    LDA.b #$15                ;
                    STA.w $021B               ;
++                  JSR.w CODE_00ADF8         ;
                    BRA   .end                ;
+++                 LDA.w $021B               ;
                    BNE   ++                  ;
                    LDA.b $00                 ;
                    BNE   +                   ;
                    STZ.w $021A               ;
                    STZ.w $0220               ;
                    BRA   .end                ;
+                   LDA.b #$3F                ;
                    STA.w $63               ;
                    REP   #$20                ;
                    LDA.w #$0F08              ;
                    STA.w $021E               ;
                    SEP   #$20                ;
                    LDA.b #$01                ;
                    STA.w $021A               ;
                    LDA.b #$16                ;
                    STA.w $021B               ;
++                  JSR.w CODE_00AEC9         ;
.end                RTS                       ;

CODE_00AC12:        LDA.w $0220               ;
                    BEQ   +                   ;
                    JMP.w +++                 ;
+                   LDA.w $021B               ;
                    BNE   ++                  ;
                    LDA.b $00                 ;
                    BNE   +                   ;
                    LDA.b #$01                ;
                    STA.w $0220               ;
                    STZ.w $021A               ;
                    JMP.w .end                ;
+                   LDA.b #$3F                ;
                    STA.w $63               ;
                    REP   #$20                ;
                    LDA.w #$0300              ;
                    STA.b $00                 ;
                    LDA.w #$0310              ;
                    STA.b $02                 ;
                    LDX.b #$00                ;
-                   LDA.b $00                 ;
                    STA.w $0436,x             ;
                    LDA.b $02                 ;
                    STA.w $0460,x             ;
                    INC.b $00                 ;
                    INC.b $02                 ;
                    INX                       ;
                    INX                       ;
                    CPX.b #$10                ;
                    BNE   -                   ;
                    LDA.w #$030C              ;
                    STA.w $0446               ;
                    LDA.w #$031C              ;
                    STA.w $0470               ;
                    STZ.w $021E               ;
                    LDA.w #$00B0              ;
                    INC   A                   ;
                    INC   A                   ;
                    INC   A                   ;
                    STA.b $00                 ;
                    JSR.w CODE_00ACF0         ;
                    LDA.w #$012D              ;
                    STA.b $00                 ;
                    LDX.b #$70                ;
                    STX.b $02                 ;
                    JSR.w CODE_00ADAB         ;
                    LDA.w #$7CF5              ;
                    STA.w $021C               ;
                    SEP   #$20                ;
                    LDA.b #$01                ;
                    STA.w $021A               ;
                    LDA.b #$15                ;
                    STA.w $021B               ;
++                  REP   #$20                ;
                    LDA.w #$000B              ;
                    STA.b $00                 ;
                    LDA.w #$000A              ;
                    STA.b $02                 ;
                    LDA.w #$0016              ;
                    STA.b $04                 ;
                    LDA.w #$0014              ;
                    STA.b $06                 ;
                    SEP   #$20                ;
                    JSR.w CODE_00AE4A         ;
                    BRA   .end                ;
+++                 LDA.w $021B               ;
                    BNE   ++                  ;
                    LDA.b $00                 ;
                    BNE   +                   ;
                    STZ.w $021A               ;
                    STZ.w $0220               ;
                    BRA   .end                ;
+                   LDA.b #$3F                ;
                    STA.w $63               ;
                    REP   #$20                ;
                    LDA.w #$0F2A              ;
                    STA.w $021E               ;
                    SEP   #$20                ;
                    LDA.b #$01                ;
                    STA.w $021A               ;
                    LDA.b #$16                ;
                    STA.w $021B               ;
++                  REP   #$20                ;
                    LDA.w #$000B              ;
                    STA.b $00                 ;
                    LDA.w #$000A              ;
                    STA.b $02                 ;
                    LDA.w #$0016              ;
                    STA.b $04                 ;
                    LDA.w #$0014              ;
                    STA.b $06                 ;
                    SEP   #$20                ;
                    JSR.w CODE_00AF3C         ;
.end                RTS                       ;

CODE_00ACF0:        LDX.b #$00                ;
                    TXY                       ;
-                   LDA.b ($00),y             ;
                    INC   A                   ;
                    AND.w #$00FF              ;
                    BEQ   +                   ;
                    ORA.w #$0340              ;
                    STA.w $04C0,x             ;
                    ORA.w #$0010              ;
                    STA.w $04EA,x             ;
                    LDA.w #$02FD              ;
                    STA.w $04EC,x             ;
                    LDA.w #$0351              ;
                    STA.w $04E8,x             ;
                    STA.w $04EE,x             ;
                    LDA.w #$02FF              ;
                    STA.w $04BE,x             ;
                    STA.w $04C2,x             ;
                    STA.w $04C4,x             ;
+                   TXA                       ;
                    CLC                       ;
                    ADC.w #$0054              ;
                    TAX                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    CPY.b #$10                ;
                    BNE   -                   ;
                    LDA.w $0218               ;
                    AND.w #$0003              ;
                    CMP.w #$0002              ;
                    BCS   .end                ;
                    LDX.b #$00                ;
                    TXY                       ;
-                   LDA.b $70,x               ;
                    AND.w #$00FF              ;
                    BEQ   +                   ;
                    LDA.w #$039B              ;
                    STA.w $04E8,y             ;
+                   TYA                       ;
                    CLC                       ;
                    ADC.w #$0054              ;
                    TAY                       ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    INX                       ;
                    CPX.b #$10                ;
                    BEQ   .end                ;
                    BRA   -                   ;
.end                RTS                       ;

CODE_00AD5C:        LDX.b #$00                ;
                    TXY                       ;
-                   LDA.b ($00),y             ;
                    INC   A                   ;
                    AND.w #$00FF              ;
                    BEQ   +                   ;
                    ORA.w #$0340              ;
                    STA.w $04BE,x             ;
                    ORA.w #$0010              ;
                    STA.w $04E8,x             ;
                    LDA.w #$02FD              ;
                    STA.w $04EA,x             ;
                    LDA.w #$02FE              ;
                    STA.w $04EC,x             ;
                    LDA.w #$02FF              ;
                    STA.w $04C0,x             ;
                    STA.w $04C2,x             ;
                    LDA.w $C0,y             ;
                    XBA                       ;
                    AND.w #$00FF              ;
                    INC   A                   ;
                    ORA.w #$0340              ;
                    STA.w $04C4,x             ;
                    ORA.w #$0010              ;
                    STA.w $04EE,x             ;
+                   TXA                       ;
                    CLC                       ;
                    ADC.w #$0054              ;
                    TAX                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    INY                       ;
                    CPY.b #$10                ;
                    BNE   -                   ;
                    RTS                       ;

CODE_00ADAB:        REP   #$10                ;
                    LDA.w $0218               ;
                    AND.w #$0003              ;
                    STA.b $0A                 ;
                    LDA.w #$0000              ;
                    TAX                       ;
                    STA.b $04                 ;
-                   LDY.b $04                 ;
                    LDA.b [$00],y             ;
                    AND.w #$00FF              ;
                    CMP.w #$00FF              ;
                    BEQ   +                   ;
                    CLC                       ;
                    ADC.b $0A                 ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w DATA_00ADEC,y       ;
                    STA.w $04F0,x             ;
                    INC   A                   ;
                    STA.w $04F2,x             ;
+                   LDA.b $04                 ;
                    CLC                       ;
                    ADC.w #$0120              ;
                    STA.b $04                 ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0054              ;
                    TAX                       ;
                    AND.w #$0100              ;
                    BEQ   -                   ;
                    SEP   #$10                ;
                    RTS                       ;

DATA_00ADEC:        db $9C,$03,$9E,$03,$00,$00,$00,$00 ;
                    db $9C,$03,$9E,$03 ;

CODE_00ADF8:        LDA.l $7F8000             ;
                    TAX                       ;
                    REP   #$30                ;
                    LDA.w #$0015              ;
                    STA.b $04                 ;
                    LDA.w $021C               ;
                    XBA                       ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    LDA.w #$002A              ;
                    XBA                       ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
-                   LDY.w $021E               ;
                    LDA.w $0400,y             ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    INC.w $021E               ;
                    INC.w $021E               ;
                    DEC.b $04                 ;
                    BNE   -                   ;
                    LDA.w $021C               ;
                    CLC                       ;
                    ADC.w #$0020              ;
                    STA.w $021C               ;
                    LDA.w #$FFFF              ;
                    STA.l $7F8002,x           ;
                    TXA                       ;
                    STA.l $7F8000             ;
                    SEP   #$30                ;
                    DEC.w $021B               ;
                    RTS                       ;

CODE_00AE4A:        LDA.l $7F8000             ;
                    TAX                       ;
                    REP   #$30                ;
                    LDA.b $00                 ;
                    LDA.b $02                 ;
                    LDA.w $021C               ;
                    XBA                       ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    LDA.b $04                 ;
                    XBA                       ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
-                   LDY.w $021E               ;
                    LDA.w $0400,y             ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    INC.w $021E               ;
                    INC.w $021E               ;
                    DEC.b $00                 ;
                    BNE   -                   ;
                    LDA.w $021C               ;
                    AND.w #$7FE0              ;
                    EOR.w #$0400              ;
                    XBA                       ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    LDA.b $06                 ;
                    XBA                       ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
-                   LDY.w $021E               ;
                    LDA.w $0400,y             ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    INC.w $021E               ;
                    INC.w $021E               ;
                    DEC.b $02                 ;
                    BNE   -                   ;
                    LDA.w $021C               ;
                    CLC                       ;
                    ADC.w #$0020              ;
                    STA.w $021C               ;
                    LDA.w #$FFFF              ;
                    STA.l $7F8002,x           ;
                    TXA                       ;
                    STA.l $7F8000             ;
                    SEP   #$30                ;
                    DEC.w $021B               ;
                    RTS                       ;

CODE_00AEC9:        LDA.l $7F8000             ;
                    TAX                       ;
                    REP   #$30                ;
                    LDA.w #$0015              ;
                    STA.b $04                 ;
                    LDA.w $021C               ;
                    XBA                       ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    LDA.w #$002A              ;
                    XBA                       ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    SEP   #$20                ;
                    PHB                       ;
                    LDA.b #$7F                ;
                    PHA                       ;
                    PLB                       ;
                    REP   #$20                ;
                    LDA.l $021E               ;
                    TAY                       ;
-                   LDA.w $1000,y             ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    INY                       ;
                    INY                       ;
                    DEC.b $04                 ;
                    BNE   -                   ;
                    SEP   #$20                ;
                    PLB                       ;
                    REP   #$20                ;
                    LDA.w $021C               ;
                    SEC                       ;
                    SBC.w #$0020              ;
                    STA.w $021C               ;
                    LDA.w $021E               ;
                    SEC                       ;
                    SBC.w #$0040              ;
                    STA.w $021E               ;
                    LDA.w #$FFFF              ;
                    STA.l $7F8002,x           ;
                    TXA                       ;
                    STA.l $7F8000             ;
                    SEP   #$30                ;
                    DEC.w $021B               ;
                    LDA.w $021B               ;
                    BNE   .end                ;
                    STZ.w $021A               ;
                    STZ.w $0220               ;
.end                RTS                       ;

CODE_00AF3C:        LDA.l $7F8000             ;
                    TAX                       ;
                    REP   #$30                ;
                    LDA.b $00                 ;
                    LDA.b $02                 ;
                    LDA.w $021C               ;
                    XBA                       ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    LDA.b $04                 ;
                    XBA                       ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    SEP   #$20                ;
                    PHB                       ;
                    LDA.b #$7F                ;
                    PHA                       ;
                    PLB                       ;
                    REP   #$20                ;
                    LDA.l $021E             ;
                    TAY                       ;
-                   LDA.w $1000,y             ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    INY                       ;
                    INY                       ;
                    DEC.b $00                 ;
                    BNE   -                   ;
                    SEP   #$20                ;
                    PLB                       ;
                    REP   #$20                ;
                    LDA.w $021C               ;
                    AND.w #$7FE0              ;
                    EOR.w #$0400              ;
                    XBA                       ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    LDA.b $06                 ;
                    XBA                       ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    SEP   #$20                ;
                    PHB                       ;
                    LDA.b #$7F                ;
                    PHA                       ;
                    PLB                       ;
                    REP   #$20                ;
                    TYA                       ;
                    CLC                       ;
                    ADC.w #$07C0              ;
                    AND.w #$0FFF              ;
                    TAY                       ;
-                   LDA.w $1000,y             ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    INY                       ;
                    INY                       ;
                    DEC.b $02                 ;
                    BNE   -                   ;
                    SEP   #$20                ;
                    PLB                       ;
                    REP   #$20                ;
                    LDA.w $021C               ;
                    SEC                       ;
                    SBC.w #$0020              ;
                    STA.w $021C               ;
                    LDA.w $021E               ;
                    SEC                       ;
                    SBC.w #$0040              ;
                    STA.w $021E               ;
                    LDA.w #$FFFF              ;
                    STA.l $7F8002,x           ;
                    TXA                       ;
                    STA.l $7F8000             ;
                    SEP   #$30                ;
                    DEC.w $021B               ;
                    LDA.w $021B               ;
                    BNE   .end                ;
                    STZ.w $021A               ;
                    STZ.w $0220               ;
.end                RTS                       ;

CODE_00AFEC:        REP   #$20                ;
                    LDA.l $7F8000             ;
                    TAX                       ;
                    LDA.w $0218               ;
                    AND.w #$0003              ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w DATA_00B05D,y       ;
                    XBA                       ;
                    STA.l $7F8002,x           ;
                    LDA.w #$0006              ;
                    XBA                       ;
                    STA.l $7F8004,x           ;
                    PHY                       ;
                    LDA.l $700006             ;
                    AND.w #$0001              ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w DATA_00B06D,y       ;
                    STA.l $7F8006,x           ;
                    INC   A                   ;
                    STA.l $7F8008,x           ;
                    INC   A                   ;
                    STA.l $7F800A,x           ;
                    PLY                       ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$000A              ;
                    TAX                       ;
                    LDA.w DATA_00B065,y       ;
                    XBA                       ;
                    STA.l $7F8002,x           ;
                    LDA.w #$0004              ;
                    XBA                       ;
                    STA.l $7F8004,x           ;
                    LDA.l $700006             ;
                    AND.w #$0001              ;
                    ASL   A                   ;
                    ADC.w #$0384              ;
                    STA.l $7F8006,x           ;
                    INC   A                   ;
                    STA.l $7F8008,x           ;
                    TXA                       ;
                    CLC                       ;
                    ADC.w #$0008              ;
                    STA.l $7F8000             ;
                    SEP   #$20                ;
                    RTS                       ;

DATA_00B05D:        dw $7B2C,$7B3B,$7F2B,$7F3C
DATA_00B065:        dw $7B4B,$7B5A,$7F4A,$7F5B

DATA_00B06D:        db $78,$03,$68,$03 ;

CODE_00B071:        REP   #$20                ;
                    LDA.w #$02FF              ;
                    STA.b $00                 ;
                    STA.b $02                 ;
                    STA.b $04                 ;
                    STA.b $06                 ;
                    STA.b $08                 ;
                    STA.b $0A                 ;
                    STA.b $0C                 ;
                    LDA.b $D1                 ;
                    AND.w #$0003              ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAX                       ;
                    LDA.w #$034F              ;
                    STA.b $00,x               ;
                    LDA.l $7F8000             ;
                    TAX                       ;
                    LDA.w $0218               ;
                    AND.w #$0003              ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w DATA_00B0D2,y       ;
                    XBA                       ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    LDA.w #$800E              ;
                    XBA                       ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    LDY.b #$00                ;
-                   LDA.w $00,y             ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    INY                       ;
                    INY                       ;
                    CPY.b #$0E                ;
                    BNE   -                   ;
                    LDA.w #$FFFF              ;
                    STA.l $7F8002,x           ;
                    TXA                       ;
                    STA.l $7F8000             ;
                    SEP   #$20                ;
                    RTS                       ;

DATA_00B0D2:        db $89,$79,$98,$79,$88,$7D,$99,$7D

CODE_00B0DA:        PHX                       ;
                    PHY                       ;
                    REP   #$20                ;
                    LDA.l $7F8000             ;
                    TAX                       ;
                    LDA.w $0218               ;
                    AND.w #$0003              ;
                    STA.b $00                 ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.b $D1                 ;
                    AND.w #$00FF              ;
                    XBA                       ;
                    LSR   A                   ;
                    LSR   A                   ;
                    ADC.w DATA_00B1C2,y       ;
                    STA.b $02                 ;
                    XBA                       ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    LDA.w #$8004              ;
                    XBA                       ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    LDA.b $D1                 ;
                    AND.w #$0003              ;
                    ASL   A                   ;
                    ASL   A                   ;
                    ADC.b $00                 ;
                    TAY                       ;
                    LDA.w $B0,y             ;
                    AND.w #$00FF              ;
                    CLC                       ;
                    ADC.w #$0341              ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    ORA.w #$0010              ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    LDA.b $00                 ;
                    BNE   +                   ;
                    LDA.w $70,y             ;
                    AND.w #$00FF              ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.b $02                 ;
                    CLC                       ;
                    ADC.w #$001F              ;
                    XBA                       ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    LDA.w #$0002              ;
                    XBA                       ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    LDA.w DATA_00B1CA,y       ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
+                   LDA.w #$FFFF              ;
                    STA.l $7F8002,x           ;
                    TXA                       ;
                    STA.l $7F8000             ;
                    SEP   #$20                ;
                    PLY                       ;
                    PLX                       ;
                    RTS                       ;

CODE_00B16B:        PHX                       ;
                    PHY                       ;
                    REP   #$20                ;
                    LDA.l $7F8000             ;
                    TAX                       ;
                    LDA.b $D1                 ;
                    AND.w #$00FF              ;
                    XBA                       ;
                    LSR   A                   ;
                    LSR   A                   ;
                    ADC.w #$7D62              ;
                    XBA                       ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    LDA.w #$8004              ;
                    XBA                       ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    LDA.b $D1                 ;
                    AND.w #$0003              ;
                    ASL   A                   ;
                    ASL   A                   ;
                    TAY                       ;
                    LDA.w $C1,y             ;
                    AND.w #$00FF              ;
                    CLC                       ;
                    ADC.w #$0341              ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    ORA.w #$0010              ;
                    STA.l $7F8002,x           ;
                    INX                       ;
                    INX                       ;
                    LDA.w #$FFFF              ;
                    STA.l $7F8002,x           ;
                    TXA                       ;
                    STA.l $7F8000             ;
                    SEP   #$20                ;
                    PLY                       ;
                    PLX                       ;
                    RTS                       ;

DATA_00B1C2:        db $71,$79,$7F,$79,$70,$7D,$61,$79 ;
DATA_00B1CA:        db $51,$03,$9B,$03 ;