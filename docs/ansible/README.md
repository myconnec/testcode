 # Ansible

## Common Commands

### Init

Make sure Ansible is installed.

### Execute playbooks

Optional global exports:

```bash
export ANSIBLE_NOCOWS=1
export ANSIBLE_DEBUG=0
export ANSIBLE_HOST_KEY_CHECKING=0
export ANSIBLE_STDOUT_CALLBACK=minimal
```

Playbook execution:

'${self.public_ip},'

```bash
ansible-playbook -i '$(terraform output EC2_web_host_ip),' -u ubuntu --private-key ~/.ssh/aws-connechub-test-dje2.pem  ./docs/ansible/ror.yml
```