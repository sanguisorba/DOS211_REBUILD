@echo off
rem
rem MASM here is MASM 4.00
rem LINK is from Visual C++ 1.52
rem
masm msdos,,,,
if errorlevel 1 goto end
masm mscode,,,,
if errorlevel 1 goto end
masm dosmes,,,,
if errorlevel 1 goto end
masm misc,,,,
if errorlevel 1 goto end
masm getset,,,,
if errorlevel 1 goto end
masm dircall,,,,
if errorlevel 1 goto end
masm alloc,,,,
if errorlevel 1 goto end
masm dev,,,,
if errorlevel 1 goto end
masm dir,,,,
if errorlevel 1 goto end
masm disk,,,,
if errorlevel 1 goto end
masm fat,,,,
if errorlevel 1 goto end
masm rom,,,,
if errorlevel 1 goto end
masm stdbuf,,,,
if errorlevel 1 goto end
masm stdcall,,,,
if errorlevel 1 goto end
masm stdctrlc,,,,
if errorlevel 1 goto end
masm stdfcb,,,,
if errorlevel 1 goto end
masm stdproc,,,,
if errorlevel 1 goto end
masm stdio,,,,
if errorlevel 1 goto end
masm time,,,,
if errorlevel 1 goto end
masm xenix,,,,
if errorlevel 1 goto end
masm xenix2,,,,
if errorlevel 1 goto end
link @doslink
if errorlevel 1 goto end
exe2bin msdos.exe msdos.sys
if errorlevel 1 goto end
fc /b /m0 msdos.0 msdos.sys > diffs
:end
