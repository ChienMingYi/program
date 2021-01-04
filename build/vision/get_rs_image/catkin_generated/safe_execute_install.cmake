execute_process(COMMAND "/home/chien/ros_yolact/build/vision/get_rs_image/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/chien/ros_yolact/build/vision/get_rs_image/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
