# PHP Builds

:warning: **WARNING: DON'T USE IN PRODUCTION. THERE ARE STILL ROOM FOR OPTIMIZATION. GO AHEAD AND DO IT**

## Images

| Base Image    | Tag                         | Exposed Ports |
|---------------|-----------------------------|---------------|
| `php:8.3-fpm` | `sirajul/php:fpm-83-latest` | `80`, `9000`  |
| `php:8.3-cli` | `sirajul/php:cli-83-latest` | **N/A**       |
| `php:8.3-zts` | `sirajul/php:zts-83-latest` | **N/A**       |

**NOTE**: Image `fpm-*` has `nginx` installed as web server listening on port `80` with project root set to `/var/www/html/public`.

## Executables

- `bash`
- `curl`
- `nano`
- `vim`
- `less`
- `unzip`
- `zip`
- `git`
- `jq`
- `composer` (v2)

## Extending base image

- To install a new php module, you can also use [`/usr/local/bin/install-php-extensions`](https://github.com/mlocati/docker-php-extension-installer), which takes care of all the dependencies e.g; `/usr/local/bin/install-php-extensions xdebug opcache gd`.
- Supervisor is available in both the `fpm-*` and `worker-*` images. To add a new supervisor configuration, add it to `/etc/supervisor/conf.d/` directory.

## Available Modules

- `bcmath`
- `gd`
- `gmp`
- `intl`
- `mbstring`
- `mcrypt`
- `pcntl`
- `PDO`
- `pdo_mysql`
- `pdo_pgsql`
- `pdo_sqlite`
- `posix`
- `redis`
- `sockets`
- `sodium`
- `zip`
- `zlib`
