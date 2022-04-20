username=$1
password=$2

logger "开始检测网络状态"

STATUS0=$(curl -s 10.10.42.3 | grep "authuserfield='DDDDD'")

if [ "$STATUS0" = "" ]
then
logger "未接入校园网，不可认证"
else

STATUS1=$(curl -s 10.10.42.3 | grep stime)

if [ "$STATUS1" = "" ]
then
logger "已接入校园网，但尚未认证，尝试自动认证【$1】"
STATUS2=$(curl -s "http://10.10.43.3/drcom/login?callback=dr1649207599798&DDDDD=${username}&upass=${password}&0MKKey=123456" | grep stime)

if [ "$STATUS2" = "" ]
then
logger "认证失败"
else
logger "认证成功【$STATUS2】"
fi

else
logger "已接入校园网，已认证，无需再次认证"

fi

fi

