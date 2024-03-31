# ansible_playbooks
Personal ansible playbooks

## marks
* elastic search installation is not optimal
    * it install successfully but do no configuration

## usage

### add host
```
[myserver_all]
myserver1 ansible_host=192.168.128.1 ansible_ssh_private_key_file=~/path/to/ssh/private.key

[oracle_all:vars]
ansible_user=myUserName
```

### run playbook
#### nginx create self signed certificate
`ansible-playbook ./playbooks/podman-nginx-role.yml -e host_vars=myserver1 -e targets=install -e global_domain=example.com -i hosts`

#### nginx install
`ansible-playbook ./playbooks/podman-nginx-role.yml -e host_vars=myserver1 -e targets=cert -e global_domain=example.com -i hosts`
