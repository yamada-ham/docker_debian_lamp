#!/bin/sh

# apache2をバックグラウンドで実行
apache2ctl -D FOREGROUND &

# Supervisorをバックグラウンドで実行
/usr/bin/supervisord &

/usr/sbin/vsftpd /etc/vsftpd.conf  &

# スクリプトが終了しないようにする
tail -f /dev/null
