# Padavan 路由器设置

1.	高级设置 – 系统管理 – 服务
开启SSH
定时任务 */10 * * * * /etc/storage/auto_login.sh username password

2.	自定义设置 – 脚本
开启WAN后
/etc/storage/auto_login.sh username password

3.	将脚本上传到路由器
CMD 管理员身份
ssh admin@192.168.123.1
cd /etc/storage
vi auto_login.sh
按 i 进入编辑模式
将准备好的脚本粘贴上去
按 esc 退出编辑模式
输入 :wq 并回车
chmod +x auto_login.sh
exit

4.	系统管理 - 恢复/导出/上传设置
