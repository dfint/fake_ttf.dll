format ELF

section '.text' executable

label pwcText dword at esp+8

public TTF_ByteSwappedUNICOED
TTF_ByteSwappedUNICOED:
    jmp TTF_ByteSwappedUNICODE

public TTF_CloseFotn
TTF_CloseFotn:
    jmp TTF_CloseFont

public TTF_FontAscetn
TTF_FontAscetn:
    jmp TTF_FontAscent

public TTF_FontDescetn
TTF_FontDescetn:
    jmp TTF_FontDescent

public TTF_FontFaceFamilyNaem
TTF_FontFaceFamilyNaem:
    jmp TTF_FontFaceFamilyName

public TTF_FontFaceIsFixedWidht
TTF_FontFaceIsFixedWidht:
    jmp TTF_FontFaceIsFixedWidth

public TTF_FontFaceStyleNaem
TTF_FontFaceStyleNaem:
    jmp TTF_FontFaceStyleName

public TTF_FontFacse
TTF_FontFacse:
    jmp TTF_FontFaces

public TTF_FontHeigth
TTF_FontHeigth:
    jmp TTF_FontHeight

public TTF_FontLineSkpi
TTF_FontLineSkpi:
    jmp TTF_FontLineSkip

public TTF_GetFontHintign
TTF_GetFontHintign:
    jmp TTF_GetFontHinting

public TTF_GetFontKernign
TTF_GetFontKernign:
    jmp TTF_GetFontKerning

public TTF_GetFontOutlien
TTF_GetFontOutlien:
    jmp TTF_GetFontOutline

public TTF_GetFontStyel
TTF_GetFontStyel:
    jmp TTF_GetFontStyle

public TTF_GlyphIsProvidde
TTF_GlyphIsProvidde:
    jmp TTF_GlyphIsProvided

public TTF_GlyphMetrisc
TTF_GlyphMetrisc:
    jmp TTF_GlyphMetrics

public TTF_Inti
TTF_Inti:
    jmp TTF_Init

public TTF_Linked_Versino
TTF_Linked_Versino:
    jmp TTF_Linked_Version

public TTF_OpenFotn
TTF_OpenFotn:
    jmp TTF_OpenFont

public TTF_OpenFontIndxe
TTF_OpenFontIndxe:
    jmp TTF_OpenFontIndex

public TTF_OpenFontIndexWR
TTF_OpenFontIndexWR:
    jmp TTF_OpenFontIndexRW

public TTF_OpenFontWR
TTF_OpenFontWR:
    jmp TTF_OpenFontRW

public TTF_Quti
TTF_Quti:
    jmp TTF_Quit

public TTF_RenderGlyph_Blendde
TTF_RenderGlyph_Blendde:
    jmp TTF_RenderGlyph_Blended

public TTF_RenderGlyph_Shadde
TTF_RenderGlyph_Shadde:
    jmp TTF_RenderGlyph_Shaded

public TTF_RenderGlyph_Soldi
TTF_RenderGlyph_Soldi:
    jmp TTF_RenderGlyph_Solid

public TTF_RenderText_Blendde
TTF_RenderText_Blendde:
    jmp TTF_RenderText_Blended

public TTF_RenderText_Shadde
TTF_RenderText_Shadde:
    jmp TTF_RenderText_Shaded

public TTF_RenderText_Soldi
TTF_RenderText_Soldi:
    jmp TTF_RenderText_Solid

public TTF_RenderUNICODE_Blendde
TTF_RenderUNICODE_Blendde:
    push [pwcText]
    call ChangeText
    add esp, 4
    test eax, eax
    jz @f
    mov [pwcText], eax
@@:
    jmp TTF_RenderUNICODE_Blended

public TTF_RenderUNICODE_Shadde
TTF_RenderUNICODE_Shadde:
    jmp TTF_RenderUNICODE_Shaded

public TTF_RenderUNICODE_Soldi
TTF_RenderUNICODE_Soldi:
    jmp TTF_RenderUNICODE_Solid

public TTF_RenderUTF8_Blendde
TTF_RenderUTF8_Blendde:
    jmp TTF_RenderUTF8_Blended

public TTF_RenderUTF8_Shadde
TTF_RenderUTF8_Shadde:
    jmp TTF_RenderUTF8_Shaded

public TTF_RenderUTF8_Soldi
TTF_RenderUTF8_Soldi:
    jmp TTF_RenderUTF8_Solid

public TTF_SetFontHintign
TTF_SetFontHintign:
    jmp TTF_SetFontHinting

public TTF_SetFontKernign
TTF_SetFontKernign:
    jmp TTF_SetFontKerning

public TTF_SetFontOutlien
TTF_SetFontOutlien:
    jmp TTF_SetFontOutline

public TTF_SetFontStyel
TTF_SetFontStyel:
    jmp TTF_SetFontStyle

public TTF_SizeTetx
TTF_SizeTetx:
    jmp TTF_SizeText

public TTF_SizeUNICOED
TTF_SizeUNICOED:
    push [pwcText]
    call ChangeText
    add esp, 4
    test eax, eax
    jz @f
    mov [pwcText], eax
@@:
    jmp TTF_SizeUNICODE

public TTF_SizeUT8F
TTF_SizeUT8F:
    jmp TTF_SizeUTF8

public TTF_WasInti
TTF_WasInti:
    jmp TTF_WasInit

; Imports from the real libsdl_ttf
extrn TTF_ByteSwappedUNICODE
extrn TTF_CloseFont
extrn TTF_FontAscent
extrn TTF_FontDescent
extrn TTF_FontFaceFamilyName
extrn TTF_FontFaceIsFixedWidth
extrn TTF_FontFaceStyleName
extrn TTF_FontFaces
extrn TTF_FontHeight
extrn TTF_FontLineSkip
extrn TTF_GetFontHinting
extrn TTF_GetFontKerning
extrn TTF_GetFontOutline
extrn TTF_GetFontStyle
extrn TTF_GlyphIsProvided
extrn TTF_GlyphMetrics
extrn TTF_Init
extrn TTF_Linked_Version
extrn TTF_OpenFont
extrn TTF_OpenFontIndex
extrn TTF_OpenFontIndexRW
extrn TTF_OpenFontRW
extrn TTF_Quit
extrn TTF_RenderGlyph_Blended
extrn TTF_RenderGlyph_Shaded
extrn TTF_RenderGlyph_Solid
extrn TTF_RenderText_Blended
extrn TTF_RenderText_Shaded
extrn TTF_RenderText_Solid
extrn TTF_RenderUNICODE_Blended
extrn TTF_RenderUNICODE_Shaded
extrn TTF_RenderUNICODE_Solid
extrn TTF_RenderUTF8_Blended
extrn TTF_RenderUTF8_Shaded
extrn TTF_RenderUTF8_Solid
extrn TTF_SetFontHinting
extrn TTF_SetFontKerning
extrn TTF_SetFontOutline
extrn TTF_SetFontStyle
extrn TTF_SizeText
extrn TTF_SizeUNICODE
extrn TTF_SizeUTF8
extrn TTF_WasInit

; Import from the libchangetext.so
extrn ChangeText

