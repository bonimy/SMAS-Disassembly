; Super Mario All-Stars   (U) disassembly                        ;
; Disassembled by Roy and Ersanio and imamelia and wiiqwertyuiop ;

DATA_028000:
incbin MarioCoinGFX.bin  ;GFX for intro logo (Mario coin)

DATA_029000:
incbin TriangleGFX.bin   ;Triangle fading GFX (that last 0x400 bytes are never used or loaded)

DATA_02A000:
incbin NameTextGFX.bin   ;"Super Mario All-Stars" text in Hall Screen

DATA_02C000:
incbin HallTileMapBG2.bin;[?]BG2 Tilemap for Hall Screen and game select screen

DATA_02C800:
incbin HallPalette1.bin  ;Palette data during Hall Screen (blackout)

DATA_02CA00:
incbin HallPalette2.bin  ;Palette data during Hall Screen (lit up)

ORG $02F000
DATA_02F000:
incbin MenuTileMap.bin   ;"GAME SELECT" menu tilemap