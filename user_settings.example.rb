# coding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

USER_SETTINGS = {
  # os
  hostname: 'freebsd-vagrant.local',
  # network
  ip_address: '192.168.10.34',
  ip_netmask: '255.255.255.0',
  bridge: 'en1: Wi-Fi (AirPort)',
  ## following variables required by ansible
  user_name: 'vagrant',
  # git
  git_user_name: '<< your name >>',
  git_user_email: '<< your email >>',
  ansible_skip_tags: []
}
