# ansible-api v0.5.1

A restful http api for ansible
python version >= 3.7

## What is it?

[Ansible](https://github.com/ansible/ansible/) is a radically simple IT automation system.
If you are trying to use it and not like CLI, you can try me now. I can provide you use ansible by A RESTful HTTP Api and a realtime processing message (websocket api), you can see all details.

## Changelog
  + added shell script demonstrating the tool
  + Fix bug in tool.py, which did not respect log_file placement setting in api.cfg
- 0.5.1 
  + add sha256 encryption support for signature (thx: jbackman)
  + fit for latest ansible(v2.8.6) and ansible-runner(v1.4.2)
  + add more error event capture in response
- 0.5.0 replace tornado with sanic, more lightly (python>=3.7) 
- 0.3.0 using ansible-runner as middleware
- 0.2.6 adaptive ansible 2.6.4 and add asynchronization mode
- 0.2.2 optimize log
- 0.2.1 optimize log and allow mutil-instance in the same host
- 0.2.0 support websocket, remove code invaded in ansible

## Structure chart

![image](https://github.com/lfbear/ansible-api/raw/master/data/structure.png)

## How to install

- [preparatory work] python version >= 3.7 (use asyncio featrue)
- ```pip3 install ansible-api```
- Not this will not necessarily install the GitHub latest version.
- Better to install `ansible_runner`, then clone the git repo:
-  ```pip3 install ansible-runner```

## How to start it

- default configuration: /etc/ansible/api.cfg
- start: 
```
ansible-api -c [Configfile, Optional] -d [Daemon Mode, Optional]
```
eg: ansible-api -c /etc/ansible/api.cfg -d > /dev/null &

## How to prepare your data

[HTTP API Usage](https://github.com/lfbear/ansible-api/wiki/http-api-usage)

## Demonstration:
Look into `api_demo.sh` to see an example.
