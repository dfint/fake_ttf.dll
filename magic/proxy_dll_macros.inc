
macro transfer_call prefix*, funclist*
{
    match funcs,funclist \{ irp func,funcs
        \\{
            if ~ defined func | defined @f
            @@:
            func: jmp [prefix\\#func]
            end if
        \\}
    \}
}

macro myexport name*,funclist*
{
    match funcs,funclist \{ irp func,funcs
        \\{
            \\forward \\local newlist
                define newlist func,\\`func
            \\common
                match list,newlist \\\{ export name,list \\\}
                restore newlist
        \\}
    \}
}
macro myimport name*,prefix*,funclist*
{
    match funcs,funclist \{ irp func,funcs
    \\{
        \\forward \\local newlist
            define newlist prefix\\#func,\\`func
        \\common
            match list,newlist \\\{ import name,list \\\}
            restore newlist
    \\} \}
}