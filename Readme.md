# SciLifeLab Course: Quick and clean
# - advanced Python for data science in biology

https://www.scilifelab.se/events/advanced-python-gbgvt17/

conda create -n py35 python=3.5 anaconda
[source] activate py35 #only activate on Win
source deactivate


## "Complicated" way

Alternatively, only if you are familiar with Docker, you can opt to run 
this as a Docker container. You have to install Docker on your machine.
You can then download my container:

`$ docker pull grokkaine/pycourse
`

Once you have the container, run it with (from the project git root):

`$ docker run --rm -p 8888:8888 -v /$(pwd):/home/jovyan/ grokkaine/pycourse
`

That is making a port forwarding, opening your localhost to the docker client
at port 8888. Also your local folder is now mounted to the Docker client. So
all you do now is open a web browser at [http://localhost:8888/tree](http://localhost:8888/tree).

It is messy to work with containers, so here is a small reminder on how to
cleanup:

```
$ docker ps -a
$ docker stop <container_id>
$ docker rm <container_id>
# check again to make sure you are clean
$ docker ps -a

# once you deleted all running containers, delete the images
$ docker images
# choose what you delete
$ docker rmi -f <image_id>
# check again to make sure you are clean
$ docker images
```


# Run the jupyter/scipy-notebook container:

```
docker run -d -p 8888:8888 jupyter/scipy-notebook
```

Now go to [http://localhost:8888/tree] to see it in action.

While the scipy stack is pretty solid (see [1]), unfortunately pytables
needs to be installed.

[1]:https://github.com/jupyter/docker-stacks/blob/master/scipy-notebook

To stop it:

```
$ docker ps -a
# copy the container id
$ docker stop <container_id>
```


# Create your own container

Go to your source root directory, containing the Dockerfile, and run:

```
$ docker build -t pycourse .
$ docker run -d -p 8888:8888 pycourse
```

Now go to (http://localhost:8888/tree), open a Python 3 document and run
`import tables` in a code cell. Voila!

To get an interactive console, do this:

```
$ sudo docker exec -it pycourse /bin/bash
```

To copy one file from/to the docker container:

```
$ docker cp 6fe37b4b7062:/home/jovyan/work/test.ipynb test.ipynb
```

Otherwise we can just mount the local (host) folder to the docker client
at run time.

```
$ docker run -rm -d -p 8888:8888 -v /$(pwd):/home/jovyan/work/ pycourse
$ docker ps -a
# get container_id
$ sudo docker exec -it <container_id> /bin/bash
```
