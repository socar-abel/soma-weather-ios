#!/bin/bash
#

SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" # 이 스크립트 파일의 절대경로
echo "SCRIPT_PATH=${SCRIPT_PATH}"

WORKING_PATH="${SCRIPT_PATH}/../.."

mise x -- tuist edit --path=$WORKING_PATH
