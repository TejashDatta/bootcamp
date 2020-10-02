#!/bin/bash

find . -name "*.sh" ! -empty -exec chown tejash {} \; -exec chmod a=x {} \; -exec {} \;

HTTP_STATUS_CODE=$(curl -L -s -w "%{http_code}" -o /dev/null https://postman-echo.com/post \
--data "$(ps ux | grep -e PID -e "\.sh" | tail -5)" )

if [[ HTTP_STATUS_CODE == 200 ]]; then
  echo "プロセスリストをアップロードしました。"
else
  echo "プロセスリストのアップロードが失敗しました。"
fi