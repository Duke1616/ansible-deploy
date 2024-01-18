# 部署MySQL

## TODO
- 更新功能待完善
- 升级功能待完善
- 创建用户、授权功能待完善

## 运行方式
- deploy_uuid指定需要进行部署更新实例
- 初始化实例、会自动加载user列表，创建用户、授权
- 检测部署服务器是否拥有docker-compose.yaml文件执行安装或更新

```
deploy_uuid: 7f7314ca-3504-3860-236b-cface7891277
service:
  - uuid: 7f7314ca-3504-3860-236b-cface7891277 # 实例唯一ID
    name: mysql  # 实例名称
    project_name: ebond-idl  # 项目名称
    environment: uat # 部署环境
    host: 192.168.43.24 # 部署到主机
    port: 3306 # 指定对外暴露端口
    version: 8.0.27 # 版本信息
    user: # init初始化创建用户
      - name: ebond
        database:
          - core2db
          - ebondidlrp
          - ebondidlstat
      - name: test
        database:
          - core2db
  - uuid: 7f7314ca-3504-3860-236b-cface7891277
    ......
```

## 执行操作
```
# 执行以下所有
➜ ansible-playbook -i hosts kubeadm-service.yml --tags mysql

# 拉取镜像
➜ ansible-playbook -i hosts kubeadm-service.yml --tags mysql-image

# 通过默认值部署
➜ ansible-playbook -i hosts docker-service.yml --tags mysql-install

# 通过传值指定部署实例
➜ ansible-playbook -i hosts docker-service.yml --extra-vars "deploy_uuid=12345" --tags mysql-install
```