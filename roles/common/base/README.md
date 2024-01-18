# 系统初始化配置


# 私有源
```
ansible-playbook -i hosts site.yml --tags base-repo
```

# 推送镜像
```
ansible-playbook -i hosts site.yml --tags base-mirros
```