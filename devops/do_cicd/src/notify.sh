#!/bin/bash


URL="https://api.telegram.org/bot6766309167:AAG53YMoifuQX4gAzxCrFuLOBN-WF099eLo/sendMessage"
TEXT="Deploy status: $CI_JOB_NAME%0AProject name: $CI_PROJECT_NAME%0AStatus: $CI_JOB_STATUS%0AURL: $CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/"

curl -s -d "chat_id=424109460&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null