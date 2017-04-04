#!/bin/bash

LISTS=list.txt
HTML_NAME="video.html"
url="http://10.0.60.99:8099/casetest/"

echo "" > ts.txt

echo "<head></head><body>" > $HTML_NAME

while read line
do
#       echo "Line # $i: $line"
	vFile=`echo $line |  awk '{print $1}'`
	vTarget=`echo $line |  awk '{print $2}'`
	vTip=`echo $line |  awk '{print $3}'`

	echo "log:" $vFile $vTarget $vTip
	./ts2mp4 $vFile $vFile.mp4 >/dev/null 2>/dev/null
	vRet=$?

	if [ $vRet = 0 ];then
		echo $vFile >> ts.txt
	fi

	echo "<a href=\""  >> $HTML_NAME
        echo $url$vFile.mp4  >> $HTML_NAME
        echo "\">$vFile.mp4</a>"  >> $HTML_NAME

	echo "<a href=\""  >> $HTML_NAME
        echo $url$vFile.org.mp4  >> $HTML_NAME
        echo "\">$vFile.org.mp4</a>"  >> $HTML_NAME

	echo "target:"$vTarget "tip:"$vTip "ret:"$vRet >> $HTML_NAME
        echo "<br>" >> $HTML_NAME
	echo "output:"$vOuptput  >> $HTML_NAME
        echo "<br>" >> $HTML_NAME
done < list.txt

echo "</body></html>" >> $HTML_NAME

./sub.sh
