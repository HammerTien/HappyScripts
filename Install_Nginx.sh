#!/bin/bash
# ./Install_Nginx.sh x.x.x to install nginx-x.x.x

VERSION=$1
WORKDIR=nginx_temp
if [ VERSION=="" ];then
    echo "No version input, 1.18.0 is default"
    VERSION="1.18.0"
fi    
mkdir ${WORKDIR}
cd ${WORKDIR}

yum -y install gcc
yum install -y pcre pcre-devel
yum install -y zlib zlib-devel
yum install -y openssl openssl-devel

wget http://nginx.org/download/nginx-${VERSION}.tar.gz
tar -zxvf  nginx-${VERSION}.tar.gz
cd nginx-${VERSION}
./configure
make
make install
echo "install finished, delete temp file"
cd ..
rm -rf nginx-${VERSION}
rm -f nginx-${VERSION}.tar.gz
echo "By changing config file use   [ vim /usr/local/nginx/conf/nginx.conf ]"
echo "By starting nginx service use [ /usr/local/nginx/sbin/nginx xxx ]"
echo "FINISHED!"






