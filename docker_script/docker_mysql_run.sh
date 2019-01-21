docker run --name my-mysql \
    -e MYSQL_ROOT_PASSWORD=admin \
    -v /home/lyx/data/mysql/data:/var/lib/mysql \
    -p 3306:3306 \
    -d mysql:5.7

    # -v /home/lyx/data/mysql/conf.d:/etc/mysql/conf.d \
