# How to use this image

## Start a Go instance in your app

The most straightforward way to use this image is to use a Go container as both the build and runtime environment. In your Dockerfile, writing something along the lines of the following will compile and run your project:

`
FROM golang:1.3.1-onbuild
CMD ["./myapp"]
`
This image includes multiple ONBUILD triggers which should cover most applications. The build will COPY . /usr/src/app, RUN go get -d -v, and RUN go build -v.

You can then run and build the Docker image:

`docker build -t my-golang-app
docker run -it --rm --name my-running-app my-golang-app
`

## Compile your app inside the Docker container
There may be occasions where it is not appropriate to run your app inside a container. To compile, but not run your app inside the Docker instance, you can write something like:

`docker run --rm -v "$(pwd)":/usr/src/myapp -w /usr/src/myapp golang:1.3.1 go build -v`


This will add your current directory as a volume to the container, set the working directory to the volume, and run the command go build which will tell go to compile the project in the working directory and output the executable to myapp. Alternatively, if you have a Makefile, you can run the make command inside your container.

`docker run --rm -v "$(pwd)":/usr/src/myapp -w /usr/src/myapp golang:1.3.1 make`

## Cross-compile your app inside the Docker container
If you need to compile your application for a platform other than linux/amd64 (such as windows/386), this can be easily accomplished with the provided cross tags:

`docker run --rm -v "$(pwd)":/usr/src/myapp -w /usr/src/myapp -e GOOS=windows -e GOARCH=386 golang:1.3.1-cross go build -v`

## Alternatively, you can build for multiple platforms at once:

`docker run --rm -it -v "$(pwd)":/usr/src/myapp -w /usr/src/myapp golang:1.3.1-cross bash
$ for GOOS in darwin linux; do
>   for GOARCH in 386 amd64; do
>     go build -v -o myapp-$GOOS-$GOARCH
>   done
> done
`