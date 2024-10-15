#!/bin/bash
#

SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" # 이 스크립트 파일의 절대경로
echo "SCRIPT_PATH=${SCRIPT_PATH}"

# Uninstall Tuist
curl -Ls https://uninstall.tuist.io | bash

# mise 설치
brew install mise
echo "mise 를 활성화 시키려면 다음 페이지를 참고하세요.(https://mise.jdx.dev/getting-started.html#_2a-activate-mise)" 

# tuist 설치
. "${SCRIPT_PATH}"/_env.sh
echo "TUIST_VERSION=${TUIST_VERSION}"
cd "${SCRIPT_PATH}/../.."
mise install tuist@${TUIST_VERSION}
mise use tuist@${TUIST_VERSION}
