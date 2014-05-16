format PE GUI DLL

entry DllEntryPoint

include 'win32ax.inc'

section '.text' code readable executable

proc DllEntryPoint hinstDLL, fwdReason, lpvReserved
    mov eax, TRUE
    ret
endp

label pwcText dword at esp+8

TTF_ByteSwappedUNICODE:
    jmp dword [real_TTF_ByteSwappedUNICODE]

TTF_CloseFont:
    jmp dword [real_TTF_CloseFont]

TTF_FontAscent:
    jmp dword [real_TTF_FontAscent]

TTF_FontDescent:
    jmp dword [real_TTF_FontDescent]

TTF_FontFaceFamilyName:
    jmp dword [real_TTF_FontFaceFamilyName]

TTF_FontFaceIsFixedWidth:
    jmp dword [real_TTF_FontFaceIsFixedWidth]

TTF_FontFaceStyleName:
    jmp dword [real_TTF_FontFaceStyleName]

TTF_FontFaces:
    jmp dword [real_TTF_FontFaces]

TTF_FontHeight:
    jmp dword [real_TTF_FontHeight]

TTF_FontLineSkip:
    jmp dword [real_TTF_FontLineSkip]

TTF_GetFontHinting:
    jmp dword [real_TTF_GetFontHinting]

TTF_GetFontKerning:
    jmp dword [real_TTF_GetFontKerning]

TTF_GetFontOutline:
    jmp dword [real_TTF_GetFontOutline]

TTF_GetFontStyle:
    jmp dword [real_TTF_GetFontStyle]

TTF_GlyphIsProvided:
    jmp dword [real_TTF_GlyphIsProvided]

TTF_GlyphMetrics:
    jmp dword [real_TTF_GlyphMetrics]

TTF_Init:
    jmp dword [real_TTF_Init]

TTF_Linked_Version:
    jmp dword [real_TTF_Linked_Version]

TTF_OpenFont:
    jmp dword [real_TTF_OpenFont]

TTF_OpenFontIndex:
    jmp dword [real_TTF_OpenFontIndex]

TTF_OpenFontIndexRW:
    jmp dword [real_TTF_OpenFontIndexRW]

TTF_OpenFontRW:
    jmp dword [real_TTF_OpenFontRW]

TTF_Quit:
    jmp dword [real_TTF_Quit]

TTF_RenderGlyph_Blended:
    jmp dword [real_TTF_RenderGlyph_Blended]

TTF_RenderGlyph_Shaded:
    jmp dword [real_TTF_RenderGlyph_Shaded]

TTF_RenderGlyph_Solid:
    jmp dword [real_TTF_RenderGlyph_Solid]

TTF_RenderText_Blended:
    jmp dword [real_TTF_RenderText_Blended]

TTF_RenderText_Shaded:
    jmp dword [real_TTF_RenderText_Shaded]

TTF_RenderText_Solid:
    jmp dword [real_TTF_RenderText_Solid]

TTF_RenderUNICODE_Blended:
    cinvoke ChangeText, [pwcText]
    test eax, eax
    jz @f
    mov [pwcText], eax
@@:
    jmp dword [real_TTF_RenderUNICODE_Blended]

TTF_RenderUNICODE_Shaded:
    jmp dword [real_TTF_RenderUNICODE_Shaded]

TTF_RenderUNICODE_Solid:
    jmp dword [real_TTF_RenderUNICODE_Solid]

TTF_RenderUTF8_Blended:
    jmp dword [real_TTF_RenderUTF8_Blended]

TTF_RenderUTF8_Shaded:
    jmp dword [real_TTF_RenderUTF8_Shaded]

TTF_RenderUTF8_Solid:
    jmp dword [real_TTF_RenderUTF8_Solid]

TTF_SetFontHinting:
    jmp dword [real_TTF_SetFontHinting]

TTF_SetFontKerning:
    jmp dword [real_TTF_SetFontKerning]

TTF_SetFontOutline:
    jmp dword [real_TTF_SetFontOutline]

TTF_SetFontStyle:
    jmp dword [real_TTF_SetFontStyle]

TTF_SizeText:
    jmp dword [real_TTF_SizeText]

TTF_SizeUNICODE:
    cinvoke ChangeText, [pwcText]
    test eax, eax
    jz @f
    mov [pwcText], eax
@@:
    jmp dword [real_TTF_SizeUNICODE]

TTF_SizeUTF8:
    jmp dword [real_TTF_SizeUTF8]

TTF_WasInit:
    jmp dword [real_TTF_WasInit]

section '.idata' import data readable writeable

  library sdl_ttf, 'Real_ttf.dll',\
        changetext, 'ChangeText.dll'

  import changetext,\
        ChangeText, 'ChangeText'

  import sdl_ttf,\
    real_TTF_ByteSwappedUNICODE, 'TTF_ByteSwappedUNICODE',\
    real_TTF_CloseFont, 'TTF_CloseFont',\
    real_TTF_FontAscent, 'TTF_FontAscent',\
    real_TTF_FontDescent, 'TTF_FontDescent',\
    real_TTF_FontFaceFamilyName, 'TTF_FontFaceFamilyName',\
    real_TTF_FontFaceIsFixedWidth, 'TTF_FontFaceIsFixedWidth',\
    real_TTF_FontFaceStyleName, 'TTF_FontFaceStyleName',\
    real_TTF_FontFaces, 'TTF_FontFaces',\
    real_TTF_FontHeight, 'TTF_FontHeight',\
    real_TTF_FontLineSkip, 'TTF_FontLineSkip',\
    real_TTF_GetFontHinting, 'TTF_GetFontHinting',\
    real_TTF_GetFontKerning, 'TTF_GetFontKerning',\
    real_TTF_GetFontOutline, 'TTF_GetFontOutline',\
    real_TTF_GetFontStyle, 'TTF_GetFontStyle',\
    real_TTF_GlyphIsProvided, 'TTF_GlyphIsProvided',\
    real_TTF_GlyphMetrics, 'TTF_GlyphMetrics',\
    real_TTF_Init, 'TTF_Init',\
    real_TTF_Linked_Version, 'TTF_Linked_Version',\
    real_TTF_OpenFont, 'TTF_OpenFont',\
    real_TTF_OpenFontIndex, 'TTF_OpenFontIndex',\
    real_TTF_OpenFontIndexRW, 'TTF_OpenFontIndexRW',\
    real_TTF_OpenFontRW, 'TTF_OpenFontRW',\
    real_TTF_Quit, 'TTF_Quit',\
    real_TTF_RenderGlyph_Blended, 'TTF_RenderGlyph_Blended',\
    real_TTF_RenderGlyph_Shaded, 'TTF_RenderGlyph_Shaded',\
    real_TTF_RenderGlyph_Solid, 'TTF_RenderGlyph_Solid',\
    real_TTF_RenderText_Blended, 'TTF_RenderText_Blended',\
    real_TTF_RenderText_Shaded, 'TTF_RenderText_Shaded',\
    real_TTF_RenderText_Solid, 'TTF_RenderText_Solid',\
    real_TTF_RenderUNICODE_Blended, 'TTF_RenderUNICODE_Blended',\
    real_TTF_RenderUNICODE_Shaded, 'TTF_RenderUNICODE_Shaded',\
    real_TTF_RenderUNICODE_Solid, 'TTF_RenderUNICODE_Solid',\
    real_TTF_RenderUTF8_Blended, 'TTF_RenderUTF8_Blended',\
    real_TTF_RenderUTF8_Shaded, 'TTF_RenderUTF8_Shaded',\
    real_TTF_RenderUTF8_Solid, 'TTF_RenderUTF8_Solid',\
    real_TTF_SetFontHinting, 'TTF_SetFontHinting',\
    real_TTF_SetFontKerning, 'TTF_SetFontKerning',\
    real_TTF_SetFontOutline, 'TTF_SetFontOutline',\
    real_TTF_SetFontStyle, 'TTF_SetFontStyle',\
    real_TTF_SizeText, 'TTF_SizeText',\
    real_TTF_SizeUNICODE, 'TTF_SizeUNICODE',\
    real_TTF_SizeUTF8, 'TTF_SizeUTF8',\
    real_TTF_WasInit, 'TTF_WasInit'

section '.edata' export data readable

  export 'SDL_ttf.dll',\
    TTF_ByteSwappedUNICODE, 'TTF_ByteSwappedUNICODE',\
    TTF_CloseFont, 'TTF_CloseFont',\
    TTF_FontAscent, 'TTF_FontAscent',\
    TTF_FontDescent, 'TTF_FontDescent',\
    TTF_FontFaceFamilyName, 'TTF_FontFaceFamilyName',\
    TTF_FontFaceIsFixedWidth, 'TTF_FontFaceIsFixedWidth',\
    TTF_FontFaceStyleName, 'TTF_FontFaceStyleName',\
    TTF_FontFaces, 'TTF_FontFaces',\
    TTF_FontHeight, 'TTF_FontHeight',\
    TTF_FontLineSkip, 'TTF_FontLineSkip',\
    TTF_GetFontHinting, 'TTF_GetFontHinting',\
    TTF_GetFontKerning, 'TTF_GetFontKerning',\
    TTF_GetFontOutline, 'TTF_GetFontOutline',\
    TTF_GetFontStyle, 'TTF_GetFontStyle',\
    TTF_GlyphIsProvided, 'TTF_GlyphIsProvided',\
    TTF_GlyphMetrics, 'TTF_GlyphMetrics',\
    TTF_Init, 'TTF_Init',\
    TTF_Linked_Version, 'TTF_Linked_Version',\
    TTF_OpenFont, 'TTF_OpenFont',\
    TTF_OpenFontIndex, 'TTF_OpenFontIndex',\
    TTF_OpenFontIndexRW, 'TTF_OpenFontIndexRW',\
    TTF_OpenFontRW, 'TTF_OpenFontRW',\
    TTF_Quit, 'TTF_Quit',\
    TTF_RenderGlyph_Blended, 'TTF_RenderGlyph_Blended',\
    TTF_RenderGlyph_Shaded, 'TTF_RenderGlyph_Shaded',\
    TTF_RenderGlyph_Solid, 'TTF_RenderGlyph_Solid',\
    TTF_RenderText_Blended, 'TTF_RenderText_Blended',\
    TTF_RenderText_Shaded, 'TTF_RenderText_Shaded',\
    TTF_RenderText_Solid, 'TTF_RenderText_Solid',\
    TTF_RenderUNICODE_Blended, 'TTF_RenderUNICODE_Blended',\
    TTF_RenderUNICODE_Shaded, 'TTF_RenderUNICODE_Shaded',\
    TTF_RenderUNICODE_Solid, 'TTF_RenderUNICODE_Solid',\
    TTF_RenderUTF8_Blended, 'TTF_RenderUTF8_Blended',\
    TTF_RenderUTF8_Shaded, 'TTF_RenderUTF8_Shaded',\
    TTF_RenderUTF8_Solid, 'TTF_RenderUTF8_Solid',\
    TTF_SetFontHinting, 'TTF_SetFontHinting',\
    TTF_SetFontKerning, 'TTF_SetFontKerning',\
    TTF_SetFontOutline, 'TTF_SetFontOutline',\
    TTF_SetFontStyle, 'TTF_SetFontStyle',\
    TTF_SizeText, 'TTF_SizeText',\
    TTF_SizeUNICODE, 'TTF_SizeUNICODE',\
    TTF_SizeUTF8, 'TTF_SizeUTF8',\
    TTF_WasInit, 'TTF_WasInit'

section '.reloc' fixups data readable discardable
