## Laravel PHP Framework


Cài đặt centos:

Cài lamp server:
https://www.howtoforge.com/apache_php_mysql_on_centos_7_lamp

Disable se linux:
setsebool -P httpd_unified 1 

Cấu hình jasmin gọi services:


Cài đặt ubuntu:
$ sudo a2enmod rewrite
$ sudo service apache2 restart

Cau hinh virtual host:

<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html/dockeradmin/public/
        <Directory "/var/www/html/dockeradmin/public/">
                AllowOverride all
                Order allow,deny
                Allow from all
        </Directory>
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>


Start jasmin:

vi /etc/hosts
127.0.0.1 sms.com

[root@localhost html]# su jasmin
[jasmin@localhost html]$ systemctl start jasmind

telnet 127.0.0.1 8990 using jcliadmin/jclipwd 

jcli : group -a
Adding a new Group: (ok: save, ko: exit)
> gid marketing
> ok
Successfully added Group [marketing]

jcli : user -a
Adding a new User: (ok: save, ko: exit)
> username foo
> password bar
> gid marketing
> uid foo
> ok
Successfully added User [foo] to Group [marketing]

jcli : smppccm -a
> cid tannm
> host 192.168.100.88
> port 2775
> username tannm
> password tannm
> submit_throughput 110
> ok
Successfully added connector [tannm]

jcli : smppccm -1 tannm


jcli : httpccm -a
Adding a new Httpcc: (ok: save, ko: exit)
> url http://sms.com/smsmo/mo
> method GET
> cid HTTP-01
> ok
Successfully added Httpcc [HttpConnector] with cid:HTTP-01


jcli : morouter -a
Adding a new MO Route: (ok: save, ko: exit)
> type DefaultRoute
jasmin.routing.Routes.DefaultRoute arguments:
connector
> connector http(HTTP-01)
> ok
Successfully added MORoute [DefaultRoute] with order:0