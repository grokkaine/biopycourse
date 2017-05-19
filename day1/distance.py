#!/usr/bin/env python3
# -*- coding: utf-8 -*-


import math

def euclidian(x1,y1,x2,y2):
    dist = (((x2 - x1)**2) + ((y2 - y1)**2))
    dist1 = math.sqrt(dist)
    return(dist1)
