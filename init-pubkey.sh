# 生成公钥
ssh-keygen -t rsa -P "" -f /root/.ssh/id_rsa

# 修改密码
read -p "请输入密码：" password
sed -ri "s#(^.*ansible_ssh_pass: )(.*)#\1$password#g" pass.yml

# 推送公钥
ansible-playbook -i hosts send-pubkey.yml
sed -ri "s#(^.*ansible_ssh_pass: )(.*)#\1123456#g" pass.yml
