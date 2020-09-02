echo "[1] install ntpdate..."

yum install ntpdate -y

echo "[2] update time..."
ntpdate 1.ro.pool.ntp.org


echo "[3] set timesyncd..."
echo '[Time]' >> /etc/systemd/timesyncd.conf
echo 'NTP=0.ro.pool.ntp.org 1.ro.pool.ntp.org' >> /etc/systemd/timesyncd.conf
echo 'FallbackNTP=ntp.ubuntu.com 0.arch.pool.ntp.org' >> /etc/systemd/timesyncd.conf

echo "[4] set-ntp..."
timedatectl set-ntp true 
timedatectl status
cp /etc/localtime /etc/localtime.backup
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

echo
date
echo "[5] time set done"
