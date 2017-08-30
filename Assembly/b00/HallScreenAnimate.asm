; Super Mario All-Stars   (U) disassembly                        ;
; Disassembled by Roy and Ersanio and imamelia and wiiqwertyuiop ;
;                                                                ;
; Commenting and organization by SWR                             ;
;                                                                ;
; Code for Hall Screen animations goes here.                     ;

;-------Mario looks at player after timer finishes in Hall Screen
CODE_00B62B:        PHB                       ;Push program bank
                    PHK                       ;\Program bank = data bank
                    PLB                       ;/
                    LDA.w $0211               ;\
                    BEQ   .end                ; |Wait for "Mario looks at you" timer
                    DEC.w $0211               ; |to end
                    BNE   .end                ;/
                    JSR.w CODE_00B925         ;Mario looks at the player in Hall Screen
                    INC.b $DE                 ;
.end                PLB                       ;Recover program bank
                    RTS                       ;

;-------Animate BG1 tilemap for Hall Screen
CODE_00B63F:        PHB                       ;Push data bank
                    PHK                       ;\Set data bank to program bank
                    PLB                       ;/
                    DEC.w $020E               ;\Wait timer until next animation for below selected tiles
                    BNE   +                   ;/
                    JSR.w CODE_00B6DA         ;Animate Luigi's right hand
                    JSR.w CODE_00B748         ;Animate Toad
                    JSR.w CODE_00B7BD         ;Animate Birdo's tail
                    JSR.w CODE_00B88C         ;Animate Pidgit
                    JSR.w CODE_00B8B5         ;Animate Mario's head and left hand
                    LDA.b #$09                ;\Reset wait timer until next animation for above selected tiles
                    STA.w $020E               ;/
                    STA.b $DE                 ;Set "tilemap animation" flag to nonzero
+                   DEC.w $0210               ;\Wait timer until next animation for below selected tiles
                    BNE   +                   ;/
                    JSR.w CODE_00B6B9         ;Animate Luigi's head
                    JSR.w CODE_00B970         ;Animate Bowser's left arm
                    LDA.b #$10                ;\Reset wait timer until next animation for above selected tiles
                    STA.w $0210               ;/
                    STA.b $DE                 ;Set "tilemap animation" flag to nonzero
+                   DEC.w $0211               ;\Wait timer until next animation for below selected tiles
                    BNE   .end                ;/
                    JSR.w CODE_00B723         ;Animate Peach's head
                    JSR.w CODE_00B79C         ;Animate Birdo's right arm
                    LDA.b #$20                ;\Reset wait timer until next animation for above selected tiles
                    STA.w $0211               ;/
                    STA.b $DE                 ;Set "tilemap animation" flag to nonzero
.end                PLB                       ;Recover data bank
                    RTS                       ;

;-------Initialize BG1 tilemap for Hall Screen
CODE_00B683:        PHB                       ;Push data bank
                    PHK                       ;\Data bank = Program bank
                    PLB                       ;/
                    REP   #$30                ;16-bit AXY
                    LDX.w #DATA_3C8000        ;\
                    LDY.w #$0000              ; |Upload BG1 tilemap for Hall Screen
                    LDA.w #$07FF              ; |src: $3C:8000, dest: $7F:0000, size: 0x800 bytes
                    MVN   $7F,DATA_3C8000>>$10;/
                    SEP   #$30                ;8-bit AXY
                    PLB                       ;Recover data bank
                    LDA.b #$0B                ;\
                    STA.w $020E               ; |Set initial number of wait frames for animating
                    LDA.b #$08                ; |certain tiles in the BG1 tilemap of the hall
                    STA.w $020F               ; |screen. Go to CODE_00B63F to see which timers
                    LDA.b #$10                ; |affect which tiles.
                    STA.w $0210               ; |
                    LDA.b #$20                ; |
                    STA.w $0211               ;/
                    LDA.b #$01                ;\Set "Animate BG1 tilemap" flag
                    STA.b $DE                 ;/
                    STZ.w $0212               ;[]Possibly unused animation timer
                    LDA.b #$60                ;\
                    STA.b $22                 ;/Set wait timer for shine effect across ALL-STARS logo
                    STZ.b $23                 ;Initialize shine state of logo
                    RTS                       ;

;-------Animate Luigi's head in Hall Screen.
CODE_00B6B9:        LDA.b #DATA_00B9D1>>$10   ;\Bank byte of animated tilemaps address
                    STA.b $02                 ;/
                    REP   #$30                ;16-bit AXY
                    LDA.w $0200               ;\
                    AND.w #$0003              ; |Get pointer for animated tilemaps data
                    ASL   A                   ; |depending on which frame it should be on
                    TAX                       ; |
                    LDA.w PNTR_00B705,x       ; |
                    STA.b $00                 ;/
                    LDA.w #$03A6              ;\Set location of tilemap section to be animated
                    STA.b $04                 ;/
                    JSR.w CODE_00B9AB         ;Upload animated tiles to BG1 tilemap mirror
                    SEP   #$30                ;8-bit AXY
                    INC.w $0200               ;Go to next animation frame for this tilemap section
                    RTS                       ;

;-------Animate Luigi's right hand in the Hall Screen.
CODE_00B6DA:        LDA.b #DATA_00B9D1>>$10   ;\Bank byte of animated tilemaps address
                    STA.b $02                 ;/
                    REP   #$30                ;16-bit AXY
                    LDA.w $0201               ;\
                    AND.w #$00FF              ; |Get pointer for animated tilemaps data
                    ASL   A                   ; |depending on which frame it should be on
                    TAX                       ; |
                    LDA.w PNTR_00B70D,x       ; |
                    STA.b $00                 ;/
                    LDA.w #$0464              ;\Set location of tilemap section to be animated
                    STA.b $04                 ;/
                    JSR.w CODE_00B9AB         ;Upload animated tiles to BG1 tilemap mirror
                    SEP   #$30                ;8-bit AXY
                    INC.w $0201               ;\
                    LDA.w $0201               ; |
                    CMP.b #$0B                ; |Go to next animation frame for this tilemap section
                    BCC   .end                ; |
                    STZ.w $0201               ;/
.end                RTS                       ;

;-------Pointer to animated tilemap data for Luigi's head in Hall Screen
PNTR_00B705:        dw DATA_00B9D1,DATA_00B9F5,DATA_00BA19,DATA_00B9F5 ;

;-------Pointer to animated tilemap data for Luigi's right hand in Hall Screen
PNTR_00B70D:        dw DATA_00BA3D,DATA_00BA3D,DATA_00BA4D,DATA_00BA4D ;
                    dw DATA_00BA4D,DATA_00BA4D,DATA_00BA5D,DATA_00BA4D ;
                    dw DATA_00BA4D,DATA_00BA4D,DATA_00BA4D ;

;-------Animate Peach's head in the Hall Screen.
CODE_00B723:        LDA.b #DATA_00B9D1>>$10   ;\Bank byte of animated tilemaps address
                    STA.b $02                 ;/
                    REP   #$30                ;16-bit AXY
                    LDA.w $0202               ;\
                    AND.w #$0001              ; |Get pointer for animated tilemaps data
                    ASL   A                   ; |depending on which frame it should be on
                    TAX                       ; |
                    LDA.w PNTR_00B744,x       ; |
                    STA.b $00                 ;/
                    LDA.w #$0392              ;\Set location of tilemap section to be animated
                    STA.b $04                 ;/
                    JSR.w CODE_00B9AB         ;Upload animated tiles to BG1 tilemap mirror
                    SEP   #$30                ;8-bit AXY
                    INC.w $0202               ;Go to next animation frame for this tilemap section
                    RTS                       ;

;-------Pointer to animated tilemap data for Peach's head in Hall Screen
PNTR_00B744:        dw DATA_00BA6D,DATA_00BA8B

;-------Animate Toad in the Hall Screen.
CODE_00B748:        LDA.b #DATA_00B9D1>>$10   ;\Bank byte of animated tilemaps address
                    STA.b $02                 ;/
                    REP   #$30                ;16-bit AXY
                    LDA.w $0203               ;\
                    AND.w #$0001              ; |Get pointer for animated tilemaps data
                    ASL   A                   ; |depending on which frame it should be on
                    TAX                       ; |
                    LDA.w PNTR_00B769,x       ; |
                    STA.b $00                 ;/
                    LDA.w #$04EC              ;\Set location of tilemap section to be animated
                    STA.b $04                 ;/
                    JSR.w CODE_00B9AB         ;Upload animated tiles to BG1 tilemap mirror
                    SEP   #$30                ;8-bit AXY
                    INC.w $0203               ;Go to next animation frame for this tilemap section
                    RTS                       ;

;-------Pointer to animated tilemap data for Toad in Hall Screen
PNTR_00B769:        dw DATA_00BAA9,DATA_00BAE3

;-------Animate Birdo's eyes during the Hall Screen
;--------This routine is never called, possibly because it
;--------wouldn't be visible for many frames
CODE_00B76D:        LDA.b #DATA_00B9D1>>$10   ;\Bank byte of animated tilemaps address
                    STA.b $02                 ;/
                    REP   #$30                ;16-bit AXY
                    LDA.w $0204               ;\
                    AND.w #$0003              ; |Get pointer for animated tilemaps data
                    ASL   A                   ; |depending on which frame it should be on
                    TAX                       ; |
                    LDA.w PNTR_00B7DE,x       ; |
                    STA.b $00                 ;/
                    LDA.w #$0476              ;\Set location of tilemap section to be animated
                    STA.b $04                 ;/
                    JSR.w CODE_00B9AB         ;Upload animated tiles to BG1 tilemap mirror
                    SEP   #$30                ;8-bit AXY
                    INC.w $0204               ;\
                    LDA.w $0204               ; |
                    AND.b #$0F                ; |Go to next animation frame for this tilemap section
                    CMP.b #$03                ; |
                    BNE   .end                ;/
                    LDA.b #$80                ;\[?]
                    STA.w $0204               ;/
.end                RTS                       ;

;-------Animate Birdo's right arm in the Hall Screen.
CODE_00B79C:        LDA.b #DATA_00B9D1>>$10   ;\Bank byte of animated tilemaps address
                    STA.b $02                 ;/
                    REP   #$30                ;16-bit AXY
                    LDA.w $0205               ;\
                    AND.w #$0001              ; |Get pointer for animated tilemaps data
                    ASL   A                   ; |depending on which frame it should be on
                    TAX                       ; |
                    LDA.w PNTR_00B7E4,x       ; |
                    STA.b $00                 ;/
                    LDA.w #$04B4              ;\Set location of tilemap section to be animated
                    STA.b $04                 ;/
                    JSR.w CODE_00B9AB         ;Upload animated tiles to BG1 tilemap mirror
                    SEP   #$30                ;8-bit AXY
                    INC.w $0205               ;Go to next animation frame for this tilemap section
                    RTS                       ;

;-------Animate Birdo's tail in the Hall Screen.
CODE_00B7BD:        LDA.b #DATA_00B9D1>>$10   ;\Bank byte of animated tilemaps address
                    STA.b $02                 ;/
                    REP   #$30                ;16-bit AXY
                    LDA.w $0206               ;\
                    AND.w #$0003              ; |Get pointer for animated tilemaps data
                    ASL   A                   ; |depending on which frame it should be on
                    TAX                       ; |
                    LDA.w PNTR_00B7E8,x       ; |
                    STA.b $00                 ;/
                    LDA.w #$04FA              ;\Set location of tilemap section to be animated
                    STA.b $04                 ;/
                    JSR.w CODE_00B9AB         ;Upload animated tiles to BG1 tilemap mirror
                    SEP   #$30                ;8-bit AXY
                    INC.w $0206               ;Go to next animation frame for this tilemap section
                    RTS                       ;

;-------Pointer to animated tilemap data for Birdo's eyes in Hall Screen
PNTR_00B7DE:        dw DATA_00BB1D,DATA_00BB29,DATA_00BB1D

;-------Pointer to animated tilemap data for Birdo's right arm in Hall Screen
PNTR_00B7E4:        dw DATA_00BB35,DATA_00BB45

;-------Pointer to animated tilemap data for Birdo's tail in Hall Screen
PNTR_00B7E8:        dw DATA_00BB55,DATA_00BB67,DATA_00BB79,DATA_00BB8B

;-------Animate Goomba's head during the Hall Screen
;--------This routine is never called, possibly because it
;--------wouldn't be visible for many frames
CODE_00B7F0:        LDA.b #DATA_00B9D1>>$10   ;\Bank byte of animated tilemaps address
                    STA.b $02                 ;/
                    REP   #$30                ;16-bit AXY
                    LDA.w $0207               ;\
                    AND.w #$0003              ; |Get pointer for animated tilemaps data
                    ASL   A                   ; |depending on which frame it should be on
                    TAX                       ; |
                    LDA.w PNTR_00B81F,x       ; |
                    STA.b $00                 ;/
                    LDA.w #$054E              ;\Set location of tilemap section to be animated
                    STA.b $04                 ;/
                    JSR.w CODE_00B9AB         ;Upload animated tiles to BG1 tilemap mirror
                    SEP   #$30                ;8-bit AXY
                    INC.w $0207               ;\
                    LDA.w $0207               ; |
                    AND.b #$0F                ; |Go to next animation frame for this tilemap section
                    CMP.b #$03                ; |
                    BNE   .end                ;/
                    LDA.b #$80                ;\[?]
                    STA.w $0207               ;/
.end                RTS                       ;

;-------Pointer to animated tilemap data for Goomba's head in Hall Screen
PNTR_00B81F:        dw DATA_00BB9D,DATA_00BBAB,DATA_00BB9D

;-------Animate Bob-omb's fuse during the Hall Screen
;--------This routine is never called, possibly because it
;--------wouldn't be visible for many frames
CODE_00B825:        LDA.b #DATA_00B9D1>>$10   ;\Bank byte of animated tilemaps address
                    STA.b $02                 ;/
                    REP   #$30                ;16-bit AXY
                    LDA.w $0208               ;\
                    AND.w #$0003              ; |Get pointer for animated tilemaps data
                    ASL   A                   ; |depending on which frame it should be on
                    TAX                       ; |
                    LDA.w PNTR_00B852,x       ; |
                    STA.b $00                 ;/
                    LDA.w #$0544              ;\Set location of tilemap section to be animated
                    STA.b $04                 ;/
                    JSR.w CODE_00B9AB         ;Upload animated tiles to BG1 tilemap mirror
                    SEP   #$30                ;8-bit AXY
                    INC.w $0208               ;\
                    LDA.w $0208               ; |
                    AND.b #$04                ; |Go to next animation frame for this tilemap section
                    BEQ   .end                ;/
                    LDA.b #$80                ;\[?]
                    STA.w $0208               ;/
.end                RTS                       ;

;-------Pointer to animated tilemap data for Bob-omb's fuse in Hall Screen
PNTR_00B852:        dw DATA_00BBB9,DATA_00BBBF,DATA_00BBC5,DATA_00BBB9

;-------Animate Spiney's head during the Hall Screen
;--------This routine is never called, possibly because it
;--------wouldn't be visible for many frames
CODE_00B85A:        LDA.b #DATA_00B9D1>>$10   ;\Bank byte of animated tilemaps address
                    STA.b $02                 ;/
                    REP   #$30                ;16-bit AXY
                    LDA.w $0209               ;\
                    AND.w #$0001              ; |Get pointer for animated tilemaps data
                    ASL   A                   ; |depending on which frame it should be on
                    TAX                       ; |
                    LDA.w PNTR_00B888,x       ; |
                    STA.b $00                 ;/
                    LDA.w #$0672              ;\Set location of tilemap section to be animated
                    STA.b $04                 ;/
                    JSR.w CODE_00B9AB         ;Upload animated tiles to BG1 tilemap mirror
                    SEP   #$30                ;8-bit AXY
                    LDA.w $0209               ;\
                    BEQ   +                   ; |
                    LDA.w $0209               ; |Go to next animation frame for this tilemap section
                    ORA.b #$80                ; |
                    STA.w $0209               ;/
+                   INC.w $0209               ;
                    RTS                       ;

;-------Pointer to animated tilemap data for Spiney's head in Hall Screen
PNTR_00B888:        dw DATA_00BBCB,DATA_00BBD1

;-------Animate Pidgit in the Hall Screen.
CODE_00B88C:        LDA.b #DATA_00B9D1>>$10   ;\Bank byte of animated tilemaps address
                    STA.b $02                 ;/
                    REP   #$30                ;16-bit AXY
                    LDA.w $020A               ;\
                    AND.w #$0003              ; |Get pointer for animated tilemaps data
                    ASL   A                   ; |depending on which frame it should be on
                    TAX                       ; |
                    LDA.w PNTR_00B8AD,x       ; |
                    STA.b $00                 ;/
                    LDA.w #$00B2              ;\Set location of tilemap section to be animated
                    STA.b $04                 ;/
                    JSR.w CODE_00B9AB         ;Upload animated tiles to BG1 tilemap mirror
                    SEP   #$30                ;8-bit AXY
                    INC.w $020A               ;Go to next animation frame for this tilemap section
                    RTS                       ;

;-------Pointer to animated tilemap data for Pidgit in Hall Screen
PNTR_00B8AD:        dw DATA_00BBD7,DATA_00BC01,DATA_00BC2B,DATA_00BC55

;-------Animate Mario's head and left hand in the Hall Screen.
CODE_00B8B5:        LDA.b #DATA_00B9D1>>$10   ;\Bank byte of animated tilemaps address
                    STA.b $02                 ;/
                    REP   #$30                ;16-bit AXY
                    LDA.w $020B               ;\
                    AND.w #$000F              ; |Get pointer for animated tilemaps data
                    ASL   A                   ; |depending on which frame it should be on
                    TAX                       ; |
                    LDA.w PNTR_00B938,x       ; |
                    STA.b $00                 ;/
                    LDA.w #$0458              ;\Set location of tilemap section to be animated
                    STA.b $04                 ;/
                    JSR.w CODE_00B9AB         ;Upload animated tiles for Mario's face to BG1 tilemap mirror
                    LDA.w PNTR_00B94C,x       ;\Get pointer for animated tilemaps data
                    STA.b $00                 ;/depending on which frame it should be on
                    LDA.w #$041A              ;\Set location of tilemap section to be animated
                    STA.b $04                 ;/
                    JSR.w CODE_00B9AB         ;Upload animated tiles for Mario's hat to BG1 tilemap mirror
                    SEP   #$30                ;8-bit AXY
                    LDA.w $020B               ;\
                    BNE   +                   ; |Animate Mario's left arm on frame 0
                    JSR.w +++                 ;/
                    STZ.w $020C               ;Clear left arm animation index
                    BRA   ++                  ;

+                   CMP.b #$06                ;\
                    BCC   ++                  ; |Animate Mario's left arm on frame 6
                    JSR.w +++                 ;/
++                  INC.w $020B               ;\
                    LDA.w $020B               ; |
                    CMP.b #$0A                ; |Reset counter after 10 (0x0A) frames
                    BCC   +                   ; |
                    STZ.w $020B               ;/
+                   RTS                       ;

+++                 REP   #$30                ;16-bit AXY
                    LDA.w $020C               ;\
                    AND.w #$0003              ; |Get frame index for Mario's left arm
                    ASL   A                   ; |
                    TAX                       ;/
                    LDA.w DATA_00B960,x       ;\Upload animated tiles for the base of
                    STA.l $7F0000+$51E        ;/Mario's left arm
                    LDA.w PNTR_00B968,x       ;\Get pointer for animated tilemaps data
                    STA.b $00                 ;/depending on which frame it should be on
                    LDA.w #$04A0              ;\Set location of tilemap section to be animated
                    STA.b $04                 ;/
                    JSR.w CODE_00B9AB         ;Upload animated tiles for Mario's hat to BG1 tilemap mirror
                    SEP   #$30                ;8-bit AXY
                    INC.w $020C               ;Go to next animation frame for this tilemap section
                    RTS                       ;

;-------Mario looks at the player in Hall Screen
CODE_00B925:        REP   #$30                ;16-bit AXY
                    LDA.w #$01B0              ;\
                    STA.l $7F0000+$45C        ; |Alter BG1 tilemap to have Mario look at the player
                    LDA.w #$01C0              ; |
                    STA.l $7F0000+$49C        ;/
                    SEP   #$30                ;8-bit AXY
                    RTS                       ;

;-------Pointer to animated tilemap data for Mario's face in Hall Screen
PNTR_00B938:        dw DATA_00BC7F,DATA_00BC9D,DATA_00BCBB,DATA_00BC9D
                    dw DATA_00BC7F,DATA_00BC9D,DATA_00BCBB,DATA_00BCD9
                    dw DATA_00BCD9,DATA_00BCD9

;-------Pointer to animated tilemap data for Mario's hat in Hall Screen
PNTR_00B94C:        dw DATA_00BCF7,DATA_00BCFF,DATA_00BD07,DATA_00BCFF
                    dw DATA_00BCF7,DATA_00BCFF,DATA_00BD07,DATA_00BD0F
                    dw DATA_00BD0F,DATA_00BD0F

;-------Animated tilemap data for base of Mario's arm in Hall Screen
DATA_00B960:        dw $007F,$01D4,$01D4,$01D4

;-------Pointer to animated tilemap data for Mario's left arm in Hall Screen
PNTR_00B968:        dw DATA_00BD17,DATA_00BD25,DATA_00BD25,DATA_00BD25

;-------Animates Bowser's left arm in Hall Screen.
CODE_00B970:        LDA.b #DATA_00B9D1>>$10   ;\Bank byte of animated tilemaps address
                    STA.b $02                 ;/
                    REP   #$30                ;16-bit AXY
                    LDA.w $020D               ;\
                    AND.w #$00FF              ; |Get pointer for animated tilemaps data
                    ASL   A                   ; |depending on which frame it should be on
                    TAX                       ; |
                    LDA.w PNTR_00B99B,x       ; |
                    STA.b $00                 ;/
                    LDA.w #$040E              ;\Set location of tilemap section to be animated
                    STA.b $04                 ;/
                    JSR.w CODE_00B9AB         ;Upload animated tiles to BG1 tilemap mirror
                    SEP   #$30                ;8-bit AXY
                    INC.w $020D               ;\
                    LDA.w $020D               ; |
                    CMP.b #$08                ; |Go to next animation frame for this tilemap section
                    BCC   .end                ; |
                    STZ.w $020D               ;/
.end                RTS                       ;

;-------Pointer to animated tilemap data for Bowser's left arm in Hall Screen
PNTR_00B99B:        dw DATA_00BD33,DATA_00BD33,DATA_00BD33,DATA_00BD51
                    dw DATA_00BD6F,DATA_00BD6F,DATA_00BD6F,DATA_00BD51

;-------The tile animator in the Hall Screen when dark
CODE_00B9AB:        PHX                       ;\Push X and Y registers
                    PHY                       ;/
                    LDY.w #$0000              ;Initialize Y index
-                   LDX.b $04                 ;Initialize X index to tilemap start location
--                  LDA.b [$00],y             ;Read tilemap data
                    BEQ   +                   ;Go to next row in tilemap once #$0000 is read
                    BMI   ++                  ;End once #$FFFF is read
                    STA.l $7F0000,x           ;Store data to tilemap mirror
                    INX                       ;\Increment tilemap destination index
                    INX                       ;/
                    INY                       ;\Increment tilemap source index
                    INY                       ;/
                    BRA   --                  ;loop for next tile

+                   INY                       ;\Increment tilemap source index
                    INY                       ;/
                    LDA.b $04                 ;\
                    CLC                       ; |Increment tilemap destination index
                    ADC.w #$0040              ; |to next row
                    STA.b $04                 ;/
                    BRA   -                   ;loop for next row

++                  PLY                       ;\Restore X and Y registers
                    PLX                       ;/
                    RTS                       ;

;-------Tilemap data for Luigi's head in Hall Screen
DATA_00B9D1:        dw $01D6,$01D7,$01D8,$0000
                    dw $01D9,$01DA,$01DB,$01DC,$0000
                    dw $01DD,$01DE,$01DF,$0240,$0000
                    dw $01E0,$01E1,$01E2,$FFFF

DATA_00B9F5:        dw $0111,$0112,$0113,$0000
                    dw $0121,$0122,$0123,$0124,$0000
					dw $0106,$0107,$0108,$0109,$0000
                    dw $0116,$0117,$0118,$FFFF

DATA_00BA19:        dw $01E3,$01E4,$01E5,$0000
                    dw $01E6,$01E7,$01E8,$01E9,$0000
					dw $01EA,$01EB,$01EC,$01ED,$0000
					dw $01EE,$01EF,$01F0,$FFFF

;-------Tilemap data for Luigi's right hand in Hall Screen
DATA_00BA3D:		dw $0115,$0000
                    dw $0125,$0126,$0000
					dw $0105,$010A,$FFFF

DATA_00BA4D:		dw $01F1,$0000
                    dw $01F2,$01F3,$0000
					dw $01F4,$01F5,$FFFF

DATA_00BA5D:		dw $01F6,$0000
                    dw $01F7,$01F8,$0000
					dw $01F9,$01FA,$FFFF

;-------Tilemap data for Peach's head in Hall Screen
DATA_00BA6D:		dw $0019,$001A,$001B,$001C,$0000
					dw $0029,$002A,$002B,$002C,$0000
                    dw $0039,$003A,$003B,$003C,$FFFF

DATA_00BA8B:		dw $021A,$021B,$021C,$021D,$0000
					dw $021E,$021F,$0220,$0221,$0000
					dw $0222,$0223,$0224,$0225,$FFFF

;-------Tilemap data for Toad in Hall Screen
DATA_00BAA9:		dw $010D,$010E,$010F,$0131,$0000
					dw $011D,$011E,$011F,$0141,$0000
					dw $012D,$012E,$012F,$0151,$0000
					dw $000D,$000E,$000F,$00E5,$0000
                    dw $001D,$001E,$001F,$00F4,$0000
					dw $002D,$002E,$002F,$FFFF

DATA_00BAE3:		dw $0200,$0201,$0202,$0203,$0000
					dw $0204,$0205,$0206,$0207,$0000
					dw $0208,$0209,$020A,$020B,$0000
                    dw $020C,$020D,$020E,$020F,$0000
					dw $0210,$0211,$0212,$0213,$0000
					dw $002D,$0214,$0215,$FFFF

;-------Tilemap data for Birdo's eyes in Hall Screen
DATA_00BB1D:		dw $0143,$0144,$0000
					dw $0153,$0154,$FFFF

DATA_00BB29:		dw $01AC,$01AD,$0000
					dw $0153,$01AE,$FFFF

;-------Tilemap data for Birdo's right arm in Hall Screen
DATA_00BB35:		dw $0152,$0000
                    dw $0136,$0137,$0000
					dw $0146,$0147,$FFFF

DATA_00BB45:		dw $019F,$0000
                    dw $01A0,$01A1,$0000
					dw $01A2,$01A3,$FFFF

;-------Tilemap data for Birdo's tail in Hall Screen
DATA_00BB55:		dw $0139,$013A,$0000
					dw $0149,$014A,$0000
                    dw $0159,$015A,$FFFF

DATA_00BB67:		dw $0139,$01A4,$0000
					dw $01A5,$01A6,$0000
					dw $0159,$01A7,$FFFF

DATA_00BB79:        dw $0139,$01A8,$0000
					dw $01A9,$01AA,$0000
					dw $0159,$01AB,$FFFF

DATA_00BB8B:		dw $0139,$01A4,$0000
                    dw $01A5,$01A6,$0000
					dw $0159,$01A7,$FFFF

;-------Tilemap data for Goomba's head in Hall Screen
DATA_00BB9D:		dw $0087,$0088,$0000
					dw $0097,$0098,$0099,$FFFF

DATA_00BBAB:		dw $01FB,$01FC,$0000
                    dw $01FD,$01FE,$01FF,$FFFF

;-------Tilemap data for Bob-omb's fuse in Hall Screen
DATA_00BBB9:        dw $0082,$0083,$FFFF

DATA_00BBBF:		dw $0216,$0217,$FFFF

DATA_00BBC5:		dw $0218,$0219,$FFFF

;-------Tilemap data for Spiney's head in Hall Screen
DATA_00BBCB:		dw $00F8,$00F9,$FFFF

DATA_00BBD1:        dw $023E,$023F,$FFFF

;-------Tilemap data for Pidgit in Hall Screen
DATA_00BBD7:		dw $015B,$015C,$015D,$0000
					dw $015E,$015F,$0160,$0161,$0000
                    dw $0162,$0163,$0164,$0165,$0166,$0000
					dw $0167,$0168,$0169,$016A,$016B,$FFFF

DATA_00BC01:		dw $016C,$016D,$016E,$0000
                    dw $016F,$0170,$0171,$0172,$0000
					dw $0173,$0174,$0175,$0176,$0177,$0000
					dw $0178,$0179,$017A,$017B,$017C,$FFFF

DATA_00BC2B:		dw $017D,$017E,$017F,$0000
					dw $0180,$0181,$0182,$0183,$0000
					dw $0184,$0185,$0186,$0187,$0188,$0000
                    dw $0189,$018A,$018B,$018C,$018D,$FFFF

DATA_00BC55:		dw $018E,$018F,$0190,$0000
					dw $0191,$0192,$0193,$0194,$0000
					dw $0195,$0196,$0197,$0198,$0199,$0000
					dw $019A,$019B,$019C,$019D,$019E,$FFFF

;-------Tilemap data for Mario's face in Hall Screen
DATA_00BC7F:		dw $004C,$004D,$004E,$004F,$0000
                    dw $005C,$005D,$005E,$005F,$0000
					dw $006C,$006D,$006E,$006F,$FFFF

DATA_00BC9D:		dw $01B4,$01B5,$01B6,$01B7,$0000
					dw $01B8,$01B9,$01BA,$01BB,$0000
                    dw $01BC,$01BD,$01BE,$01BF,$FFFF

DATA_00BCBB:		dw $01C4,$01C5,$01C6,$01C7,$0000
					dw $01C8,$01C9,$01CA,$01CB,$0000
					dw $01CC,$01CD,$01CE,$01CF,$FFFF

DATA_00BCD9:		dw $01C4,$01C5,$01C6,$01C7,$0000
					dw $01C8,$01C9,$01CA,$01D0,$0000
					dw $01CC,$01CD,$01CE,$01D2,$FFFF

;-------Tilemap data for Mario's hat in Hall Screen
DATA_00BCF7:		dw $003D,$003E,$003F,$FFFF

DATA_00BCFF:		dw $01B1,$01B2,$01B3,$FFFF

DATA_00BD07:		dw $01C1,$01C2,$01C3,$FFFF

DATA_00BD0F:		dw $01C1,$01C2,$01C3,$FFFF

;-------Tilemap data for Mario's left arm in Hall Screen
DATA_00BD17:		dw $0150,$0000
					dw $013B,$0104,$0000
                    dw $013C,$FFFF

DATA_00BD25:		dw $01D1,$0000
                    dw $01D3,$01D3,$0000
					dw $01D5,$FFFF

;-------Tilemap data for Bowser's left arm in Hall Screen
DATA_00BD33:		dw $0037,$0038,$0000
                    dw $0047,$0048,$0049,$0000
                    dw $0057,$0058,$0059,$0000
                    dw $0067,$0068,$0069,$FFFF

DATA_00BD51:        dw $0226,$0227,$0000
					dw $0228,$0229,$022A,$0000
					dw $022B,$022C,$022D,$0000
					dw $0067,$022F,$0230,$FFFF

DATA_00BD6F:		dw $0231,$0232,$0000
					dw $0233,$0234,$0235,$0000
					dw $0236,$0237,$0238,$0000
					dw $0067,$023A,$023B,$FFFF

;-------Add shine effect across "ALL-STARS" text in Hall Screen.
CODE_00BD8D:        LDA.b $22                 ;\Wait for delay timer until starting shine
                    BNE   ++++                ;/
                    LDA.b $23                 ;\
                    CMP.b #($000F-1)<<1       ; |End shine animation after 15 (0x0F) states
                    BEQ   +++                 ;/
                    LDA.b #$04                ;\Set number of frames for current shine state
                    STA.b $22                 ;/
                    PHB                       ;Push data bank
                    PHK                       ;\Data bank = Program bank
                    PLB                       ;/
                    REP   #$20                ;16-bit A
                    LDA.b $23                 ;\
                    AND.w #$00FF              ; |Set palette shine index
                    STA.b $04                 ;/
                    CMP.w #($0008-1)<<1       ;\Do different shine animation for first 8 frames
                    BCS   +                   ;/and for last 7 frames
                    LDA.w #($000F-1)<<1       ;\
                    SEC                       ; |The shine goes from right to left, so the
                    SBC.b $04                 ; |index must start at the end and move backwards
                    TAX                       ;/
                    LDY.b #$00                ;Initialize palette source index
-                   LDA.w DATA_00BE08,y       ;\Copy sprite palette data
                    STA.l $7F9200+$100,x      ;/
                    LDA.b $04                 ;\End loop once destination
                    BEQ   ++                  ;/index is zero.
                    DEC.b $04                 ;\Decrement to know when loop is done
                    DEC.b $04                 ;/
                    INX                       ;\Increment palette dest index
                    INX                       ;/
                    INY                       ;\Increment palette src index
                    INY                       ;/
                    BRA   -                   ;loop

+                   LDA.b $23                 ;\
                    AND.w #$00FF              ; |The shine goes from right to left, so the
                    SEC                       ; |index must start at the end and move backwards
                    SBC.w #($0007-1)<<1       ; |
                    TAY                       ;/
                    LDX.b #$00                ;Initialize palette dest index
-                   LDA.w DATA_00BE08,y       ;\Copy sprite palette data
                    STA.l $7F9200+$10E,x      ;/
                    INY                       ;\Increment palette src index
                    INY                       ;/
                    INX                       ;\Increment palette dest index
                    INX                       ;/
                    CPX.b #$08<<1             ;\Loop 8 times
                    BNE   -                   ;/
++                  INC.b $23                 ;\Increment to next shine state
                    INC.b $23                 ;/
                    INC.w $0AC0               ;Set "Update palette" flag
                    SEP   #$20                ;8-bit A
                    PLB                       ;Pull program bank
                    BRA   ++++                ;

+++                 REP   #$20                ;16-bit A
                    LDA.b $E3                 ;\
                    CMP.w $0225               ; |Wait to set next shine delay
                    BNE   +                   ;/
                    LDA.w #$00F0              ;\Set delay until next shine
                    STA.b $22                 ;/
                    STZ.b $23                 ;Reset shine state
+                   SEP   #$20                ;8-bit A
                    BRA   .end                ;

++++                DEC.b $22                 ;Decrement shine delay timer
.end                RTS                       ;

;-------Palette data for "All-Stars" text during shine effect
DATA_00BE08:        dw $1EDF,$435F,$5FBF,$7FFF
                    dw $5FBF,$435F,$1EDF,$025F
                    dw $025F,$025F,$025F,$025F
                    dw $025F,$025F,$025F