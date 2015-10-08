set log=D:\src\backup.log
set src=D:\src
set dest=\\backupserver\backupshare

echo. >> "%log%"
echo. |time |find "current" >> "%log%"
echo. |date |find "current" >> "%log%"

xcopy "%src%" "%dest%" /D /E /I /F /R /Y /Z >> "%log%"

echo. |time |find "current" >> "%log%"
echo. |date |find "current" >> "%log%"