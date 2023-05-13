.PHONY: build run

build:
	docker build -t base_build .

run: build
	docker run -d --name systemd-ubuntu --tmpfs /tmp --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro base_build

delete:
	docker rm -f systemd-ubuntu

playbook:
	ansible-playbook -vvv --extra-vars "python_path=/usr/lib/python packer_builder_type=vmware" node.yml
