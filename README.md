## Building the container

```
$ docker build -t base_build .
```

## Run the container

```
$ docker run -dit --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro --name test base_build
```

## Run ansible playbook

```
$ ansible-playbook -vvv --extra-vars "python_path=/usr/bin/python packer_builder_type=vmware" node.yml
```
