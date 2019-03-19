 # Ansible

## Common Commands

### Init

Optional config settings

```bash
export ANSIBLE_DEBUG=true
export ANSIBLE_COWSAY=false
export ANSIBLE_STDOUT_CALLBACK=debug
export ANSIBLE_HOST_KEY_CHECKING=false
```

Execute playbooks

```bash
ansible-playbook -i '3.18.171.81,' -u ubuntu --private-key ~/.ssh/aws-connechub-key.pem  ./docs/ansible/ror.yml -v
```