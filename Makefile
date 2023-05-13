.PHONY: build run

build:
	docker build -t base_build .

delete:
	docker rm -f systemd-ubuntu

run: build delete
	docker run -d --name systemd-ubuntu --tmpfs /tmp --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro base_build


playbook:
	ansible-playbook -vvv --extra-vars "python_path=/usr/lib/python packer_builder_type=vmware packer_build_name=" node.yml
