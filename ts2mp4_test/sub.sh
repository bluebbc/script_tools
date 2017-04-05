#!/bin/bash


 
FILES=`cat ts.txt`
 
for file in $FILES ;do
	echo $file
	ffmpeg -i $file -c copy -bsf:a aac_adtstoasc  $file.org.mp4 -y 1>/dev/null 2>/dev/null
done
