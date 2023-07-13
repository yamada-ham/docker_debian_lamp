#!/bin/sh

# バックグラウンドで実行するパッケージ
# Redisサーバーを起動
service redis-server start

# apache2
apache2ctl -D FOREGROUND &

# Supervisor
/usr/bin/supervisord &

# ftp
/usr/sbin/vsftpd /etc/vsftpd.conf  &

cron &

# スクリプトが終了しないようにする
tail -f /dev/null
