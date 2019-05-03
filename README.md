# Introduction

This image allows you to run a container for an Ansible controller.

You should bind mount the directory containing your Ansible playbooks and ssh
keys to the directory **/home/ansible**.

NOTE: The container is run as the user **ansible** who has been added to the
sudoers file with a no password prompt.

An example of using this container is as follows:

```
docker container run --rm -it \
                     --mount type=bind,src=$(pwd),target=/home/ansible \
                     blackeyetechnology/ansible
```

**bash** is the default command, which this will bring you to a bash prompt
where you can run your Ansible commands.

# ttydsecure

This image is based on **ttydsecure** which helps make securing the terminal
connection to the browser with **ttyd** a little easier.

See [ttydsecure](https://hub.docker.com/r/blackeyetechnology/ttydsecure) for
more details on ttydsecure and how to configure it.

An example of using ttydsecure is as follows:

```
docker container run --rm -it \
                     --mount type=bind,src=$(pwd),target=/home/ansible \
                     -e TTYD_USER=ansible \
                     -e TTYD_PASSWD=secretpassword \
                     blackeyetechnology/ansible ttydsecure
```
