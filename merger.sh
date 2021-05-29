#!/usr/bin/env bash

# this will download https://example.com/video/myvideo_X_something.ts with incremental X to file video.ts

BASE_URL=https://example.com/video/
FILE_NAME_BEFORE=myvideo_
FILE_NAME_AFTER=_something.ts

FILE_NAME=video.ts

echo -e "\ndownloading segments..."
I=0
while curl -s ${BASE_URL}${FILE_NAME_BEFORE}${I}${FILE_NAME_AFTER} -o ${FILE_NAME_BEFORE}${I}${FILE_NAME_AFTER}
do
        cat ${FILE_NAME_BEFORE}${I}${FILE_NAME_AFTER} >> $FILE_NAME
        rm ${FILE_NAME_BEFORE}${I}${FILE_NAME_AFTER}
        echo "  segment $I downloaded, merged and deleted"
        I=$(($I+1))
done

echo -e "\ndone."
