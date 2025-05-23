# Use

~~~bash
podman build -t pg_extension_build:latest . ; podman run --rm -it pg_extension_build
~~~

In the container, run :

~~~bash
su - postgres
/workspace/test.sh
~~~
