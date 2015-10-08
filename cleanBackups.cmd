set src=\\backupserver\backupshare
set command=echo
set fullRetention=14
set diffRetention=7
set logRetention=7
set systemRetention=7

pushd "%src%" &&((for /f %%d in ('dir /b *') do (echo "%%d" | findstr "master model msdb" 1>NUL) || (forfiles -p "%%d\FULL" -s -m *.bak -d -%fullRetention% -c "cmd /c %command% @path") ^
& (forfiles -p "%%d\DIFF" -s -m *.bak -d -%diffRetention% -c "cmd /c %command% @path") ^
& (forfiles -p "%%d\LOG" -s -m *.trn -d -%logRetention% -c "cmd /c %command% @path")) ^
& (for %%m in (master, msdb, model) do (forfiles -p "%%m\FULL" -s -m *.bak -d -%systemRetention% -c "cmd /c %command% @path"))) & popd

pause