#!/bin/bash

key="secret"
n="task#id@project"
m="command"
a="df -h"
t="127.0.0.1"

# MD5 supported, but not recommended:
#s=`echo -n $n$m$t$key|md5sum|cut -d' ' -f1`
s=`echo -n $n$m$t$key|sha256sum|cut -d' ' -f1`

generate_post_data()
{
  cat <<EOF
{
  "n":"$n",
  "m":"$m",
  "a":"$a",
  "t":"$t",
  "s":"$s"
}
EOF
}

#echo "Key = "$s

curl  --data "$(generate_post_data)" -H "Content-Type: application/json" -X POST http://localhost:8765/command | json_pp
