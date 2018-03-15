# testing development in django + docker

This is a sample project using:
- Python 3,
- Django 2,
- Pipenv,
- Docker.

It was done mostly following this guide: https://semaphoreci.com/community/tutorials/dockerizing-a-python-django-web-application

To run, do the following: first create and set up a VM to run things on (unless you already have one, in which case skip this):

```bash
# create a VM to run things on (unless you already have one)
docker-machine create ddt-dev --driver virtualbox --virtualbox-disk-size "5000" --virtualbox-cpu-count 2 --virtualbox-memory "4096"
# (OSX only) make sure that port 8000 of the VM is visible from the host
VBoxManage controlvm "ddt-dev" natpf1 "tcp-port8000,tcp,,8000,,8000";
```

Then, build the docker image and run it:
```
# build the Docker image
docker build -t ddt .

# run the container
docker run -it -p 8000:8000 ddt
```
