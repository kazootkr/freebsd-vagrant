# freebsd-vagrant/Makefile

default: deps run

run:
	vagrant rsync
	vagrant provision

deps:
	ansible-galaxy install -f -r provisioning/requirements.yml -p provisioning/roles

build.box:
	make -C packer build
	./tools/add-vagrant-box.sh

validate.box:
	make -C packer validate
