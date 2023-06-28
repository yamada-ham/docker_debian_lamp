#!/bin/sh

# バックグラウンドで実行するパッケージ
# apache2
apache2ctl -D FOREGROUND &

# Supervisor
/usr/bin/supervisord &

# ftp
/usr/sbin/vsftpd /etc/vsftpd.conf  &

cron &

# スクリプトが終了しないようにする
tail -f /dev/null
