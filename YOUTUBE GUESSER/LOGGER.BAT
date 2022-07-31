@ECHO OFF
TITLE [0 SUCCESSES] YOUTUBE VIDEO GUESSER
SET /A LOGS=0
:START
set alfanum=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-
set ID=
FOR /L %%b IN (0, 1, 11) DO (
SET /A rnd_num=!RANDOM! * 62 / 32768 + 1
for /F %%c in ('echo %%alfanum:~!rnd_num!^,1%%') do set ID=!ID!%%c
)
ECHO [i] CHECKING [ %ID% ]...
CALL DWNLD.CMD https://img.youtube.com/vi/%ID%/mqdefault.jpg -saveTo %TEMP%\IMG.JPG
ECHO [i] CHECKED [ %ID% ].
IF EXIST STATUS.TXT (
ECHO [i] [ %ID% ] IS VALID!
SET /A LOGS=!LOGS! + 1
SET IDL=%ID%
TITLE [!LOGS! SUCCESSES] YOUTUBE VIDEO GUESSER
ECHO HTTPS://YOUTUBE.COM/V/%ID% >> IDS.TXT
ECHO.
DEL /Q STATUS.TXT
GOTO START
) ELSE (
ECHO [i] [ %ID% ] IS NOT VALID
GOTO START
)
GOTO START