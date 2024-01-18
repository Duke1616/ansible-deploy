# Ansible-deploy自动化部署

## 项目定位
- 可集成运维一体化平台（提供Job模块功能）
- 离线环境自动化部署
- 管理服务、安装、升级
- 暂时不提供卸载、删除等危险操作

## 可支持操作系统
- Ubuntu20.04 live-server（待完善）
- Kylin V10 （经过测试）
- Centos（待完善）

## 注意事项
- 尽量保证环境纯净
- 主机初始密码必须相同（推送公钥需要）
- 不支持ARM架构
- 具体细节文档查看单独的roles

## 目录结构
```
├── ansible.cfg      # ansible配置文件
├── git-remote.sh    # 删除git错误上传大文件
├── group_vars       # 主机组变量
│   ├── all
│   └── kubeadm
├── hosts            # 主机组定义
├── init-pubkey.sh   # 推送主机公钥
├── init-service.yml # 
├── install.sh       # 安装ansible环境、以及相关依赖
├── kubeadm-service.yml # kubeadm服务管理
├── kubeadm-service.yml # docker服务管理
├── library          # 自定义模块
│   ├── relvm.py
│   └── re.py
├── molecule         # TODO 单元测试、可集成CI
│   └── README.md
├── pass.yml         # 主机密码、推送公钥使用
├── README.md
├── roles            # 角色列表
│   ├── common       # 基础服务
│   ├── docker       # docker服务
│   ├── kubeadm      # kuebadm服务
│   └── project      # 业务项目相关
├── send-pubkey.yml  # 推送公钥
└── site.yml         # 部署基础环境
```

## common支持服务
- base
- chrony
- ntpd
- keepalived
- nginx
- repository

## docker支持服务
- docker

## kubeadm支持服务
- kubeadm
- k8tz
- cert-manager
- traefik
- directpv
- longhorn
- minio
- mysql

## ansible环境初始化
```
# 部署ansible、以及相关依赖
➜  bash install.sh

# 推送公钥到主机
➜  bash init-pubkey.sh
```

## 初始化环境
```
➜  ansible-playbook -i hosts site.yml
```
