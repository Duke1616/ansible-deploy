# 部署nginx服务、主要是其他服务通过include_tasks调用
- repository
- keepalived

# 安装nginx
```
# 安装并配置
ansible-playbook -i hosts site.yml --tags nginx

# 仅安装
ansible-playbook -i hosts site.yml --tags nginx-install
```

# 所有主机升级nginx
- 通过修改nginx_setup变量为 upgrade
- 执行剧本
```
ansible-playbook -i hosts site.yml --tags nginx-upgrade
```

# 修改nginx配置
```
ansible-playbook -i hosts site.yml --tags nginx-conf
```