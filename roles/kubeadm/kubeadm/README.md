# 部署kubeadm集群
## 依赖服务
- roles
  - docker
  - nginx
  - keepalived
- cri
  - docker
  - containerd
- cni
  - calico
  - flannel

## 安装kubeadm
- 会通过master节点数量自动判断集群部署or单节点部署
- 集群模式部署会自动调用 nginx、keepalived roles启用虚拟IP
- 启用不同的cni、cri通过修改vars/main.yml,初始化后不支持更换
```
# 初始化kubeadm集群、添加相应节点
ansible-playbook -i hosts site.yml --tags kubeadm

# 仅安装集群依赖
ansible-playbook -i hosts site.yml --tags kubeadm-install

# 仅初始化集群
ansible-playbook -i hosts site.yml --tags kubeadm-init

# pki证书
ansible-playbook -i hosts site.yml --tags kubeadm-pki
```

## 扩展kubeadm
- hosts文件在相对应的位置添加主机
```
# 扩展master节点
ansible-playbook -i hosts site.yml --tags kubeadm-add-master

# 扩展node节点
ansible-playbook -i hosts site.yml --tags kubeadm-add-node
```
