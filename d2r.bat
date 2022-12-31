set folder="C:\Program Files (x86)\Diablo II Resurrected"
set handle=C:\handle.exe
START "" /D %folder% D2R.exe %*
timeout 5 > NUL
for /f "tokens=3,6 delims= " %%a in ('%handle% -a "Check For Other Instances" -nobanner') do %handle% -p %%a -c %%b -y
