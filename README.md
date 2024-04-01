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
* global_domain : nginx ssl 인증서를 생성하는 루트 도메인 

#### nginx install
`ansible-playbook ./playbooks/podman-nginx-role.yml -e host_vars=myserver1 -e targets=cert -e global_domain=example.com -i hosts`
* global_domain : 서브 도메인을 연결하는 루트 도메인

#### nginx add sub domain

`ansible-playbook ./playbooks/podman-nginx-role.yml -e host_vars=myserver1 -e targets=service -e global_domain=example.com -i hosts`
* global_domain : 서브 도메인을 연결하는 루트 도메인
* 위 명령어 실행전에 playbooks/roles/podman-nginx/vars/nginx_services.yml에 필요한 내용 추가 필요

#### jenkins install
`ansible-playbook ./playbooks/podman-jenkins-role.yml -e host_vars=myserver1 -e targets=install -e jenkins_http_port=8080 -e jenkins_inbound_tcp_port=50000 -i hosts`
* jenkins_inbound_tcp_port : 외부에서 접근 가능한 jenkins tcp inbound port. optional
* jenkins_http_port : 외부에서 http 프로토콜로 접근할 수 있는 port. optional