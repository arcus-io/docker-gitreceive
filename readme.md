# gitreceive (https://github.com/progrium/gitreceive)

* `docker build -t gitreceive .`
* `docker run gitreceive`

Add a user with public key
* `cat /path/to/key.pub | ssh -i sshkey root@<DOCKER_HOST> -p <CONTAINER_PORT> "gitreceive upload-key <username>"`

Ports

* 22 (ssh)
