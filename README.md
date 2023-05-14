## Docker Image-Builder Runner

This project intent to run image-builder Ansible roles on a Ubuntu 20.04 OCI image. Project is a sandbox.

### Building the container

```
$ docker build -t base_build .
```

### Run the container

```
$ docker run -dit --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro --name test base_build
```

### Run ansible playbook

```
$ ansible-playbook -vvv --extra-vars "python_path=/usr/bin/python packer_builder_type=vmware" node.yml
```
