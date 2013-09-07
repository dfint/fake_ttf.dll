format PE GUI DLL

entry DllEntryPoint

include 'win32ax.inc'

section '.text' code readable executable

proc DllEntryPoint hinstDLL,fdwReason,lpvReserved
    mov eax,TRUE
    ret
endp

szCaption db 'TestCaption',0

proc TestFunc, message
    invoke MessageBox, 0, [message], szCaption, MB_OK
    ret
endp

include 'sdl_ttf_funcs.inc'

irp func, sdl_ttf_funcs {
func:
    jmp dword [real_#func]
}

; TTF_ByteSwappedUNICODE:
    ; jmp [real_TTF_ByteSwappedUNICODE]

TTF_RenderUNICODE_Blended:
.ttfFont    = 04h
.pwcharText = 08h
.sdlcolorFg = 10h
    invoke ChangeText, dword [esp+.pwcharText]
    test eax, eax
    jz @f
    mov [esp+.pwcharText], eax
@@:
    jmp real_TTF_RenderUNICODE_Blended ; [ttfFont], [pwcharText], [sdlcolorFg]

section '.idata' import data readable writeable

library sdl_ttf, 'Real_ttf.dll',\
        changetext, 'ChangeText.dll'

import changetext,\
    ChangeText, '?ChangeText@@YAPA_WPA_W@Z'; 'ChangeText'

include 'import_sdl_ttf.inc'

section '.edata' export data readable

include 'export_sdl_ttf.inc'

section '.reloc' fixups data discardable
