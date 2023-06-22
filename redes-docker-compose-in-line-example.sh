➜ docker run -d -e MYSQL_ROOT_PASSWORD=123 --name meudb1 mysql:8-debian
    Unable to find image 'mysql:8-debian' locally
    8-debian: Pulling from library/mysql
    f03b40093957: Pull complete
    460bb444d52d: Pull complete
    58ceec72175a: Pull complete
    8ca6f73d0c4e: Pull complete
    37af5e268315: Pull complete
    63c12e7f4538: Pull complete
    6fe8fac55990: Pull complete
    459c00b032f6: Pull complete
    da46d64fa018: Pull complete
    4c38d2a0b5b8: Pull complete
    9d594c6498db: Pull complete
    b4d10222ee51: Pull complete
    Digest: sha256:8997d21bc7a8406c9ea3de932a25306091749e702a37d51aebafcf93beb3db2e
    Status: Downloaded newer image for mysql:8-debian
    68a0ae8de838acde08e44e143dd4f0b361cb06aa421edbea026cabe86546f0d4

~ took 19,0s …
➜ docker ps
    CONTAINER ID   IMAGE            COMMAND                  CREATED          STATUS          PORTS                 NAMES
    68a0ae8de838   mysql:8-debian   "docker-entrypoint.s…"   13 seconds ago   Up 11 seconds   3306/tcp, 33060/tcp   meudb1

~ …
➜ docker ps | egrep meudb
    68a0ae8de838   mysql:8-debian   "docker-entrypoint.s…"   3 minutes ago   Up 3 minutes   3306/tcp, 33060/tcp   meudb1

~ …
➜ docker container exec -it meudb1 mysql -u root -p
    Enter password:
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 8
    Server version: 8.0.33 MySQL Community Server - GPL

    Copyright (c) 2000, 2023, Oracle and/or its affiliates.

    Oracle is a registered trademark of Oracle Corporation and/or its
    affiliates. Other names may be trademarks of their respective
    owners.

    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

    mysql> create database cruddb;
        Query OK, 1 row affected (0.02 sec)

    mysql> use cruddb;
        Database changed

    mysql> CREATE TABLE employees (
        ->     id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        ->     name VARCHAR(100) NOT NULL,
        ->     address VARCHAR(255) NOT NULL,
        ->     salary INT(10) NOT NULL
        -> );
        Query OK, 0 rows affected, 1 warning (0.05 sec)

    mysql> desc employees;
        +---------+--------------+------+-----+---------+----------------+
        | Field   | Type         | Null | Key | Default | Extra          |
        +---------+--------------+------+-----+---------+----------------+
        | id      | int          | NO   | PRI | NULL    | auto_increment |
        | name    | varchar(100) | NO   |     | NULL    |                |
        | address | varchar(255) | NO   |     | NULL    |                |
        | salary  | int          | NO   |     | NULL    |                |
        +---------+--------------+------+-----+---------+----------------+
        4 rows in set (0.00 sec)

    mysql> select * from employees;
        Empty set (0.02 sec)

    mysql> q
        -> quit
        -> exit;
        ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'q
        quit
        exit' at line 1
    mysql> exit
        Bye

~ took 7m 31,6s …
➜ mkdir meusite

~ …
➜ nano meusite/config.php

~ took 30,2s …
➜ nano meusite/config.php

~ took 2m 10,0s …
➜ nano meusite/config.php

~ took 20,9s …
➜ cat meusite/config.php
    <?php
    /* Database credentials. Assuming you are running MySQL
    server with default setting (user 'root' with no password) */
    define('DB_SERVER', 'meudb1');
    define('DB_USERNAME', 'root');
    define('DB_PASSWORD', 'abc123');
    define('DB_NAME', 'cruddb');

    /* Attempt to connect to MySQL database */
    $link = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

    // Check connection
    if($link === false){
        die("ERROR: Could not connect. " . mysqli_connect_error());
    }

~ …
➜


~ …
➜ docker run -d -v $(pwd)/meusite/:/var/www/html/ --name meusite -p 8000:80 php:7.4-apache
    Unable to find image 'php:7.4-apache' locally
    7.4-apache: Pulling from library/php
    a603fa5e3b41: Pull complete
    c428f1a49423: Pull complete
    156740b07ef8: Pull complete
    fb5a4c8af82f: Pull complete
    25f85b498fd5: Pull complete
    9b233e420ac7: Pull complete
    fe42347c4ecf: Pull complete
    d14eb2ed1e17: Pull complete
    66d98f73acb6: Pull complete
    d2c43c5efbc8: Pull complete
    ab590b48ea47: Pull complete
    80692ae2d067: Pull complete
    05e465aaa99a: Pull complete
    Digest: sha256:c9d7e608f73832673479770d66aacc8100011ec751d1905ff63fae3fe2e0ca6d
    Status: Downloaded newer image for php:7.4-apache
    4b3c456b090d62340285e7f6ef5e51f0def81317e080d506a134eaf7d15887a1

~ took 19,3s …
➜ docker container exec meusite1 docker-php-ext-install mysqli
    Error response from daemon: No such container: meusite1
~ …

➜ docker container exec meusite docker-php-ext-install mysqli
    Configuring for:
    PHP Api Version:         20190902
    Zend Module Api No:      20190902
    Zend Extension Api No:   320190902
    checking for grep that handles long lines and -e... /bin/grep
    checking for egrep... /bin/grep -E
    checking for a sed that does not truncate output... /bin/sed
    checking for pkg-config... /usr/bin/pkg-config
    checking pkg-config is at least version 0.9.0... yes
    checking for cc... cc
    checking whether the C compiler works... yes
    checking for C compiler default output file name... a.out
    checking for suffix of executables...
    checking whether we are cross compiling... no
    checking for suffix of object files... o
    checking whether we are using the GNU C compiler... yes
    checking whether cc accepts -g... yes
    checking for cc option to accept ISO C89... none needed
    checking how to run the C preprocessor... cc -E
    checking for icc... no
    checking for suncc... no
    checking for system library directory... lib
    checking if compiler supports -R... no
    checking if compiler supports -Wl,-rpath,... yes
    checking build system type... x86_64-pc-linux-gnu
    checking host system type... x86_64-pc-linux-gnu
    checking target system type... x86_64-pc-linux-gnu
    checking for PHP prefix... /usr/local
    checking for PHP includes... -I/usr/local/include/php -I/usr/local/include/php/main -I/usr/local/include/php/TSRM -I/usr/local/include/php/Zend -I/usr/local/include/php/ext -I/usr/local/include/php/ext/date/lib
    checking for PHP extension directory... /usr/local/lib/php/extensions/no-debug-non-zts-20190902
    checking for PHP installed headers prefix... /usr/local/include/php
    checking if debug is enabled... no
    checking if zts is enabled... no
    checking for gawk... no
    checking for nawk... nawk
    checking if nawk is broken... no
    checking for MySQLi support... yes, shared
    checking for specified location of the MySQL UNIX socket... no
    checking for MySQL UNIX socket location... no
    checking for a sed that does not truncate output... /bin/sed
    checking for ld used by cc... /usr/bin/ld
    checking if the linker (/usr/bin/ld) is GNU ld... yes
    checking for /usr/bin/ld option to reload object files... -r
    checking for BSD-compatible nm... /usr/bin/nm -B
    checking whether ln -s works... yes
    checking how to recognize dependent libraries... pass_all
    checking for ANSI C header files... yes
    checking for sys/types.h... yes
    checking for sys/stat.h... yes
    checking for stdlib.h... yes
    checking for string.h... yes
    checking for memory.h... yes
    checking for strings.h... yes
    checking for inttypes.h... yes
    checking for stdint.h... yes
    checking for unistd.h... yes
    checking dlfcn.h usability... yes
    checking dlfcn.h presence... yes
    checking for dlfcn.h... yes
    checking the maximum length of command line arguments... 1572864
    checking command to parse /usr/bin/nm -B output from cc object... ok
    checking for objdir... .libs
    checking for ar... ar
    checking for ranlib... ranlib
    checking for strip... strip
    checking if cc supports -fno-rtti -fno-exceptions... no
    checking for cc option to produce PIC... -fPIC
    checking if cc PIC flag -fPIC works... yes
    checking if cc static flag -static works... yes
    checking if cc supports -c -o file.o... yes
    checking whether the cc linker (/usr/bin/ld -m elf_x86_64) supports shared libraries... yes
    checking whether -lc should be explicitly linked in... no
    checking dynamic linker characteristics... GNU/Linux ld.so
    checking how to hardcode library paths into programs... immediate
    checking whether stripping libraries is possible... yes
    checking if libtool supports shared libraries... yes
    checking whether to build shared libraries... yes
    checking whether to build static libraries... no

    creating libtool
    appending configuration tag "CXX" to libtool
    configure: patching config.h.in
    configure: creating ./config.status
    config.status: creating config.h
    /bin/bash /usr/src/php/ext/mysqli/libtool --mode=compile cc -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/usr/src/php/ext/mysqli -DPHP_ATOM_INC -I/usr/src/php/ext/mysqli/include -I/usr/src/php/ext/mysqli/main -I/usr/src/php/ext/mysqli -I/usr/local/include/php -I/usr/local/include/php/main -I/usr/local/include/php/TSRM -I/usr/local/include/php/Zend -I/usr/local/include/php/ext -I/usr/local/include/php/ext/date/lib  -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H  -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64   -c /usr/src/php/ext/mysqli/mysqli.c -o mysqli.lo
    mkdir .libs
    cc -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/usr/src/php/ext/mysqli -DPHP_ATOM_INC -I/usr/src/php/ext/mysqli/include -I/usr/src/php/ext/mysqli/main -I/usr/src/php/ext/mysqli -I/usr/local/include/php -I/usr/local/include/php/main -I/usr/local/include/php/TSRM -I/usr/local/include/php/Zend -I/usr/local/include/php/ext -I/usr/local/include/php/ext/date/lib -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -c /usr/src/php/ext/mysqli/mysqli.c  -fPIC -DPIC -o .libs/mysqli.o
    /bin/bash /usr/src/php/ext/mysqli/libtool --mode=compile cc -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/usr/src/php/ext/mysqli -DPHP_ATOM_INC -I/usr/src/php/ext/mysqli/include -I/usr/src/php/ext/mysqli/main -I/usr/src/php/ext/mysqli -I/usr/local/include/php -I/usr/local/include/php/main -I/usr/local/include/php/TSRM -I/usr/local/include/php/Zend -I/usr/local/include/php/ext -I/usr/local/include/php/ext/date/lib  -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H  -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64   -c /usr/src/php/ext/mysqli/mysqli_api.c -o mysqli_api.lo
    cc -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/usr/src/php/ext/mysqli -DPHP_ATOM_INC -I/usr/src/php/ext/mysqli/include -I/usr/src/php/ext/mysqli/main -I/usr/src/php/ext/mysqli -I/usr/local/include/php -I/usr/local/include/php/main -I/usr/local/include/php/TSRM -I/usr/local/include/php/Zend -I/usr/local/include/php/ext -I/usr/local/include/php/ext/date/lib -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -c /usr/src/php/ext/mysqli/mysqli_api.c  -fPIC -DPIC -o .libs/mysqli_api.o
    /bin/bash /usr/src/php/ext/mysqli/libtool --mode=compile cc -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/usr/src/php/ext/mysqli -DPHP_ATOM_INC -I/usr/src/php/ext/mysqli/include -I/usr/src/php/ext/mysqli/main -I/usr/src/php/ext/mysqli -I/usr/local/include/php -I/usr/local/include/php/main -I/usr/local/include/php/TSRM -I/usr/local/include/php/Zend -I/usr/local/include/php/ext -I/usr/local/include/php/ext/date/lib  -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H  -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64   -c /usr/src/php/ext/mysqli/mysqli_prop.c -o mysqli_prop.lo
    cc -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/usr/src/php/ext/mysqli -DPHP_ATOM_INC -I/usr/src/php/ext/mysqli/include -I/usr/src/php/ext/mysqli/main -I/usr/src/php/ext/mysqli -I/usr/local/include/php -I/usr/local/include/php/main -I/usr/local/include/php/TSRM -I/usr/local/include/php/Zend -I/usr/local/include/php/ext -I/usr/local/include/php/ext/date/lib -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -c /usr/src/php/ext/mysqli/mysqli_prop.c  -fPIC -DPIC -o .libs/mysqli_prop.o
    /bin/bash /usr/src/php/ext/mysqli/libtool --mode=compile cc -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/usr/src/php/ext/mysqli -DPHP_ATOM_INC -I/usr/src/php/ext/mysqli/include -I/usr/src/php/ext/mysqli/main -I/usr/src/php/ext/mysqli -I/usr/local/include/php -I/usr/local/include/php/main -I/usr/local/include/php/TSRM -I/usr/local/include/php/Zend -I/usr/local/include/php/ext -I/usr/local/include/php/ext/date/lib  -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H  -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64   -c /usr/src/php/ext/mysqli/mysqli_nonapi.c -o mysqli_nonapi.lo
    cc -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/usr/src/php/ext/mysqli -DPHP_ATOM_INC -I/usr/src/php/ext/mysqli/include -I/usr/src/php/ext/mysqli/main -I/usr/src/php/ext/mysqli -I/usr/local/include/php -I/usr/local/include/php/main -I/usr/local/include/php/TSRM -I/usr/local/include/php/Zend -I/usr/local/include/php/ext -I/usr/local/include/php/ext/date/lib -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -c /usr/src/php/ext/mysqli/mysqli_nonapi.c  -fPIC -DPIC -o .libs/mysqli_nonapi.o
    /bin/bash /usr/src/php/ext/mysqli/libtool --mode=compile cc -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/usr/src/php/ext/mysqli -DPHP_ATOM_INC -I/usr/src/php/ext/mysqli/include -I/usr/src/php/ext/mysqli/main -I/usr/src/php/ext/mysqli -I/usr/local/include/php -I/usr/local/include/php/main -I/usr/local/include/php/TSRM -I/usr/local/include/php/Zend -I/usr/local/include/php/ext -I/usr/local/include/php/ext/date/lib  -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H  -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64   -c /usr/src/php/ext/mysqli/mysqli_fe.c -o mysqli_fe.lo
    cc -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/usr/src/php/ext/mysqli -DPHP_ATOM_INC -I/usr/src/php/ext/mysqli/include -I/usr/src/php/ext/mysqli/main -I/usr/src/php/ext/mysqli -I/usr/local/include/php -I/usr/local/include/php/main -I/usr/local/include/php/TSRM -I/usr/local/include/php/Zend -I/usr/local/include/php/ext -I/usr/local/include/php/ext/date/lib -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -c /usr/src/php/ext/mysqli/mysqli_fe.c  -fPIC -DPIC -o .libs/mysqli_fe.o
    /bin/bash /usr/src/php/ext/mysqli/libtool --mode=compile cc -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/usr/src/php/ext/mysqli -DPHP_ATOM_INC -I/usr/src/php/ext/mysqli/include -I/usr/src/php/ext/mysqli/main -I/usr/src/php/ext/mysqli -I/usr/local/include/php -I/usr/local/include/php/main -I/usr/local/include/php/TSRM -I/usr/local/include/php/Zend -I/usr/local/include/php/ext -I/usr/local/include/php/ext/date/lib  -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H  -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64   -c /usr/src/php/ext/mysqli/mysqli_report.c -o mysqli_report.lo
    cc -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/usr/src/php/ext/mysqli -DPHP_ATOM_INC -I/usr/src/php/ext/mysqli/include -I/usr/src/php/ext/mysqli/main -I/usr/src/php/ext/mysqli -I/usr/local/include/php -I/usr/local/include/php/main -I/usr/local/include/php/TSRM -I/usr/local/include/php/Zend -I/usr/local/include/php/ext -I/usr/local/include/php/ext/date/lib -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -c /usr/src/php/ext/mysqli/mysqli_report.c  -fPIC -DPIC -o .libs/mysqli_report.o
    /bin/bash /usr/src/php/ext/mysqli/libtool --mode=compile cc -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/usr/src/php/ext/mysqli -DPHP_ATOM_INC -I/usr/src/php/ext/mysqli/include -I/usr/src/php/ext/mysqli/main -I/usr/src/php/ext/mysqli -I/usr/local/include/php -I/usr/local/include/php/main -I/usr/local/include/php/TSRM -I/usr/local/include/php/Zend -I/usr/local/include/php/ext -I/usr/local/include/php/ext/date/lib  -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H  -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64   -c /usr/src/php/ext/mysqli/mysqli_driver.c -o mysqli_driver.lo
    cc -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/usr/src/php/ext/mysqli -DPHP_ATOM_INC -I/usr/src/php/ext/mysqli/include -I/usr/src/php/ext/mysqli/main -I/usr/src/php/ext/mysqli -I/usr/local/include/php -I/usr/local/include/php/main -I/usr/local/include/php/TSRM -I/usr/local/include/php/Zend -I/usr/local/include/php/ext -I/usr/local/include/php/ext/date/lib -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -c /usr/src/php/ext/mysqli/mysqli_driver.c  -fPIC -DPIC -o .libs/mysqli_driver.o
    /bin/bash /usr/src/php/ext/mysqli/libtool --mode=compile cc -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/usr/src/php/ext/mysqli -DPHP_ATOM_INC -I/usr/src/php/ext/mysqli/include -I/usr/src/php/ext/mysqli/main -I/usr/src/php/ext/mysqli -I/usr/local/include/php -I/usr/local/include/php/main -I/usr/local/include/php/TSRM -I/usr/local/include/php/Zend -I/usr/local/include/php/ext -I/usr/local/include/php/ext/date/lib  -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H  -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64   -c /usr/src/php/ext/mysqli/mysqli_warning.c -o mysqli_warning.lo
    cc -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/usr/src/php/ext/mysqli -DPHP_ATOM_INC -I/usr/src/php/ext/mysqli/include -I/usr/src/php/ext/mysqli/main -I/usr/src/php/ext/mysqli -I/usr/local/include/php -I/usr/local/include/php/main -I/usr/local/include/php/TSRM -I/usr/local/include/php/Zend -I/usr/local/include/php/ext -I/usr/local/include/php/ext/date/lib -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -c /usr/src/php/ext/mysqli/mysqli_warning.c  -fPIC -DPIC -o .libs/mysqli_warning.o
    /bin/bash /usr/src/php/ext/mysqli/libtool --mode=compile cc -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/usr/src/php/ext/mysqli -DPHP_ATOM_INC -I/usr/src/php/ext/mysqli/include -I/usr/src/php/ext/mysqli/main -I/usr/src/php/ext/mysqli -I/usr/local/include/php -I/usr/local/include/php/main -I/usr/local/include/php/TSRM -I/usr/local/include/php/Zend -I/usr/local/include/php/ext -I/usr/local/include/php/ext/date/lib  -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H  -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64   -c /usr/src/php/ext/mysqli/mysqli_exception.c -o mysqli_exception.lo
    cc -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/usr/src/php/ext/mysqli -DPHP_ATOM_INC -I/usr/src/php/ext/mysqli/include -I/usr/src/php/ext/mysqli/main -I/usr/src/php/ext/mysqli -I/usr/local/include/php -I/usr/local/include/php/main -I/usr/local/include/php/TSRM -I/usr/local/include/php/Zend -I/usr/local/include/php/ext -I/usr/local/include/php/ext/date/lib -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -c /usr/src/php/ext/mysqli/mysqli_exception.c  -fPIC -DPIC -o .libs/mysqli_exception.o
    /bin/bash /usr/src/php/ext/mysqli/libtool --mode=compile cc -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/usr/src/php/ext/mysqli -DPHP_ATOM_INC -I/usr/src/php/ext/mysqli/include -I/usr/src/php/ext/mysqli/main -I/usr/src/php/ext/mysqli -I/usr/local/include/php -I/usr/local/include/php/main -I/usr/local/include/php/TSRM -I/usr/local/include/php/Zend -I/usr/local/include/php/ext -I/usr/local/include/php/ext/date/lib  -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H  -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64   -c /usr/src/php/ext/mysqli/mysqli_result_iterator.c -o mysqli_result_iterator.lo
    cc -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/usr/src/php/ext/mysqli -DPHP_ATOM_INC -I/usr/src/php/ext/mysqli/include -I/usr/src/php/ext/mysqli/main -I/usr/src/php/ext/mysqli -I/usr/local/include/php -I/usr/local/include/php/main -I/usr/local/include/php/TSRM -I/usr/local/include/php/Zend -I/usr/local/include/php/ext -I/usr/local/include/php/ext/date/lib -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -c /usr/src/php/ext/mysqli/mysqli_result_iterator.c  -fPIC -DPIC -o .libs/mysqli_result_iterator.o
    /bin/bash /usr/src/php/ext/mysqli/libtool --mode=link cc -DPHP_ATOM_INC -I/usr/src/php/ext/mysqli/include -I/usr/src/php/ext/mysqli/main -I/usr/src/php/ext/mysqli -I/usr/local/include/php -I/usr/local/include/php/main -I/usr/local/include/php/TSRM -I/usr/local/include/php/Zend -I/usr/local/include/php/ext -I/usr/local/include/php/ext/date/lib  -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H  -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64  -Wl,-O1 -pie  -o mysqli.la -export-dynamic -avoid-version -prefer-pic -module -rpath /usr/src/php/ext/mysqli/modules  mysqli.lo mysqli_api.lo mysqli_prop.lo mysqli_nonapi.lo mysqli_fe.lo mysqli_report.lo mysqli_driver.lo mysqli_warning.lo mysqli_exception.lo mysqli_result_iterator.lo
    cc -shared  .libs/mysqli.o .libs/mysqli_api.o .libs/mysqli_prop.o .libs/mysqli_nonapi.o .libs/mysqli_fe.o .libs/mysqli_report.o .libs/mysqli_driver.o .libs/mysqli_warning.o .libs/mysqli_exception.o .libs/mysqli_result_iterator.o   -Wl,-O1 -Wl,-soname -Wl,mysqli.so -o .libs/mysqli.so
    creating mysqli.la
    (cd .libs && rm -f mysqli.la && ln -s ../mysqli.la mysqli.la)
    /bin/bash /usr/src/php/ext/mysqli/libtool --mode=install cp ./mysqli.la /usr/src/php/ext/mysqli/modules
    cp ./.libs/mysqli.so /usr/src/php/ext/mysqli/modules/mysqli.so
    cp ./.libs/mysqli.lai /usr/src/php/ext/mysqli/modules/mysqli.la
    PATH="$PATH:/sbin" ldconfig -n /usr/src/php/ext/mysqli/modules
    ----------------------------------------------------------------------
    Libraries have been installed in:
      /usr/src/php/ext/mysqli/modules

    If you ever happen to want to link against installed libraries
    in a given directory, LIBDIR, you must either use libtool, and
    specify the full pathname of the library, or use the `-LLIBDIR'
    flag during linking and do at least one of the following:
      - add LIBDIR to the `LD_LIBRARY_PATH' environment variable
        during execution
      - add LIBDIR to the `LD_RUN_PATH' environment variable
        during linking
      - use the `-Wl,--rpath -Wl,LIBDIR' linker flag
      - have your system administrator add LIBDIR to `/etc/ld.so.conf'

    See any operating system documentation about shared libraries for
    more information, such as the ld(1) and ld.so(8) manual pages.
    ----------------------------------------------------------------------

    Build complete.
    Don't forget to run 'make test'.

    + strip --strip-all modules/mysqli.so
    Installing shared extensions:     /usr/local/lib/php/extensions/no-debug-non-zts-20190902/
    Installing header files:          /usr/local/include/php/
    find . -name \*.gcno -o -name \*.gcda | xargs rm -f
    find . -name \*.lo -o -name \*.o | xargs rm -f
    find . -name \*.la -o -name \*.a | xargs rm -f
    find . -name \*.so | xargs rm -f
    find . -name .libs -a -type d|xargs rm -rf
    rm -f libphp.la      modules/* libs/*

~ took 8,0s …
➜ docker container stop meusite
    meusite
~ …

➜ docker container start meusite
    meusite
~ …

➜ docker container ls | egrep meu
    4b3c456b090d   php:7.4-apache   "docker-php-entrypoi…"   8 minutes ago    Up About a minute   0.0.0.0:8000->80/tcp, :::8000->80/tcp   meusite
    68a0ae8de838   mysql:8-debian   "docker-entrypoint.s…"   25 minutes ago   Up 25 minutes       3306/tcp, 33060/tcp                     meudb1
~ …

➜ docker container inspect meudb1 | egrep -i ipadd
            "SecondaryIPAddresses": null,
            "IPAddress": "172.17.0.2",
                    "IPAddress": "172.17.0.2",
~ …

➜ nano meusite/config.php

~ took 4,7s …
➜ nano meusite/config.php

~ took 15,9s …
➜ nano meusite/config.php
~ …

➜ nano meusite/index.php

~ took 14,2s …
➜ nano meusite/index.php

~ took 2,0s …
➜ nano meusite/create.php

~ took 6,3s …
➜ docker exec -it meudb1 mysql -u root -p
    Enter password:
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 33
    Server version: 8.0.33 MySQL Community Server - GPL

    Copyright (c) 2000, 2023, Oracle and/or its affiliates.

    Oracle is a registered trademark of Oracle Corporation and/or its
    affiliates. Other names may be trademarks of their respective
    owners.

    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

    mysql> select * from employees;
    ERROR 1046 (3D000): No database selected
    mysql> exit
    Bye

~ took 5m 19,0s …
➜ docker run --name meuphpmyadmin -d -e PMA_HOST:172.17.0.2 -p 8080:80 phpmyadmim:5.2-apache
    Unable to find image 'phpmyadmim:5.2-apache' locally
    docker: Error response from daemon: pull access denied for phpmyadmim, repository does not exist or may require 'docker login': denied: requested access to the resource is denied.
    See 'docker run --help'.

~ took 2,1s …
➜ docker run --name meuphpmyadmin -d -e PMA_HOST:meudb1 -p 8081:80 phpmyadmim:5.2-apache
    Unable to find image 'phpmyadmim:5.2-apache' locally
    docker: Error response from daemon: pull access denied for phpmyadmim, repository does not exist or may require 'docker login': denied: requested access to the resource is denied.
    See 'docker run --help'.

~ took 2,1s …
➜ docker run --name meuphpmyadmin1 -d -e PMA_HOST:meudb1 -p 8081:80 phpmyadmim:5.2-apache
    Unable to find image 'phpmyadmim:5.2-apache' locally
    docker: Error response from daemon: pull access denied for phpmyadmim, repository does not exist or may require 'docker login': denied: requested access to the resource is denied.
    See 'docker run --help'.

~ took 2,1s …
➜ docker run --name meuphpmyadmin -d -e PMA_HOST:meudb1 -p 8081:80 phpmyadmin:5.2-apache
    Unable to find image 'phpmyadmin:5.2-apache' locally
    5.2-apache: Pulling from library/phpmyadmin
    f03b40093957: Already exists
    662d8f2fcdb9: Pull complete
    78fe0ef5ed77: Pull complete
    4e258eed73a3: Pull complete
    1ddd4f300547: Pull complete
    0edd0b2ea53b: Pull complete
    ee9d310c9717: Pull complete
    10f4ca99bf3f: Pull complete
    aa560a783174: Pull complete
    828f2c4fe346: Pull complete
    92571fee089f: Pull complete
    3a5c97571a46: Pull complete
    2848e7859ccd: Pull complete
    83a37bd858bf: Pull complete
    a54bb6552448: Pull complete
    e0bc447eec1e: Pull complete
    6e7f74162408: Pull complete
    51abc27418f1: Pull complete
    Digest: sha256:e325ca470dc87c08c430dc8c534e0198c881ea3e9474b1a3824d76c285f96495
    Status: Downloaded newer image for phpmyadmin:5.2-apache
    ec7774aedb32eb4eb4ebedff36b9c95e61326611859fad01f01d4fb2e4fd0138

~ took 12,0s …
➜