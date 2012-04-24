#! /bin/sh

if [ -f /sys/bus/iio/devices/iio:device0/name ]
then
	foo=`cat /sys/bus/iio/devices/iio:device1/name`
fi

if [ $foo == "cf-ad9643-core-hpc" ]
then
	cp /var/www/data/left_2xcomm.htm /var/www/data/left.htm
fi

