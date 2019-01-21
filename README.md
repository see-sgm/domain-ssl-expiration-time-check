域名过期时间检查工具
=
```
背景: 公司域名证书不只有一个,且有可能被不同的协议引用,比如https/Wss,在替换时
如果发生遗漏将造成线上事故,所以写了个脚本批量扫描所有域名的证书过期时间
逻辑: 1.脚本for循环list.txt内的内容(域名列表)
      2.nmap扫描开启的所有端口
      3.循环检查端口所使用证书的过期时间
脚本比较low,大神勿喷
```
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
  www.baidu.com:443 SSL domain: baidu.com
  www.baidu.com:443 SSL StartTime: 2018-04-03
  www.baidu.com:443 SSL EndTime: 2019-05-26
```
