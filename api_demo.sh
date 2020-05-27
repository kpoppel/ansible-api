#!/bin/bash

host_url=http://localhost:8765
key="YOUR_SIGNATURE_KEY_HERE"

CURL='curl -s'
echo
echo "# GET  Main -> /"
echo "#################################################"
$CURL $host_url/


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
echo "# POST Playbook -> /playbook"
echo "#################################################"
n="play#id@project"
h="127.0.0.1"
f="playbook.yml"
e="$PWD/data/myextravars.yml"
some_variable="Here_I_AM"

playbook_post_data()
{
  # MD5 supported, but not recommended:
  #s=`echo -n $n$m$t$key|md5sum|cut -d' ' -f1`
  s=`echo -n $n$h$f$key|sha256sum|cut -d' ' -f1`
  cat <<EOF
{
  "n":"$n",
  "h":"$h",
  "f":"$f",
  "s":"$s",
  "e":"$e",
  "v_some_variable":"$some_variable",
  "c_cmd1":"-e \"@$PWD/data/myextravars1.yml\""
}
EOF
}

$CURL --data "$(playbook_post_data)" -H "Content-Type: application/json" -X POST $host_url/playbook | json_pp

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
echo "# Message ->  /message (needs ws_sub to be defined?)"
echo "#################################################"

echo
echo "# GET  NonBlockTest -> /test"
echo "#################################################"
