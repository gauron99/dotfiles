#!/usr/bin/bash
#author: gauron99

if [ "$FUNC_BIN_PATH" != "" ];then
  echo "FUNC_BIN_PATH is not empty"
  exit 0
fi
echo "FUNC_BIN_PATH is empty"
exit 1
