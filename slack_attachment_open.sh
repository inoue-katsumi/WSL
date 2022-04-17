#!/bin/bash
#alias pbpaste='powershell.exe -command "Get-Clipboard" | tr -d "\r"'
slack_f ()
{
    # Explained at https://katsumiinoue.wordpress.com/2022/04/17/open-slack-file-attachment-from-command-line-using-d-cookie-and-wslview/

    # Your org's ID. Probably 9 or 8 bytes of ASCII.
    # If you copy attachment URL from Slack app only in detail view, you don't need to set this.
    org_team=01234567X

    # Get 'd' cookie string from Chrome, Firefox, etc. Needs to be URL safe(URL encoded) string
    d_cookie_from_browser=xoxd-xxxx12xxxxxxxxxxxxxxxxx_____________LONG________xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

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
