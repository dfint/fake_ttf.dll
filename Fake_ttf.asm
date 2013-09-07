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

proc TTF_RenderUNICODE_Blended, ttfFont, pwcharText, sdlcolorFg
    invoke real_TTF_RenderUNICODE_Blended, [ttfFont], [pwcharText], [sdlcolorFg]
    ret
endp

section '.idata' import data readable writeable

library user, 'USER32.DLL',\
       sdl_ttf, 'Real_ttf.dll'

import user,\
    MessageBox,'MessageBoxA'

; import kernel,\
    ; GetLastError,'GetLastError',\
    ; SetLastError,'SetLastError',\
    ; FormatMessage,'FormatMessageA',\
    ; LocalFree,'LocalFree'


include 'import_sdl_ttf.inc'

section '.edata' export data readable

include 'export_sdl_ttf.inc'

section '.reloc' fixups data discardable
