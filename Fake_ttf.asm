format PE GUI DLL

entry DllEntryPoint

include 'win32ax.inc'
include 'proxy_dll_macros.inc'

section '.text' code readable executable

proc DllEntryPoint hinstDLL,fdwReason,lpvReserved
    mov eax,TRUE
    ret
endp

include 'sdl_ttf_funcs.inc'

proc TTF_RenderUNICODE_Blended, _, pwcText
    cinvoke ChangeText, [pwcText]
    test eax, eax
    jz @f
    mov [pwcText], eax
@@:
    leave
    jmp dword [real_TTF_RenderUNICODE_Blended]
endp

proc TTF_SizeUNICODE, _, pwcText
    cinvoke ChangeText, [pwcText]
    test eax, eax
    jz @f
    mov [pwcText], eax
@@:
    leave
    jmp dword [real_TTF_SizeUNICODE]
endp

if defined TTF_RenderUNICODE_Blended
    display 'defined'
end if

transfer_call real_, sdl_ttf_funcs

section '.idata' import data readable writeable

library sdl_ttf, 'Real_ttf.dll',\
        changetext, 'ChangeText.dll'

import changetext,\
        ChangeText, 'ChangeText'

myimport sdl_ttf, real_, sdl_ttf_funcs

section '.edata' export data readable

myexport 'SDL_ttf.dll', sdl_ttf_funcs

section '.reloc' fixups data discardable
