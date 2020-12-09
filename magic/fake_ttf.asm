format PE GUI DLL

entry DllEntryPoint

include '../include/macro/proc32.inc'
include '../include/macro/import32.inc'
include '../include/macro/export.inc'


section '.text' code readable executable

proc DllEntryPoint hinstDLL,fdwReason,lpvReserved
    mov eax, 1
    ret
endp

label pwcText dword at esp + 8

TTF_RenderUNICODE_Blended:
    cinvoke ChangeText, [pwcText]
    test eax, eax
    jz @f
    mov [pwcText], eax
@@:
    jmp dword [real_TTF_RenderUNICODE_Blended]

TTF_SizeUNICODE:
    cinvoke ChangeText, [pwcText]
    test eax, eax
    jz @f
    mov [pwcText], eax
@@:
    jmp dword [real_TTF_SizeUNICODE]

include 'sdl_ttf_funcs.inc'
include 'proxy_dll_macros.inc'

transfer_call real_, sdl_ttf_funcs

section '.idata' import data readable writeable

library sdl_ttf, 'Real_ttf.dll',\
        changetext, 'ChangeText.dll'

import changetext,\
        ChangeText, 'ChangeText'

myimport sdl_ttf, real_, sdl_ttf_funcs

section '.edata' export data readable

myexport 'SDL_ttf.dll', sdl_ttf_funcs

section '.reloc' fixups data readable discardable
