# docker-adminer

[Adminer](http://www.adminer.org/en/) is a full-featured database management
tool for the web. It is a lightweight alternative to setting up phpMyAdmin.
This is a [docker](https://www.docker.com) image that eases setup.

![](http://www.adminer.org/static/designs/hever/screenshot.png)

See also [online demo](http://adminer.sourceforge.net/adminer.php?username=).

## Usage

This docker image is available as an [automated build on the docker registry](https://registry.hub.docker.com/u/dehy/adminer/).

The recommended way to run this container looks like this:

```bash
$ sudo docker run --link=mysql:mysql -d -p 80:80 dehy/adminer
```

The above example exposes the Adminer webinterface on port 80, so that you can now browse to:

```
http://localhost/
```

This is a rather common setup following docker's conventions:

* `--link={database_container}:{alias}` will link a separate *database_container* (MySQL, PostgreSQL, ...) to this container, thus make possible to connect to it via adminer with *alias* hostname
* `-d` will run a detached instance in the background
* `-p {OutsidePort}:80` will bind the webserver to the given outside port
* `dehy/adminer` the name of this docker image
