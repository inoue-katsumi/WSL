# WSL

WSL is utilities or configuration files for Windows Subsystem for Linux.

## Usage:

```bash
./wssqlless.sh {search keyword}
```

## profiles.json:

Multiple WSL configurations for same shell, for single distribution. In my case, it's Ubuntu-18.04. This is a kludgy work-around for https://github.com/microsoft/terminal/issues/4398

## wssqlless.sh:

Use Windows Search to find files which contain {search keyword}. Open all these files in less.

## slack_attachment_open.sh

https://katsumiinoue.wordpress.com/2022/04/17/open-slack-file-attachment-from-command-line-using-d-cookie-and-wslview/

Open attachment in Slack from bash prompt.
