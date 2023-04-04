from machine import Pin
import time

trig = Pin(17, Pin.OUT) #Setting Trig Pin as Output pin on Pin GPIO17
echo = Pin(16, Pin.IN, Pin.PULL_DOWN) #Setting Echo Pin to Pull down on Pin GPIO16. 


def GetDistance():
     trig.value(0)
     time.sleep(.1)
     trig.value(1)
     time.sleep_us(2) # 2 Microsecond delay notice the _us
     trig.value(0)
     while echo.value()==0:
         pulse_start = time.ticks_us()
     while echo.value()==1:
          pulse_end = time.ticks_us()
     pulse_duration = pulse_end - pulse_start
     distance = pulse_duration * 17165 / 1000000 # multiply Delta T by speed of sound to get distance
     distance = round(distance, 0)
     print ('Distance:',"{:.0f}".format(distance),'cm')
     time.sleep(.1)
     return distance
    

while True:
    GetDistance() #call the distance formula 