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
# export ANSIBLE_STDOUT_CALLBACK=debug
```

Playbook execution:

```bash
ansible-playbook -i '3.18.238.21,' -u ubuntu --private-key ~/.ssh/aws-connechub-test-dje2.pem  ./docs/ansible/ror.yml
```