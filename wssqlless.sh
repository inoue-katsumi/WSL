#!/bin/bash
# Do "Windows Search" with CLI utility and open all hits in WSL less.
# wssql.exe source is https://github.com/Microsoft/Windows-classic-samples/blob/master/Samples/Win7Samples/winui/WindowsSearch/WSSQL/WSSQL.cs
#
#echo wssql.exe \
#"SELECT System.ItemPathDisplay FROM SystemIndex where contains(*,'"$*"')" | exit
wssql.exe \
"SELECT System.ItemPathDisplay FROM SystemIndex where contains(*,'"$*"')" |
dos2unix | grep -vE '^(Query=|Rows+)' | sed 's|\\|/|g;s|;$||' |
while read line
do
    /bin/wslpath "$line"
done |
sed "s|/ユーザー/|/Users/|;\
  s|/$USER/ダウンロード|/$USER/Downloads|;\
  s|/$USER/ドキュメント|/$USER/Documents|" |
  sed 's/^/"/;s/$/"/' | xargs less +/"$*"

# sed 's/^/"/;s/$/"/;s/ユーザー/Users/;s/ダウンロード/Downloads/' |
#xargs less +/"$1"
