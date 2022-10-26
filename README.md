# Connechub - Web App

## Table of Contents

- [Connechub - Web App](#connechub---web-app)
  - [Table of Contents](#table-of-contents)
  - [Badges](#badges)
  - [Description](#description)
  - [Policies and Patterns](#policies-and-patterns)
  - [Project Structure](#project-structure)
  - [Contributing](#contributing)
    - [Code of Conduct](#code-of-conduct)
    - [Contributing Guidelines](#contributing-guidelines)
    - [Development Documentation - Toolchain](#development-documentation---toolchain)
  - [Requirements](#requirements)
  - [How to](#how-to)
    - [Obtain](#obtain)
  - [Versioning](#versioning)
  - [Additional Information](#additional-information)

## Badges

n/a

## Description

The core web app of ConnecHub. This is the application logic, associated testing configurations, and web framework dependency definitions.

## Policies and Patterns

- [AWS Resource Tagging Policy](./POLICIES_AND_PATTERNS.md)

## Project Structure

```sh
$ /path/to/projects/root/connechub
$ tree -L 1
.
├── application
├── **packer**
└── terraform

3 directories, 0 files
```

## Contributing

### Code of Conduct

Please see [CODE_OF_CONDUCT.md](./CODE_OF_CONDUCT.md).

### Contributing Guidelines

Please see [CONTRIBUTING_GUIDELINES.md](./CONTRIBUTING_GUIDELINES.md).

### Development Documentation - Toolchain

- [AWS CLI](https://aws.amazon.com) CLI interaction
- [Cypress](https://cypress.io) UAT tool
- [Puma](https://github.com/puma/puma) webserver
- [Ruby on Rails](https://rubyonrails.org) Web app framework
- [MySQL client](https://dev.mysql.com/downloads/installer/)

## Requirements

- AWS account with:
  - An admin user access
  - **Full Admin** API credentials
- AWS CLI
- Linux Terminal
- Terraform
  - Terragrunt
  - tfsec
  - terrascan

## How to

### Obtain

## Versioning

This project follows [SemVer 2.0](https://semver.org/).

```quote
Given a version number MAJOR.MINOR.PATCH, increment the:

1. MAJOR version when you make incompatible API changes,
2. MINOR version when you add functionality in a backwards compatible manner, and
3. PATCH version when you make backwards compatible bug fixes.

Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.
```

## Additional Information

- Adding visual aids to any / all the above sections above is recommended.
- Contributors sources from [all-contributors](https://github.com/all-contributors/all-contributors).
- [ROADMAP](./ROADMAP.md) example from [all-contributors/all-contributors](https://github.com/all-contributors/all-contributors/blob/master/MAINTAINERS.md).
- Based on [README Maturity Model](https://github.com/LappleApple/feedmereadmes/blob/master/README-maturity-model.md); strive for a Level 5 `Product-oriented README`.
- This Code of Conduct is adapted from the [Contributor Covenant](https://www.contributor-covenant.org), version 2.0, available at https://www.contributor-covenant.org/version/2/0/code_of_conduct.html.
- [CONTRIBUTING.md](./CONTRIBUTING.md) is based on the [Ruby on Rails Contributing](https://github.com/rails/rails/blob/master/CONTRIBUTING.md) document, credit is due to them.
- [LICENSE](./LICENSE.md) sources from:
  - [https://choosealicense.com](https://choosealicense.com)
  - [https://en.wikipedia.org/wiki/All_rights_reserved](https://en.wikipedia.org/wiki/All_rights_reserved)
- [SECURITY.md](./SECURITY.md) based from [ISARA Radiate Security Solution Suite 2.0 Security Issues](https://github.com/isaracorp/Toolkit-Samples/edit/master/SECURITY.md).
