#!/usr/bin/env python3
import rospy

from get_rs_image import Get_image
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import sys
sys.path.insert(1, "/home/chien/.local/lib/python3.6/site-packages/")
from sensor_msgs.msg import Image

import datetime 
#sys.path.insert(1, "/home/iclab-arm/.local/lib/python3.5/site-packages/") 
import cv2
from cv_bridge import CvBridge, CvBridgeError
import numpy as np
import time 
import argparse
import os


parser = argparse.ArgumentParser()
parser.add_argument('--Object_Name', type=str, default='.', help='Class name of training object.')
FLAGS = parser.parse_args()

Object_Name = FLAGS.Object_Name
Train_Data_Dir = os.path.dirname(os.path.realpath(__file__)) + '/Training_Data/' +  Object_Name + '/'


if __name__ == '__main__':
    sub_img = Get_image()
    take_picture_counter = 0
    rospy.init_node('Get_Data')
    
    while not rospy.is_shutdown():
        cv2.imshow('aaa', sub_img.cv_image)
        cv2.waitKey(1)
        if cv2.waitKey(33) & 0xFF == ord('s'):
            name = str(Train_Data_Dir + str(Object_Name + '_' + str(take_picture_counter+1) + ".jpg"))
            cv2.imwrite(name,sub_img.cv_image)
            print("[Save] ", name)
            take_picture_counter += 1
        else:
            pass
    rospy.spin()
    cv2.destroyAllWindows()
