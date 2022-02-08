#!/bin/bash
# Basic function

case "$1" in
	"start")
		/usr/local/bin/mjpg_streamer -i "input_uvc.so -r 854x480 -d /dev/video2 -f 24 -q 80" -o "output_http.so -p 8085 -w /usr/local/share/mjpg-streamer/www" &
		/usr/local/bin/mjpg_streamer -i "input_uvc.so -r 854x480 -d /dev/video0 -f 24 -q 80" -o "output_http.so -p 8080 -w /usr/local/share/mjpg-streamer/www" &
		python3 /home/pi/Desktop/chatibotv2.py &
		;;

	"stop")
		process_id=`/bin/ps -C python3 -o pid=`
		kill $process_id
		process2_id=`/bin/ps -C mjpg_streamer -o pid=`
		kill $process2_id
		;;
	*)
	echo "escribe el argumento correcto"
	exit 1
	;;
esac


