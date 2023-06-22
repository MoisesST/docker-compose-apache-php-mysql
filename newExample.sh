
~ …
➜ mkdir pagecrud

~ …
➜ cd pagecrud

~/pagecrud …
➜ mkdir web db

~/pagecrud …
➜ ls
db  web

~/pagecrud …
➜ cd web

~/pagecrud/web …
➜ mkdir www

~/pagecrud/web …
➜ ls
www

~/pagecrud/web …
➜ ..

~/pagecrud …
➜ tr
tr: missing operand
Try 'tr --help' for more information.

~/pagecrud …
➜ tree
zsh: command not found: tree

~/pagecrud …
➜

~/pagecrud …
➜ cd web

~/pagecrud/web …
➜ nano Dockerfile

~/pagecrud/web on 🐳 v23.0.1 took 1m 49,1s …
➜ nano Dockerfile

~/pagecrud/web on 🐳 v23.0.1 took 5,0s …
➜ cat  Dockerfile
FROM php:7.4-apache
COPY www/ /var/www/html/

~/pagecrud/web on 🐳 v23.0.1 …
➜ docker build -t webimage:1.0 .
[+] Building 2.5s (8/8) FINISHED
 => [internal] load build definition from Dockerfile                                                                               0.1s
 => => transferring dockerfile: 82B                                                                                                0.0s
 => [internal] load .dockerignore                                                                                                  0.0s
 => => transferring context: 2B                                                                                                    0.0s
 => [internal] load metadata for docker.io/library/php:7.4-apache                                                                  2.2s
 => [auth] library/php:pull token for registry-1.docker.io                                                                         0.0s
 => [internal] load build context                                                                                                  0.0s
 => => transferring context: 22.21kB                                                                                               0.0s
 => CACHED [1/2] FROM docker.io/library/php:7.4-apache@sha256:c9d7e608f73832673479770d66aacc8100011ec751d1905ff63fae3fe2e0ca6d     0.0s
 => [2/2] COPY www/ /var/www/html/                                                                                                 0.1s
 => exporting to image                                                                                                             0.1s
 => => exporting layers                                                                                                            0.1s
 => => writing image sha256:471d12c4d39dad5a034935addb553a0190c6cf22a1d88113f947e8a35e7b64d6                                       0.0s
 => => naming to docker.io/library/webimage:1.0                                                                                    0.0s

~/pagecrud/web on 🐳 v23.0.1 took 2,8s …
➜ docker run -d --name web webimage:1.0
9d683d39b94f928df1afb697d6c5befe9a79d72d771cd0ac179817112fb650b6

~/pagecrud/web on 🐳 v23.0.1 …
➜ docker container ls | egrep web
9d683d39b94f   webimage:1.0   "docker-php-entrypoi…"   About a minute ago   Up About a minute   80/tcp    web

~/pagecrud/web on 🐳 v23.0.1 …
➜ docker container inspect web | egrep -i ipadd
            "SecondaryIPAddresses": null,
            "IPAddress": "172.17.0.2",
                    "IPAddress": "172.17.0.2",

~/pagecrud/web on 🐳 v23.0.1 …
➜

~/pagecrud/web on 🐳 v23.0.1 …
➜ nano Dockerfile

~/pagecrud/web on 🐳 v23.0.1 took 3m 10,5s …
➜ cat Dockerfile
FROM php:7.4-apache
COPY www/ /var/www/html/
RUN docker-php-ext-install mysqli
RUN docker-php-ext-enable mysqli

~/pagecrud/web on 🐳 v23.0.1 …
➜ docker build -t webimage:2.0 .
[+] Building 11.1s (10/10) FINISHED
 => [internal] load build definition from Dockerfile                                                                               0.1s
 => => transferring dockerfile: 149B                                                                                               0.0s
 => [internal] load .dockerignore                                                                                                  0.0s
 => => transferring context: 2B                                                                                                    0.0s
 => [internal] load metadata for docker.io/library/php:7.4-apache                                                                  1.3s
 => [auth] library/php:pull token for registry-1.docker.io                                                                         0.0s
 => [internal] load build context                                                                                                  0.0s
 => => transferring context: 259B                                                                                                  0.0s
 => [1/4] FROM docker.io/library/php:7.4-apache@sha256:c9d7e608f73832673479770d66aacc8100011ec751d1905ff63fae3fe2e0ca6d            0.0s
 => CACHED [2/4] COPY www/ /var/www/html/                                                                                          0.0s
 => [3/4] RUN docker-php-ext-install mysqli                                                                                        9.1s
 => [4/4] RUN docker-php-ext-enable mysqli                                                                                         0.5s
 => exporting to image                                                                                                             0.1s
 => => exporting layers                                                                                                            0.1s
 => => writing image sha256:aee8951c0840d9f6595c963f85595a3c2c04642ac2058cf9cdeff90fcba43890                                       0.0s
 => => naming to docker.io/library/webimage:2.0                                                                                    0.0s

~/pagecrud/web on 🐳 v23.0.1 took 11,4s …
➜ docker container ls | egrep image
9d683d39b94f   webimage:1.0   "docker-php-entrypoi…"   15 minutes ago   Up 15 minutes   80/tcp    web

~/pagecrud/web on 🐳 v23.0.1 …
➜ docker container stop web
web

~/pagecrud/web on 🐳 v23.0.1 …
➜ docker container rm web
web

~/pagecrud/web on 🐳 v23.0.1 …
➜ docker container run -d --name web webimage:2.0
1855f6375e4f4f2587a27e87e6c3d8b43c45140a700ab5a622bd5cd231e3d4fa

~/pagecrud/web on 🐳 v23.0.1 …
➜ docker container ls | egrep image
1855f6375e4f   webimage:2.0   "docker-php-entrypoi…"   14 seconds ago   Up 13 seconds   80/tcp    web

~/pagecrud/web on 🐳 v23.0.1 …
➜ docker container inspect web | egrep -i ipadd
            "SecondaryIPAddresses": null,
            "IPAddress": "172.17.0.2",
                    "IPAddress": "172.17.0.2",

~/pagecrud/web on 🐳 v23.0.1 …
➜ ..

~/pagecrud …
➜ cd web

~/pagecrud/web on 🐳 v23.0.1 …
➜ ls
Dockerfile  www

~/pagecrud/web on 🐳 v23.0.1 …
➜ cd www

pagecrud/web/www via 🐘 v8.1.18 on 🐳 v23.0.1 …
➜ ls
config.php  create.php  delete.php  error.php  index.php  read.php  update.php

pagecrud/web/www via 🐘 v8.1.18 on 🐳 v23.0.1 …
➜ nano config.php

pagecrud/web/www via 🐘 v8.1.18 on 🐳 v23.0.1 took 1m 4,1s …
➜ cat config.php
<?php
/* Database credentials. Assuming you are running MySQL
server with default setting (user 'root' with no password) */
define('DB_SERVER', '172.17.0.3');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '123');
define('DB_NAME', 'dbcrud');

/* Attempt to connect to MySQL database */
$link = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
?>

pagecrud/web/www via 🐘 v8.1.18 on 🐳 v23.0.1 …
➜ docker build -t webimage:3.0 .
[+] Building 0.2s (2/2) FINISHED
 => [internal] load .dockerignore                                                                                                  0.1s
 => => transferring context: 2B                                                                                                    0.0s
 => [internal] load build definition from Dockerfile                                                                               0.1s
 => => transferring dockerfile: 2B                                                                                                 0.0s
ERROR: failed to solve: failed to read dockerfile: open /var/lib/docker/tmp/buildkit-mount409444456/Dockerfile: no such file or directory

pagecrud/web/www via 🐘 v8.1.18 on 🐳 v23.0.1 …
➜ ..

~/pagecrud/web on 🐳 v23.0.1 …
➜ docker build -t webimage:3.0 .
[+] Building 10.5s (10/10) FINISHED
 => [internal] load .dockerignore                                                                                                  0.0s
 => => transferring context: 2B                                                                                                    0.0s
 => [internal] load build definition from Dockerfile                                                                               0.1s
 => => transferring dockerfile: 149B                                                                                               0.0s
 => [internal] load metadata for docker.io/library/php:7.4-apache                                                                  1.2s
 => [auth] library/php:pull token for registry-1.docker.io                                                                         0.0s
 => [internal] load build context                                                                                                  0.0s
 => => transferring context: 762B                                                                                                  0.0s
 => CACHED [1/4] FROM docker.io/library/php:7.4-apache@sha256:c9d7e608f73832673479770d66aacc8100011ec751d1905ff63fae3fe2e0ca6d     0.0s
 => [2/4] COPY www/ /var/www/html/                                                                                                 0.1s
 => [3/4] RUN docker-php-ext-install mysqli                                                                                        8.3s
 => [4/4] RUN docker-php-ext-enable mysqli                                                                                         0.6s
 => exporting to image                                                                                                             0.2s
 => => exporting layers                                                                                                            0.2s
 => => writing image sha256:15e6e15a02ba6ca5390d7f6dff02ab39714d815744ceb90c72d950117f7c6c4a                                       0.0s
 => => naming to docker.io/library/webimage:3.0                                                                                    0.0s

~/pagecrud/web on 🐳 v23.0.1 took 10,7s …
➜ docker container ls | egrep image
1855f6375e4f   webimage:2.0   "docker-php-entrypoi…"   9 minutes ago   Up 9 minutes   80/tcp    web

~/pagecrud/web on 🐳 v23.0.1 …
➜ docker container stop web
web

~/pagecrud/web on 🐳 v23.0.1 …
➜ docker container rm web
web

~/pagecrud/web on 🐳 v23.0.1 …
➜ docker image ls | egrep image
webimage     3.0       15e6e15a02ba   2 minutes ago    453MB
webimage     2.0       aee8951c0840   13 minutes ago   453MB
webimage     1.0       471d12c4d39d   30 minutes ago   453MB

~/pagecrud/web on 🐳 v23.0.1 …
➜ docker run -d --name web webimage:3.0
d4e52972d0f63d19d2051e4742fb56d38b75d0ac6db41806eab31d1191da742d

~/pagecrud/web on 🐳 v23.0.1 …
➜ ..

~/pagecrud …
➜ cd db

~/pagecrud/db …
➜ nano Dockerfile

~/pagecrud/db on 🐳 v23.0.1 took 2m 33,7s …
➜ cat Dockerfile
FROM mysql:8-debian
ENV MYSQL_ROOT_PASSWORD 123
COPY dbcrud.sql /docker-entrypoint-initdb.d/



~/pagecrud/db …
➜

~/pagecrud/db on 🐳 v23.0.1 …
➜ ansible valt
zsh: command not found: ansible

~/pagecrud/db on 🐳 v23.0.1 …
➜ nano dbcrud.sql

~/pagecrud/db on 🐳 v23.0.1 took 1m 29,0s …
➜ cat dbcrud.sql
CREATE DATABASE dbcrud;

USE dbcrud;

CREATE TABLE employees (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    salary INT(10) NOT NULL
);

~/pagecrud/db on 🐳 v23.0.1 …
➜ docker build -t dbimage:1.0 .
[+] Building 26.2s (8/8) FINISHED
 => [internal] load .dockerignore                                                                                                  0.2s
 => => transferring context: 2B                                                                                                    0.0s
 => [internal] load build definition from Dockerfile                                                                               0.1s
 => => transferring dockerfile: 131B                                                                                               0.0s
 => [internal] load metadata for docker.io/library/mysql:8-debian                                                                  5.7s
 => [auth] library/mysql:pull token for registry-1.docker.io                                                                       0.0s
 => [internal] load build context                                                                                                  0.1s
 => => transferring context: 248B                                                                                                  0.0s
 => [1/2] FROM docker.io/library/mysql:8-debian@sha256:ee1e7bf1a6c7f7fc26abbbed04b6e0ab6f202b48c50ef8f418324901420b207e           19.7s
 => => resolve docker.io/library/mysql:8-debian@sha256:ee1e7bf1a6c7f7fc26abbbed04b6e0ab6f202b48c50ef8f418324901420b207e            0.1s
 => => sha256:ee1e7bf1a6c7f7fc26abbbed04b6e0ab6f202b48c50ef8f418324901420b207e 320B / 320B                                         0.0s
 => => sha256:759700526b7894aa9c150feb2ebfcd00cf06d2890df739e71555edcfd13669e3 31.42MB / 31.42MB                                  10.3s
 => => sha256:fe03a6bd2ae95b6630c019ae5bf8e7351c8f27095d7fa0fb9a0deb3a6a56d515 1.73kB / 1.73kB                                     1.2s
 => => sha256:9fe98fd0054daa6f38d2c1aaeff6b257d29ba86de74067a273764fb9801b4df9 4.41MB / 4.41MB                                     7.2s
 => => sha256:8dd2269034dd8680a2d90403977c9604bbaeb0e30364d105340a50241245785c 2.83kB / 2.83kB                                     0.0s
 => => sha256:4a7faa2f9a3fde46c5e8c2d1b5c8d0fb9372a5707162e3b2826fe59478a54cce 7.12kB / 7.12kB                                     0.0s
 => => sha256:17b46f788fa0e3949eb16f96da627627fef28391e6788017828fdc59d85e1e47 1.47MB / 1.47MB                                     4.0s
 => => sha256:a574d9be7097a3158569d7be3fe8f58245d2a1160a02322df42cc21ed4da6305 147B / 147B                                         4.4s
 => => sha256:c32a1a43aaf90ecca1eaecc5cbdade060ae64eb3ad5c0164d3f7fdfa6df36c22 12.66MB / 12.66MB                                   9.6s
 => => sha256:1168cde172f4894d8388f45337512f3c50e31b0052297b85690542a846df34f6 2.55kB / 2.55kB                                     7.5s
 => => sha256:7db9de6fbb6e12066dfb465bb744c8874637465cb32df5af3b7bdc1853d1f07e 249B / 249B                                         7.7s
 => => sha256:7597d1f876243f8e8f404c3f283ef6cbbdba1f7a9e6dd0382d87b0c52a1c7286 129.74MB / 129.74MB                                16.1s
 => => sha256:c90525318623af863af49636e05796881027a61b6c6f6f673755105a58f6e1ff 845B / 845B                                         9.8s
 => => sha256:569dbc33ff4adc1218e4182f4ef79c728b2ece52f04ab884388496922b9c38f5 5.39kB / 5.39kB                                    10.0s
 => => sha256:765dd48ed85e84d520ae837a9e4fa93353bff6066721a0b41e484f1baeaa4194 121B / 121B                                        10.3s
 => => extracting sha256:759700526b7894aa9c150feb2ebfcd00cf06d2890df739e71555edcfd13669e3                                          0.8s
 => => extracting sha256:fe03a6bd2ae95b6630c019ae5bf8e7351c8f27095d7fa0fb9a0deb3a6a56d515                                          0.0s
 => => extracting sha256:9fe98fd0054daa6f38d2c1aaeff6b257d29ba86de74067a273764fb9801b4df9                                          0.2s
 => => extracting sha256:17b46f788fa0e3949eb16f96da627627fef28391e6788017828fdc59d85e1e47                                          0.1s
 => => extracting sha256:a574d9be7097a3158569d7be3fe8f58245d2a1160a02322df42cc21ed4da6305                                          0.0s
 => => extracting sha256:c32a1a43aaf90ecca1eaecc5cbdade060ae64eb3ad5c0164d3f7fdfa6df36c22                                          0.4s
 => => extracting sha256:1168cde172f4894d8388f45337512f3c50e31b0052297b85690542a846df34f6                                          0.0s
 => => extracting sha256:7db9de6fbb6e12066dfb465bb744c8874637465cb32df5af3b7bdc1853d1f07e                                          0.0s
 => => extracting sha256:7597d1f876243f8e8f404c3f283ef6cbbdba1f7a9e6dd0382d87b0c52a1c7286                                          2.4s
 => => extracting sha256:c90525318623af863af49636e05796881027a61b6c6f6f673755105a58f6e1ff                                          0.0s
 => => extracting sha256:569dbc33ff4adc1218e4182f4ef79c728b2ece52f04ab884388496922b9c38f5                                          0.0s
 => => extracting sha256:765dd48ed85e84d520ae837a9e4fa93353bff6066721a0b41e484f1baeaa4194                                          0.0s
 => [2/2] COPY dbcrud.sql /docker-entrypoint-initdb.d/                                                                             0.5s
 => exporting to image                                                                                                             0.1s
 => => exporting layers                                                                                                            0.1s
 => => writing image sha256:06d83d002cd11a83e26c6026185475e07eeb81b07c9a28877ec43493a546af01                                       0.0s
 => => naming to docker.io/library/dbimage:1.0                                                                                     0.0s

~/pagecrud/db on 🐳 v23.0.1 took 26,4s …
➜ docker image ls | egrep image
dbimage      1.0       06d83d002cd1   10 seconds ago   602MB
webimage     3.0       15e6e15a02ba   16 minutes ago   453MB
webimage     2.0       aee8951c0840   27 minutes ago   453MB
webimage     1.0       471d12c4d39d   44 minutes ago   453MB

~/pagecrud/db on 🐳 v23.0.1 …
➜ docker run -d --name db dbimage:1.0
e1bbb21f36674bdc0464284827980deca9e38165ac684ad35b033319b17218fa

~/pagecrud/db on 🐳 v23.0.1 …
➜ docker exec -it db mysql -u root -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 13
Server version: 8.0.33 MySQL Community Server - GPL

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use dbcrud
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> select * from employees;
+----+-------+----------+--------+
| id | name  | address  | salary |
+----+-------+----------+--------+
|  1 | utfpr | dffhgffg |   1000 |
+----+-------+----------+--------+
1 row in set (0.00 sec)

mysql> quit
Bye

~/pagecrud/db on 🐳 v23.0.1 took 3m 12,2s …
➜ tar -cvzf pagecrud.tar.gz pagecrud/
tar: pagecrud: Cannot stat: No such file or directory
tar: Exiting with failure status due to previous errors

~/pagecrud/db on 🐳 v23.0.1 …
➜ ..

~/pagecrud …
➜ ..

~ …
➜ tar -cvzf pagecrud.tar.gz pagecrud/
pagecrud/
pagecrud/web/
pagecrud/web/Dockerfile
pagecrud/web/www/
pagecrud/web/www/delete.php
pagecrud/web/www/config.php
pagecrud/web/www/create.php
pagecrud/web/www/error.php
pagecrud/web/www/update.php
pagecrud/web/www/read.php
pagecrud/web/www/index.php
pagecrud/db/
pagecrud/db/Dockerfile
pagecrud/db/pagecrud.tar.gz
pagecrud/db/dbcrud.sql

~ …
➜
