format PE GUI DLL

entry DllEntryPoint

include '../include/macro/proc32.inc'
include '../include/macro/import32.inc'
include '../include/macro/export.inc'
include '../include/macro/if.inc'

section '.text' code readable executable

proc DllEntryPoint hinstDLL, fwdReason, lpvReserved
    mov eax, 1
    ret
endp

label pwcText dword at esp + 8


TTF_RenderUNICODE_Blended:
    cinvoke ChangeText, [pwcText]
    .if eax <> 0
        mov [pwcText], eax
    .endif
    jmp [real_TTF_RenderUNICODE_Blended]


TTF_SizeUNICODE:
    cinvoke ChangeText, [pwcText]
    .if eax <> 0
        mov [pwcText], eax
    .endif
    jmp [real_TTF_SizeUNICODE]


include 'let_through.inc'


section '.idata' import data readable writeable

    library sdl_ttf, 'Real_ttf.dll',\
        changetext, 'ChangeText.dll'

    import changetext,\
        ChangeText, 'ChangeText'

    include 'real_ttf_imports.inc'

section '.edata' export data readable

    include 'fake_ttf_exports.inc'

section '.reloc' fixups data readable discardable
