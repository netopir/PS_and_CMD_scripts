@echo off
REM
set eac3todirectory=C:\BRtools\eac3to\eac3to.exe
REM
echo [92m"Source Path"
set /p source=" "[0m
REM
echo [90m"Wait"[0m
%eac3todirectory% %source%
REM
echo [95m"Play List"
set /p playlist=" "[0m
REM
echo [90m"Create @eac3to_log"[0m
%eac3todirectory% %source% %playlist%) -log=%source%\@eac3to_log.txt
REM
IF EXIST %source%\@remux.txt DEL /F %source%\@remux.txt
REM
echo [90m"Create @remux"[0m
powershell -f C:\BRtools\eac3to\log2cmd_v1.ps1 %source%\@eac3to_log.txt %source%\@remux.txt
REM
powershell -f C:\BRtools\eac3to\log2cmd_v1.ps1 %source%\@eac3to_log.txt %source%\@remux_all.txt
REM
echo [90m"Open @remux"[0m
powershell notepad.exe %source%\@remux.txt
REM
pause
echo [90m"Remove spaces @remux"[0m
for /f "usebackq tokens=* delims=" %%a in ("%source%\@remux.txt") do (echo(%%a)>>~.txt
move /y  ~.txt "%source%\@remux.txt"
REM
for /f "usebackq tokens=* delims=" %%a in ("%source%\@remux_all.txt") do (echo(%%a)>>~.txt
move /y  ~.txt "%source%\@remux_all.txt"
REM
echo [90m"Run @remux"[0m
cmd < %source%\@remux.txt
REM
pause
REM
EXIT /B 0
