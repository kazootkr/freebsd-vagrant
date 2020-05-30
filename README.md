# freebsd-vagrant

Run FreeBSD provisioning with ansible on vagrant.

[![License](https://img.shields.io/badge/License-BSD%202--Clause-orange.svg)](https://opensource.org/licenses/BSD-2-Clause) [![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-yellow.svg)](https://conventionalcommits.org)

## Getting Started

Building FreeBSD on zfs using packer, run it on virtualbox.

### Prerequisites

- macOS host
- virtualbox
- packer (optional)

### Usage

Register vagrant-box required by vagrantfile.

```shell script
./tools/add-vagrant-box.sh
```

Place user config file

```shell script
cp user_settings.example.rb user_settings.rb
```

Run vm

```shell script
vagrant up
```
