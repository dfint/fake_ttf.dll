format PE64 GUI DLL

entry DllEntryPoint

include '../include/macro/proc64.inc'
include '../include/macro/import64.inc'
include '../include/macro/export.inc'
include '../include/macro/if.inc'

section '.text' code readable executable

proc DllEntryPoint hinstDLL, fwdReason, lpvReserved
    mov rax, 1
    ret
endp

; subst_text du "Test",0

macro _ChangeText {
    mov [rsp+0x08], rcx
    mov [rsp+0x10], rdx
    mov [rsp+0x18], r8

    cinvoke ChangeText, rdx
    ; mov rax, subst_text

    mov rcx, [rsp+0x08]
    mov rdx, [rsp+0x10]
    mov r8, [rsp+0x18]

    .if rax <> 0
        mov rdx, rax
    .endif
}

TTF_RenderUNICODE_Blended:
    _ChangeText
    jmp [real_TTF_RenderUNICODE_Blended]


TTF_SizeUNICODE:
    _ChangeText
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
