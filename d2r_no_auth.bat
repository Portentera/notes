echo off
set folder="C:\Program Files (x86)\Diablo II Resurrected"
set handle=C:\handle.exe
set account=C:\account.txt

set /p region=Select the server(KR/us/eu): || SET "region=kr"
if %region% EQU kr goto startd2r
if %region% EQU KR SET "region=kr" && goto startd2r
if %region% EQU us goto startd2r
if %region% EQU US SET "region=us" && goto startd2r
if %region% EQU eu goto startd2r
if %region% EQU EU SET "region=eu" && goto startd2r

:startd2r
for /f "tokens=1,2" %%x in (%account%) do (
  START "" /D %folder% D2R.exe -username %%x -password %%y -address %region%.actual.battle.net %*
  timeout 5 > NUL
  for /f "tokens=3,6 delims= " %%a in ('%handle% -a "Check For Other Instances" -nobanner') do %handle% -p %%a -c %%b -y
)