域名过期时间检查工具
=
### 使用方法:

#### 1. 登录域名管理地址,导出所有A记录,并保存到list.txt文件中
```
$ cat list.txt
www.baidu.com
``` 

#### 2. 下载脚本domain-ssl-expiration-time-check.sh 到服务器(需要有openssl命令和nmap命令)
```
$ yum install openssl nmap
$ ll domain-ssl-expiration-time-check.sh
```

#### 3. 执行脚本
```
$ sh domain-ssl-expiration-time-check.sh
```

#### 4. 查看结果
```
$ cat info.log
--- www.baidu.com ---
open port: 80 443
Port 80 SSL is not enabled
Port 443 SSL is enabled
  www.baidu.com:443 SSL domain: CN/ST
  www.baidu.com:443 SSL StartTime: 2018-04-03
  www.baidu.com:443 SSL EndTime: 2019-05-26
```
