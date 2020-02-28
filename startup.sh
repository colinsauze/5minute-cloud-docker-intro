#!/bin/bash

nginx

#loop forever 
while [ "0" = "0" ] ; do
    time=$(date +%H:%M:%S) 

    echo "My latest random number is $RANDOM and the time is $time" > /usr/share/nginx/html/index.html
    sleep 1

done