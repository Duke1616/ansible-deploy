# 部署MinIO

## 注意事项
- TODO未添加是否可以创建租户的校验

## 执行操作
```
# 执行以下所有
➜ ansible-playbook -i hosts kubeadm-service.yml --tags minio

# 拉取镜像
➜ ansible-playbook -i hosts kubeadm-service.yml --tags minio-image

# 安装 minio-operator
➜ ansible-playbook -i hosts kubeadm-service.yml --tags minio-operator

# 部署minio、单节点 OR 多租户
➜ ansible-playbook -i hosts kubeadm-service.yml --tags minio-install

# ingress对外暴露服务
➜ ansible-playbook -i hosts kubeadm-service.yml --tags minio-expose
```