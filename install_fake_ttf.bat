@echo off

if not exist SDL_ttf.dll goto er0

if exist Fake_ttf.dll (
if not exist Real_ttf.dll (
move /Y SDL_ttf.dll Real_ttf.dll
if ERRORLEVEL 1 goto er1
)
move /Y Fake_ttf.dll SDL_ttf.dll
if ERRORLEVEL 1 goto er1
echo OK: Fake_ttf.dll installed/updated successfully
echo Fake_ttf.dll �ᯥ譮 ��⠭�����/��������
) else (
move /Y SDL_ttf.dll Fake_ttf.dll
if ERRORLEVEL 1 goto er1
move /Y Real_ttf.dll SDL_ttf.dll
if ERRORLEVEL 1 goto er1
echo OK: Fake_ttf.dll UNinstalled successfully
echo Fake_ttf.dll �ᯥ譮 �⪫�祭
)

pause
exit

:er0
echo Error: SDL_ttf.dll does not exist
echo SDL_ttf.dll ���������
pause
exit

:er1
echo Error: Ensure Dwarf Fortress is not running
echo ��������, �� Dwarf Fortress �� ����饭
pause
exit