set drive=D:
set srcPath=src
set command=echo

%drive%

cd %srcPath%

for /f %%d in ('dir /b *') do (if exist "%%d\LOG" forfiles -p "%%d\LOG" -s -m *.trn -d -3 -c "cmd /c %command% @path")