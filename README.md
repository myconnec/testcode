# Connechub

## The Game Plan

Phase 1: Make it work

Phase 2: Make it right <- we are here

Phase 3: Make it fast

## Documentation

All documentation is availalbe under the ./docs directory.

- [Toolchain](./docs/toolchain.md)
- [Additional Information](./docs/additiona.dm)
- [Deployment](./docs/deployment.md)
- [Initial Setup](./docs/initial_setup.md)

## TODO

After provisioning the application via Terraform;
- mount the remote FS onto the local development machine
- during editing, commit and push locally to remote repo

## ENVs

### Development

./helpers/terraform/start.sh
./helpers/ansible/init.sh
./helpers/ssh...
rake db:setup
rake db:migrate
New terminal
./helpers/onchange.sh
