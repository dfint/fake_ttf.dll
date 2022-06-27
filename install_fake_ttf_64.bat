@echo off

set fake_ttf=fake_ttf_64.dll

if not exist SDL_ttf.dll goto er0

if exist %fake_ttf% (
if not exist real_ttf.dll (
move /Y SDL_ttf.dll real_ttf.dll
if ERRORLEVEL 1 goto er1
)
move /Y %fake_ttf% SDL_ttf.dll
if ERRORLEVEL 1 goto er1
echo OK: %fake_ttf% installed/updated successfully
) else (
move /Y SDL_ttf.dll %fake_ttf%
if ERRORLEVEL 1 goto er1
move /Y real_ttf.dll SDL_ttf.dll
if ERRORLEVEL 1 goto er1
echo OK: %fake_ttf% UNinstalled successfully
)

pause
exit

:er0
echo Error: SDL_ttf.dll does not exist
pause
exit

:er1
echo Error: Ensure Dwarf Fortress is not running
pause
exit