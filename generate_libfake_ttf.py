sdl_ttf_functions = [
    'TTF_ByteSwappedUNICODE', 'TTF_CloseFont', 'TTF_FontAscent', 'TTF_FontDescent',
    'TTF_FontFaceFamilyName', 'TTF_FontFaceIsFixedWidth', 'TTF_FontFaceStyleName',
    'TTF_FontFaces', 'TTF_FontHeight', 'TTF_FontLineSkip', 'TTF_GetFontHinting',
    'TTF_GetFontKerning', 'TTF_GetFontOutline', 'TTF_GetFontStyle',
    'TTF_GlyphIsProvided', 'TTF_GlyphMetrics', 'TTF_Init', 'TTF_Linked_Version',
    'TTF_OpenFont', 'TTF_OpenFontIndex', 'TTF_OpenFontIndexRW', 'TTF_OpenFontRW',
    'TTF_Quit', 'TTF_RenderGlyph_Blended', 'TTF_RenderGlyph_Shaded',
    'TTF_RenderGlyph_Solid', 'TTF_RenderText_Blended', 'TTF_RenderText_Shaded',
    'TTF_RenderText_Solid', 'TTF_RenderUNICODE_Blended', 'TTF_RenderUNICODE_Shaded',
    'TTF_RenderUNICODE_Solid', 'TTF_RenderUTF8_Blended', 'TTF_RenderUTF8_Shaded',
    'TTF_RenderUTF8_Solid', 'TTF_SetFontHinting', 'TTF_SetFontKerning',
    'TTF_SetFontOutline', 'TTF_SetFontStyle', 'TTF_SizeText', 'TTF_SizeUNICODE',
    'TTF_SizeUTF8', 'TTF_WasInit'
]

print('''format ELF

section '.text' executable

label pwcText dword at esp+8
''')

proc_body = '''    push [pwcText]
    call ChangeText
    add esp, 4
    test eax, eax
    jz @f
    mov [pwcText], eax
@@:'''

modified_procedures = {'TTF_RenderUNICODE_Blended', 'TTF_SizeUNICODE'}

for proc_name in sdl_ttf_functions:
    mangled_proc_name = proc_name[:-2] + proc_name[-1] + proc_name[-2]
    print('public %s' % mangled_proc_name)
    print(mangled_proc_name+':')
    if proc_name in modified_procedures:
        print(proc_body)
    print('    jmp '+proc_name)
    print()

print('''; Imports from the real libsdl_ttf''')

for proc_name in sdl_ttf_functions:
    print("extrn %s" % proc_name)

print('''
; Import from the libchangetext.so
extrn ChangeText
''')