# Development

For active application development we use a local VM of the same OS version used in production.

Currently this is Ubuntu 16.04 server with all system updates.

## Build

- [Create a Ubuntu 16.04 VM](http://releases.ubuntu.com/16.04/)
- [If you use VirtualBox (recommended), adding the guest addons is helpful.](https://docs.bitnami.com/virtual-machine/faq/configuration/install-virtualbox-guest-additions/)
- [Be sure to add a bridged NIC and get the guest VM's IP address.](https://www.youtube.com/watch?time_continue=5&v=5BsShkcweIs)
  - [Enable SSH connection](http://ubuntuhandbook.org/index.php/2016/04/enable-ssh-ubuntu-16-04-lts/)
- [Mount the repository dir into the VM @ /{USER}/connechub](https://help.ubuntu.com/community/VirtualBox/SharedFolders)

## Provision

Now execute the Ansible playbook against the VM.

```sh
ansible-playbook \
-i "10.0.0.11," \
-u ubuntu \
--extra-vars='{
    "ansible_user": "ubuntu",
    "ansible_ssh_pass": "ubuntu",
    "ansible_sudo_pass": "ubuntu",
    "APP_ENV": "'${APP_ENV}'",
    "STAGE": "'${STAGE}'",
    "AWS_REGION": "'${AWS_REGION}'",
    "SSH_KEY_ID": "'${SSH_KEY_ID}'",
    "database_address": "'$(terraform output database_address)'",
    "media_profile_bucket_id": "'$(terraform output media_profile_bucket_id)'"
}' \
./ansible/web_app.yml
```

## Logging

```sh
```

## Destory

Stop and delete the VM :).
