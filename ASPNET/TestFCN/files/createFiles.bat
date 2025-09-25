@echo off
set loop=0

:loop
echo "Hello" > "%~dp0newfile%loop%.txt"
set /a loop=%loop%+1 
if "%loop%"=="100" goto next
goto loop

:next
echo End of file creation.