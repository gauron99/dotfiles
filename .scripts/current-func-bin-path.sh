#!/usr/bin/bash
#author: gauron99

# this will display the current func binary in use

default_path="~/forked/func"
default="$default_path (default)"

dont_write_path="/home/dfridric/forked"

# will echo current func bin path being used excluding $dont_write_path if it is
# included (otherwise print the whole thing)
if [ "$FUNC_BIN_PATH" != "" ];then
  tmp=$(dirname $FUNC_BIN_PATH) #cut binary at the end
  if [[ "$tmp" == "$dont_write_path"* ]];then
    tmp="${tmp#$dont_write_path}" # cut the dont_write_path part if needed
    tmp=${tmp#/} #cut slash at the end if needed
  fi
  echo "$tmp"
else
  echo "$default"
fi