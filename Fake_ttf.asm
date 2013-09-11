format PE GUI DLL

entry DllEntryPoint

include 'win32ax.inc'

section '.text' code readable executable

proc DllEntryPoint hinstDLL,fdwReason,lpvReserved
    mov eax,TRUE
    ret
endp

include 'sdl_ttf_funcs.inc'

irp func, sdl_ttf_funcs {
if func in <TTF_RenderUNICODE_Blended, TTF_SizeUNICODE>
    proc func, _, pwcText
        cinvoke ChangeText, [pwcText]
        test eax, eax
        jz @f
        mov [pwcText], eax
    @@:
        leave
    endp
else
    func:
end if
    jmp dword [real_#func]
}

; TTF_ByteSwappedUNICODE:
    ; jmp [real_TTF_ByteSwappedUNICODE]

section '.idata' import data readable writeable

library sdl_ttf, 'Real_ttf.dll',\
        changetext, 'ChangeText.dll'

import changetext,\
        ChangeText, 'ChangeText'

include 'import_sdl_ttf.inc'

section '.edata' export data readable

include 'export_sdl_ttf.inc'

section '.reloc' fixups data discardable
