#encoding: utf-8

import math
import numpy as np
import os
import sys
# print('Input lon lat h,fm:')
# lon=input()
# lat=input()
# h=input()
# fm=input()


def lbh2xyz(lon,lat,h,fm):

        if fm == 0:

                lon=lon*math.pi/180

                lat=lat*math.pi/180

        if lat < 0:

                lat=lat+2*math.pi

        a=6378137

        theta0=math.floor((math.pi/2-lat)/0.00005+0.5)*0.00005

        r0=a*np.sin(theta0)

        x=a*lat

        y=r0*lon
        z=h

        return x,y,z

# a=lbh2xyz(lon,lat,h,fm)

path=os.getcwd()

dirs=os.listdir(str.encode(path))

n=1
ff=open("neu",'w+')
for i in dirs:

        if os.path.splitext(i)[1]==".lbh":

                fn=i
                tmp=fn.split('.')
                sta=tmp[0]
                print fn
                print n
                n=n+1
        f=open(fn,'r')
        s=f.readlines()
        fline=s[0].split()
#       print s[0]

        lon = float(fline[0])
        lat = float(fline[1])
        h = float(fline[2])
        fm=0
        neu = lbh2xyz(lon,lat,h,fm)
        print>>ff,neu[0],
        print>>ff,neu[1],
        print>>ff,neu[2],
        print>>ff,sta
