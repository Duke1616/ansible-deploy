# 部署directPV

## TODO
- 当磁盘处于RAID情况进行排除
- 当磁盘制作LVM情况进行排除

## 注意事项
- 初始化磁盘主机node名称应与服务器主机名称相互对应
- 初始化磁盘仅支持 /dev/sda /dev/sdb 类似格式，不支持 /dev/sda1 /dev/sda2等格式

## 执行操作
```
# 执行以下所有
➜ ansible-playbook -i hosts kubeadm-service.yml --tags directpv

# 拉取镜像
➜ ansible-playbook -i hosts kubeadm-service.yml --tags directpv-image

# 安装directpv
➜ ansible-playbook -i hosts kubeadm-service.yml --tags directpv-install

# 初始化磁盘
➜ ansible-playbook -i hosts kubeadm-service.yml --tags directpv-disk-init
```