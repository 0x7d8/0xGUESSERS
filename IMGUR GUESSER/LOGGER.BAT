@ECHO OFF
setlocal enabledelayedexpansion
TITLE RANDOM IMGUR ID CHECKER - 0 LOGS
SET /A LOGS=0
:START
set alfanum=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890
set "ID="
FOR /L %%b IN (0, 1, 7) DO (
SET /A rnd_num=!RANDOM! * 62 / 32768 + 1
for /F %%c in ('echo %%alfanum:~!rnd_num!^,1%%') do set ID=!ID!%%c
)
ECHO [i] CHECKING [ %ID% ]...
CALL DWNLD.CMD https://i.imgur.com/%ID%.png -saveTo %TEMP%\IMG.PNG
ECHO [i] CHECKED [ %ID% ].
IF EXIST STATUS.TXT (
ECHO [i] [ %ID% ] IS VALID
SET /A LOGS=!LOGS! + 1
SET IDL=%ID%
TITLE RANDOM IMGUR ID CHECKER - !LOGS! LOGS - LAST: %IDL%
ECHO HTTPS://I.IMGUR.COM/%ID%.PNG >> IDS.TXT
ECHO.
DEL /Q STATUS.TXT
GOTO START
) ELSE (
ECHO [i] [ %ID% ] IS NOT VALID
GOTO START
)
GOTO START