# hi1032dockervnc

A small little repo for running a docker image with `xfce4`, `vnc`, `xplot.org` and `tcptrace`.
The directory `shared` is mounted to the image by default on `/shared`.

## Build with

```bash
./build.sh
```

## Run with

```bash
./start.sh
```

## Connect

The image runs a vnc server on `localhost:5901` with the password: `password` by default. You can connect with something like `RealVNCViewer` or `Remmina`.
