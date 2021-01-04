#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/chien/ros_yolact/src/vision/get_rs_image"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/chien/ros_yolact/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/chien/ros_yolact/install/lib/python2.7/dist-packages:/home/chien/ros_yolact/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/chien/ros_yolact/build" \
    "/usr/bin/python2" \
    "/home/chien/ros_yolact/src/vision/get_rs_image/setup.py" \
     \
    build --build-base "/home/chien/ros_yolact/build/vision/get_rs_image" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/chien/ros_yolact/install" --install-scripts="/home/chien/ros_yolact/install/bin"
