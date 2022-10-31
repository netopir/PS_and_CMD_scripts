@echo off
title "Remux with Eac3to"
REM
set eac3todirectory=C:\BRtools\eac3to\eac3to.exe
REM
echo [91m"Source Path"
set /p source=" "[0m
REM
echo [90m"Wait"[0m
%eac3todirectory% %source%
REM
echo [92m"Play List"
set /p playlist=" "[0m
REM
echo [94m"Destination Path"
set /p destination=" "[0m
REM
if not exist %destination% md %destination%
REM
echo [95m"Sub Folder"
set /p subfolder=" "[0m
REM
if defined subfolder (md %destination%\"%subfolder%") else (nul)
REM
echo [90m"Create @eac3to_log"[0m
%eac3todirectory% %source% %playlist%) -log=%destination%\%subfolder%\@eac3to_log.txt
REM
if exist %destination%\%subfolder%\@remux.txt del /F %destination%\%subfolder%\@remux.txt
REM
timeout /t 2 /nobreak > nul
REM
echo [90m"Create @remux"[0m
powershell -f C:\BRtools\eac3to\log2cmd_v1.ps1 %destination%\%subfolder%\@eac3to_log.txt %destination%\%subfolder%\@remux.txt
REM
timeout /t 2 /nobreak > nul
REM
powershell -f C:\BRtools\eac3to\log2cmd_v1.ps1 %destination%\%subfolder%\@eac3to_log.txt %destination%\%subfolder%\@remux_all.txt > nul
REM
echo [90m"Open @remux"[0m
powershell notepad.exe %destination%\%subfolder%\@remux.txt
REM
pause
echo [90m"Remove spaces @remux"[0m
for /f "usebackq tokens=* delims=" %%a in ("%destination%\%subfolder%\@remux.txt") do (echo(%%a)>>~.txt
move /y  ~.txt "%destination%\%subfolder%\@remux.txt"
REM
timeout /t 2 /nobreak > nul
REM
for /f "usebackq tokens=* delims=" %%a in ("%destination%\%subfolder%\@remux_all.txt") do (echo(%%a)>>~.txt
move /y  ~.txt "%destination%\%subfolder%\@remux_all.txt"
REM
timeout /t 2 /nobreak > nul
REM
echo [90m"Run @remux"[0m
cmd < "%destination%\%subfolder%"\@remux.txt
REM
pause
REM
EXIT /B 0