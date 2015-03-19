#!/bin/bash
# 安装JDK的脚本

if [ $# -le 2 ]; then
    echo "usage: $0 <install_path> <hbase_package> [profile]"
    echo "example: $0 /usr/local/pkg hbase-1.0.0-bin.tar.gz"
    exit -1
fi

INSTALL_PATH=${1%/}
APP_PKG=$2
if [ -z $3 ];then
    PROFILE=/etc/profile
else
    PROFILE=$3
fi

# hbase
APP_NAME=`basename $APP_PKG`
APP_NAME=${APP_NAME%%-*}

# 检查安装路径
echo "$APP_NAME install in $INSTALL_PATH"

if [ ! -d $INSTALL_PATH ]; then
    echo "create dir $INSTALL_PATH"
    if ! mkdir -p $INSTALL_PATH; then
        echo "create dir $INSTALL_PATH fail"
        exit -1
    fi
fi

# 检查安装包是否存在
if [ ! -e $APP_PKG ]; then
    echo "$APP_PKG not exists"
    exit -1
fi

# hbase1.0.0
APP_DIR=`tar -tf $APP_PKG | head -n 1`
APP_DIR=${APP_DIR%%/*}

# 安装文件
if [ ! -d $INSTALL_PATH/$APP_DIR ]; then
    tar zxf $APP_PKG -C $INSTALL_PATH && \
    ln -s $INSTALL_PATH/$APP_DIR $INSTALL_PATH/$APP_NAME
    echo "export HBASE_HOME=$INSTALL_PATH/$APP_NAME" >> $PROFILE
    echo "export PATH=\$PATH:\$HBASE_HOME/bin" >> $PROFILE
    echo "export CLASSPATH=\$CLASSPATH:\$HBASE_HOME/lib" >> $PROFILE
    source $PROFILE
else
    echo "already exists $INSTALL_PATH/$APP_DIR"
fi
