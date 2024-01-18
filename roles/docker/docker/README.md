# 部署docker

## 安装、配置
```
# 配置所有选项
ansible-playbook -i hosts site.yml --tags docker

# 仅安装docker
ansible-playbook -i hosts site.yml --tags docker-install

# 仅对daemon.json进行配置
ansible-playbook -i hosts site.yml --tags docker-conf

# 登录镜像仓库
ansible-playbook -i hosts site.yml --tags docker-login
```
