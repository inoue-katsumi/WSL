#!/bin/bash
#alias pbpaste='powershell.exe -command "Get-Clipboard" | tr -d "\r"'
slack_f ()
{
    # Your org's ID
    org_team=Z012ZZZZZ

    # Get 'd' cookie string from Chrome, Firefox, etc. Needs to be URL safe(URL encoded) string
    d_cookie_from_browser=xoxd-zzzz12zzzzzzzzzzzzzzzzz_____________LONG________zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz

    URL=$(pbpaste | sed -r 's|^(https://).*(\.slack\.com)/files/.*/(.*)/(.*)\?origin_team=(.*)&.*$|\1files\2/files-pri/\5-\3/\4|')
    URL=$(echo $URL | sed -r "s|^(https://).*(\.slack\.com)/files/.*/(.*)/(.*)$|\1files\2/files-pri/$org_team-\3/\4|")
    echo $URL | command grep '^https://files.slack.com/files-pri/' > /dev/null \
    &&
    curl -O -H \
    "Cookie: d=$d_cookie_from_browser" \
    $URL \
    &&
    command ls -l $(basename $URL) \
    &&
    wslview $(basename $URL)
}
#slack_f
