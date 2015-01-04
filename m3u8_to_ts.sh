#!/bin/bash
ALBUM_ID=$1
VIDEO_ID=$2
BITS_ID=$3
TS_FILE=$4

M3U8_URL="http://jsmeta.video.gitv.tv/${ALBUM_ID}/${VIDEO_ID}/${BITS_ID}.m3u8"
M3U8_FILE="${ALBUM_ID}_${VIDEO_ID}_${BITS_ID}.m3u8"
wget ${M3U8_URL} -O ${M3U8_FILE}

TEMP_TS="tmp.ts"
for i in `cat ${M3U8_FILE} | grep ".ts"`
do
    wget $i -O ${TEMP_TS}
    cat ${TEMP_TS} >>${TS_FILE}
    rm -rf ${TEMP_TS}
done
