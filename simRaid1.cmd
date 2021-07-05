@echo off

if [%1]==[] goto :help
if [%1]==[-h] goto :help
if [%1]==[--help] goto :help
if [%1]==[/?] goto :help
if [%1]==[?] goto :help

if not exist %1 (
	echo ERROR: SOURCE DOESN'T EXIST
	goto :eof
)
if [%2]==[] (
	echo ERROR: DESTINATION NOT PROVIDED
	goto :eof
)
:HOME
cls
echo --simRaid1--
echo Source:      %1
echo Destination: %2

if [%3]==[-h] (
	echo Running in fast mode. 
	robocopy /E /Z /xj /r:1 /w:1 /xo /MIR %1 %2
) else (
	robocopy /E /Z /r:3 /w:3 /xo /eta /MIR %1 %2
)

echo:
echo ERRORLEVEL: %errorlevel%
timeout /t 2 >nul
goto :HOME

:help
echo simRaid1 by rahuldottech
echo v1.0   [2020-01-04]
echo https://github.com/rahuldottech/simRaid1
echo:
echo Usage:
echo   simRaid1.cmd ^<source_dir^>\ ^<destination_dir^>\ [-f]
echo:
echo simRaid1 allows you to /basically/ implement a RAID1 
echo system from a batch file. It's not exactly realtime,
echo but it's close enough.
echo:
echo The -f flag speeds operations up, making the script 
echo run closer to realtime, but this means that you won't 
echo be shown the ETA, junction points will be excluded
echo and that the number of retries in case of failures and
echo wait times between failures are reduced. 
echo:
echo In default mode, the script will retry thrice if it 
echo can't read a file, waiting for 3 seconds between each 
echo try.
echo In fast mode, the script will retry once if it can't
echo read a file, after a 1 second wait.
echo:
echo You can, of course, change these values in the script.

:eof