# freebsd-vagrant/packer/Makefile

build: clean
	packer build -only=virtualbox-iso -var-file=freebsd121.json freebsd.json

validate:
	packer validate -only=virtualbox-iso -var-file=freebsd121.json freebsd.json

clean:
	rm -rf output-*-virtualbox-iso/
	rm -rf packer_cache/
