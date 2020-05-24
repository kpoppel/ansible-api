#!/bin/bash

host_url=http://localhost:8765
key="YOUR_SIGNATURE_KEY_HERE"

CURL='curl -s'
echo
echo "# POST Command -> /command"
echo "#################################################"
n="task#id@project"
m="command" # or 'script'
a="df -h"
t="127.0.0.1" # all or list: 192.168.10.12,192.168.10.45

# MD5 supported, but not recommended:
#s=`echo -n $n$m$t$key|md5sum|cut -d' ' -f1`
s=`echo -n $n$m$t$key|sha256sum|cut -d' ' -f1`

command_post_data()
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

$CURL --data "$(command_post_data)" -H "Content-Type: application/json" -X POST $host_url/command | json_pp

echo
echo "# GET  Main -> /"
echo "#################################################"
$CURL $host_url/


echo
echo "# FileList -> /filelist"
echo "#################################################"

echo
echo "# FileReadWrite -> /fileitem"
echo "#################################################"

echo
echo "# FileExist -> /fileexist"
echo "#################################################"

echo
echo "# ParseVarsFromFile -> /parsevars"
echo "#################################################"

echo
echo "# POST Playbook -> /playbook"
echo "#################################################"
n="play#id@project"
h="127.0.0.1"
f="playbook.yml"
some_variable="Here_I_AM"
# MD5 supported, but not recommended:
#s=`echo -n $n$m$t$key|md5sum|cut -d' ' -f1`
s=`echo -n $n$h$f$key|sha256sum|cut -d' ' -f1`

playbook_post_data()
{
  cat <<EOF
{
  "n":"$n",
  "h":"$h",
  "f":"$f",
  "s":"$s",
  "v_some_variable":"$some_variable"
}
EOF
}

$CURL --data "$(playbook_post_data)" -H "Content-Type: application/json" -X POST $host_url/playbook | json_pp


echo
echo "# Message ->  /message (needs ws_sub to be defined?)"
echo "#################################################"

echo
echo "# GET  NonBlockTest -> /test"
echo "#################################################"
