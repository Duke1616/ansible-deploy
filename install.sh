#!/bin/bash
rolesPath="`pwd`"
pipInstallPath="`pwd`/tools/pip3/"
sshpassInstallPath="`pwd`/tools/sshpass/"
kubernetesPipInstallPath="`pwd`/tools/libs/"
ansibleInstallPath="`pwd`/tools/libs/ansible/"
ansibleInstallModulePath="`pwd`/tools/libs/collections/"

# 判断安装目录是否存在存在
function is_install_path_exist() {
    if [ ! -d $1 ];then
        echo "目录不存在、$1"
        exit 0
    fi
}

# 封装报错处理
function run_error() {
    if [ $? -ne 0 ];then
        echo "安装$1服务失败"
        exit
    fi
}

# 安装pip环境
function installPip3() {
    is_install_path_exist $pipInstallPath
    is_command_exists python3
    cd ${pipInstallPath} && rpm -ivh *.rpm
}

# 安装sshpass依赖
function installsshpass() {
    is_install_path_exist $sshpassInstallPath
    cd ${sshpassInstallPath} && rpm -ivh *.rpm
}

# 安装ansible环境
function installAnsible() {
    is_install_path_exist $ansibleInstallPath
    cd ${ansibleInstallPath} && bash install.sh
}

# 安装ansible插件
function installAnsibleModule() {
    is_install_path_exist $ansibleInstallModulePath
    cd $ansibleInstallModulePath && bash install.sh
}

function main() {
    installPip3
    installsshpass
    installAnsible
    installAnsibleModule
}

main
