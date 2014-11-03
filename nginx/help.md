# How to use this image

## hosting some simple static content

`docker run --name some-nginx -v /some/content:/usr/share/nginx/html:ro -d nginx`

Alternatively, a simple Dockerfile can be used to generate a new image that includes the necessary content (which is a much cleaner solution than the bind mount above):

`
FROM nginx
COPY static-html-directory /usr/share/nginx/html
`

Place this file in the same directory as your directory of content (“static-html-directory”), run docker build -t some-content-nginx ., then start your container:

`docker run --name some-nginx -d some-content-nginx`

## exposing the port

`docker run --name some-nginx -d -p 8080:80 some-content-nginx`

Then you can hit http://localhost:8080 or http://host-ip:8080 in your browser.

## complex configuration

`docker run --name some-nginx -v /some/nginx.conf:/etc/nginx/nginx.conf:ro -d nginx`

For information on the syntax of the Nginx configuration files, see the official documentation (specifically the Beginner's Guide).

Be sure to include daemon off; in your custom configuration to ensure that Nginx stays in the foreground so that Docker can track the process properly (otherwise your container will stop immediately after starting)!

If you wish to adapt the default configuration, use something like the following to copy it from a running Nginx container:

`docker cp some-nginx:/etc/nginx/nginx.conf /some/nginx.conf`

As above, this can also be accomplished more cleanly using a simple Dockerfile:

`
FROM nginx
COPY nginx.conf /etc/nginx/nginx.conf
`

Then, build with docker build -t some-custom-nginx . and run:

`docker run --name some-nginx -d some-custom-nginx`