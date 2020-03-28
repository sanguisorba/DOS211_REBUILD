@echo off
rem
rem MASM here is MASM 4.00
rem LINK is from Visual C++ 1.52
rem
link @doslink
if errorlevel 1 goto end
exe2bin msdos.exe msdos.sys
if errorlevel 1 goto end
fc /b /m0 msdos.0 msdos.sys > diffs
:end
