# PHP with Apache and FTP container layout

## Filesystem layout

Directory                       | Description
------------------------------- | ------------------------------------------------------------------------------
`/opt/docker/etc/httpd`         | Apache configuration
`/opt/docker/etc/httpd/ssl`     | Apache ssl configuration with example server.crt, server.csr, server.key

File                                                | Description
--------------------------------------------------- | ------------------------------------------------------------------------------
`/opt/docker/etc/httpd/main.conf`                   | Main include file (will include `global.conf`, `php.conf` and `vhost.conf`) 
`/opt/docker/etc/httpd/global.conf`                 | Global apache configuration options
`/opt/docker/etc/httpd/php.conf`                    | PHP configuration (connection to FPM)
`/opt/docker/etc/httpd/vhost.common.conf`           | Vhost common stuff (placeholder)
`/opt/docker/etc/httpd/vhost.conf`                  | Default vhost
`/opt/docker/etc/httpd/vhost.ssl.conf`              | Default ssl configuration for vhost
`/opt/docker/etc/php/fpm/php-fpm.conf`              | PHP FPM daemon configuration
`/opt/docker/etc/php/fpm/pool.d/application.conf`   | PHP FPM pool configuration

## Environment variables

Variable              | Description
--------------------- |  ------------------------------------------------------------------------------
`CLI_SCRIPT`          | Predefined CLI script for service
`APPLICATION_UID`     | PHP-FPM UID (Effective user ID)
`APPLICATION_GID`     | PHP-FPM GID (Effective group ID)
`WEB_DOCUMENT_ROOT`   | Document root for Nginx
`WEB_DOCUMENT_INDEX`  | Document index (eg. `index.php`) for Nginx
`WEB_ALIAS_DOMAIN`    | Alias domains (eg. `*.vm`) for Nginx
`SFTP_USERS`          | FTP accounts - format `user:pass[:e][:uid[:gid[:dir1[,dir2]...]]] ...`

