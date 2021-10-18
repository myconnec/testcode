# Connechub - Web App

## Badges

n/a

## Description

The core web app of ConnecHub. This is the application logic, associated testing configurations, and web framework dependency definitions.

## Purpose

## Functionality

Respond to HTTP/S requests for ConnecHub web assets.

### Disable Debug Hidding

In `./app/controllers/application_controller.rb` comment out the `around_filter` line. This will disable debug hiding site wide.

## Special Features

n/a

## Table of Contents

- [Connechub - Web App](#connechub---web-app)
  - [Badges](#badges)
  - [Description](#description)
  - [Purpose](#purpose)
  - [Functionality](#functionality)
    - [Disable Debug Hidding](#disable-debug-hidding)
  - [Special Features](#special-features)
  - [Table of Contents](#table-of-contents)
  - [Contributing](#contributing)
    - [Code of Conduct](#code-of-conduct)
    - [Contributing Guidelines](#contributing-guidelines)
    - [Development Documentation - Toolchain](#development-documentation---toolchain)
  - [Requirements](#requirements)
  - [How to](#how-to)
    - [Obtain](#obtain)
  - [Versioning](#versioning)
  - [Contributors](#contributors)
  - [Additonal Information](#additonal-information)

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

## Requirements

- AWS account with:
  - An admin user access
  - **Full Admin** API credentials
- AWS CLI
- Linux Terminal
- Terraform

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

## Contributors

## Additonal Information

- Adding visual aids to any / all the above sections above is recommended.
- [Contributes](##Contributors) sources from [all-contributors](https://github.com/all-contributors/all-contributors).
- [ROADMAP](./ROADMAP.md) example from [all-contributors/all-contributors](https://github.com/all-contributors/all-contributors/blob/master/MAINTAINERS.md).
- Based on [README Maturity Model](https://github.com/LappleApple/feedmereadmes/blob/master/README-maturity-model.md); strive for a Level 5 `Product-oriented README`.
- This Code of Conduct is adapted from the [Contributor Covenant](https://www.contributor-covenant.org), version 2.0, available at https://www.contributor-covenant.org/version/2/0/code_of_conduct.html.
- [CONTRIBUTING.md](./CONTRIBUTING.md) is based on the [Ruby on Rails Contributing](https://github.com/rails/rails/blob/master/CONTRIBUTING.md) document, credit is due to them.
- [LICENSE](./LICENSE.md) sources from:
  - [https://choosealicense.com](https://choosealicense.com)
  - [https://en.wikipedia.org/wiki/All_rights_reserved](https://en.wikipedia.org/wiki/All_rights_reserved)
- [SECURITY.md](./SECURITY.md) based from [ISARA Radiate Security Solution Suite 2.0 Security Issues](https://github.com/isaracorp/Toolkit-Samples/edit/master/SECURITY.md).
