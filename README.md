# Inception

## What are Containers ?

Containers are an abstraction at the app layer that packages code and dependencies together. Multiple containers can run on the same machine and share the OS kernel with other containers, each running as isolated processes in user space. Containers take up less space than VMs (container images are typically tens of MBs in size), can handle more applications and require fewer VMs and Operating systems.

## What are Virtual Machines ?

Virtual machines (VMs) are an abstraction of physical hardware turning one server into many servers. The hypervisor allows multiple VMs to run on a single machine. Each VM includes a full copy of an operating system, the application, necessary binaries and libraries – taking up tens of GBs. VMs also slow to boot.

## Why Docker and What is the problem that is solving ?

- so let’s imagine a scenario pre docker era we have tester and developer and the developer

has just the code and its works perfectly fine on there system but when the tester take the code the test it in his machine its just doesn’t work and the reason could be a lot of thing it it might be the tester need some dependencies need to be installed in order for the code to work properly or some environnement variables needed to be added but they don’t exist it the tester machine. that means we found the problem how can we solve it ?

### Here When Docker Comes Into Place.

but you can be asking your self why not use virtual machine it might be good idea but it has alot of cons so let’s take look on differences between docker and VM’s

---

| Virtual Machine | Docker |
| --- | --- |
| Occupy a lot of memory space | Occupy a lot less memory space |
| long time to boot up | quick boot up because it uses the running kernel that you using |
| Difficult to scale up | super easy to scale |
| low efficiency | high efficiency |
| volumes storage cannot be shared across the VM’s  | volumes storage can be shared across the host and the containers |

![https://www.docker.com/wp-content/uploads/2021/11/container-what-is-container.png.webp](https://www.docker.com/wp-content/uploads/2021/11/container-what-is-container.png.webp)

- **Infrastructure** **:** it’s our computer components like our CPU and Hard Disk and other physical components.
- **Host Operating System :**  Its the OS that our computer is working on like linux or mac os or even windows
- **Docker engine :** this is where the magic happens docker engine is the base engine installed in the host machine to build and run containers using docker components and services, it uses
- **App :** is the container that is running in isolation on the other containers

# Let’s go deeper on how Docker Engine works in details.

The Docker engine is the core component of Docker. It is a lightweight runtime and packaging tool that bundles your application and its dependencies into a single package, called a container. The Docker engine includes the Docker daemon, which is a background process that manages Docker containers, and the Docker client, which is a command-line tool that allows you to interact with the Docker daemon.

Here's how the Docker engine works:

1. You write a Dockerfile, which is a text file that contains the instructions for building a Docker image. A Docker image is a lightweight, stand-alone, executable package that includes everything needed to run a piece of software, including the application code, libraries, dependencies, and runtime.
2. You use the Docker client to build the Docker image by running the **`docker build`** command and specifying the path to the Dockerfile. The Docker daemon reads the instructions in the Dockerfile and builds the image.
3. Once the image is built, you can use the Docker client to run the image as a container by using the **`docker run`** command. The Docker daemon creates a container from the image and runs the application inside the container.
4. The Docker engine provides a secure and isolated environment for the application to run in, and it also manages resources such as CPU, memory, and storage for the container.
5. You can use the Docker client to view, stop, and manage the containers running on your system. You can also use the Docker client to push the Docker image to a registry, such as Docker Hub, so that it can be shared with others.

# DOCKERFILE

- A Dockerfile is a text file that contains the instructions for building a Docker image. It specifies the base image to use, the dependencies and software to install, and any other configurations or scripts that are needed to set up the environment for the application to run.

- A Docker Compose file is a YAML file that defines how multiple Docker containers should be set up and run. It allows you to define the services that make up your application, and then start and stop all of the containers with a single command.

Here are some key differences between a Dockerfile and a Docker Compose file:

1. Purpose: A Dockerfile is used to build a single Docker image, while a Docker Compose file is used to define and run multiple Docker containers as a single application.
2. Format: A Dockerfile is a plain text file with a specific format and syntax, while a Docker Compose file is written in YAML.
3. Scope: A Dockerfile is focused on building a single image, while a Docker Compose file is focused on defining and running multiple containers as a single application.
4. Commands: A Dockerfile uses specific commands, such as **`FROM`**, **`RUN`**, and **`CMD`**, to define the instructions for building the image. A Docker Compose file uses different commands, such as **`services`**, **`volumes`**, and **`networks`**, to define the containers and how they should be set up and run.

- Here is a brief explanation of some of the keys mentioned above.

1. **`FROM`**: This is a command that is used in a Dockerfile to specify the base image to use as the starting point for building the Docker image. The base image provides the foundational layers for the image, and you can then add additional layers on top of it to customize the image for your specific needs.
2. **`RUN`**: This is a command that is used in a Dockerfile to execute a command in the terminal of the container. It is typically used to install software or libraries that are needed by the application.
3. **`CMD`**: This is a command that is used in a Dockerfile to specify the default command that should be run when a container is started from the image. It is used to specify the main command that the container should run when it is started.
4. **`services`**: This is a key in a Docker Compose file that is used to define the services that make up your application. A service is a container that runs a specific application or component of your application.
5. **`volumes`**: This is a key in a Docker Compose file that is used to define the persistent storage for your application. A volume is a piece of storage that is attached to a container and is used to store data that should persist even when the container is stopped or removed.
6. **`networks`**: This is a key in a Docker Compose file that is used to define the networks that the containers should be connected to A network is a virtual network that is used to connect containers and allow them to communicate with each other.


## DOCKER COMPOSE

Docker Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application's services. Then, using a single command, you can create and start all the services from your configuration.

Using Docker Compose can simplify the process of managing multi-container applications by allowing you to define all of your services in a single place and easily start and stop them. It also makes it easy to scale your application by allowing you to increase or decrease the number of replicas of a service.

## DOCKER NETWORKS

In Docker, a network is a virtual software defined network that connects Docker containers. It allows containers to communicate with each other and the outside world, and it provides an additional layer of abstraction over the underlying network infrastructure.

There are several types of networks that you can create in Docker, including:

- Bridge: A bridge network is the default network type when you install Docker. It allows containers to communicate with each other and the host machine, but provides no access to the outside world.
- Host: A host network uses the host machine's network stack and provides no isolation between the host and the container.
- Overlay: An overlay network allows containers running on different Docker hosts to communicate with each other.
- Macvlan: A Macvlan network allows a container to have its own IP address on the same subnet as the host machine.

You can create and manage networks using the **`docker network`** command. For example, to create a new bridge network, you can use the following command:

`docker network create my-network`

- ressources for docker network : [https://www.youtube.com/watch?v=bKFMS5C4CG0](https://www.youtube.com/watch?v=bKFMS5C4CG0)

## DOCKER VOLUMES

In Docker, a volume is a persistent storage location that is used to store data from a container. Volumes are used to persist data from a container even after the container is deleted, and they can be shared between containers.

There are two types of volumes in Docker:

- Bind mount: A bind mount is a file or directory on the host machine that is mounted into a container. Any changes made to the bind mount are reflected on the host machine and in any other containers that mount the same file or directory.
- Named volume: A named volume is a managed volume that is created and managed by Docker. It is stored in a specific location on the host machine, and it is not tied to a specific file or directory on the host. Named volumes are useful for storing data that needs to be shared between containers, as they can be easily attached and detached from containers.

You can create and manage volumes using the **`docker volume`** command. For example, to create a new named volume, you can use the following command:

```bash
docker volume create my-volume
```

To mount a volume into a container, you can use the **`-v`** flag when starting the container. For example:

```bash
docker run -v my-volume:/var/lib/mysql mysql
```

This command will start a container running the **`mysql`** image and mount the **`my-volume`** volume at **`/var/lib/mysql`** in the container. Any data written to this location in the container will be persisted in the volume, even if the container is deleted.

You can also use Docker Compose to create and manage volumes. In a Compose file, you can define a volume and attach it to a service. For example:

```yaml
version: '3'
services:
  db:
    image: mysql
    volumes:
      - db-data:/var/lib/mysql
volumes:
  db-data:

```

This Compose file defines a **`db-data`** volume and attaches it to the **`db`** service at **`/var/lib/mysql`**. Any data written to this location in the container will be persisted in the volume.

# MANDATORY PART

## **Mariadb**

MariaDB is a free and open-source relational database management system (RDBMS) that is widely used as a drop-in replacement for MySQL. It is named after the developer's daughter, Maria, and is designed to be a community-driven alternative to MySQL, with a focus on simplicity, collaboration, and compatibility with other database systems.

MariaDB includes a number of additional features and improvements over MySQL, including better performance, enhanced security, and support for new storage engines and data types. It is also actively developed and supported by a large and active community of users and developers.

---

# Wordpress

WordPress is a content management system (CMS) based on PHP and MySQL. It is an open-source platform that is widely used for building websites, blogs, and applications. With WordPress, users can easily create and manage their own websites without the need for advanced technical skills. It is known for its simplicity and flexibility, making it a popular choice for both beginners and experienced developers. WordPress has a large community of users and developers who contribute to the platform, which has led to the development of a wide range of themes, plugins, and other tools that can be used to extend the functionality of WordPress websites.

- **Before We dive into Installation part you need to know about fastCGI because it pretty importing in our case.**

## FastCGI

FastCGI (Fast Common Gateway Interface) is a protocol that allows web servers to communicate with web applications, such as PHP scripts. It is designed to allow web servers to execute scripts in a more efficient way than traditional CGI (Common Gateway Interface) protocols, which involve starting a new process to execute each script.

PHP-FPM (FastCGI Process Manager) is an implementation of the FastCGI protocol specifically designed for use with PHP. It works by starting a pool of worker processes that are responsible for executing PHP scripts. When a web server receives a request for a PHP script, it passes the request to one of the worker processes, which then executes the script and returns the result to the web server. This allows PHP scripts to be executed more efficiently, as the worker processes can be reused for multiple requests.

PHP-FPM is often used as an alternative to mod_php, which is an Apache module that embeds the PHP interpreter directly into the Apache web server. Using PHP-FPM can improve the performance and scalability of PHP scripts, as it allows the web server and PHP to run in separate processes. It also allows for more fine-grained control over the PHP environment, as different pools of worker processes can be configured with different settings.

---

# Nginx

NGINX is a web server that can also be used as a reverse proxy, load balancer, and HTTP cache. It is known for its high performance, stability, and low resource consumption. NGINX is often used to handle server-side requests for web applications, and it can also be used to serve static content such as images and JavaScript files. In addition to its web server capabilities, NGINX can be configured to handle other types of network protocols, such as Secure Sockets Layer (SSL) and Transport Layer Security (TLS). It is often used in conjunction with other software, such as databases and content management systems, to build robust and scalable web applications.

### TLS (Transport Layer Security)

Transport Layer Security (TLS) is a security protocol that is used to establish secure communication between two parties over the internet. It is designed to prevent eavesdropping, tampering, and message forgery, and to provide authenticity and integrity for transmitted data. TLS is used to secure a wide range of internet-based applications, including web browsing, email, file transfer, virtual private networks (VPNs), and real-time communication systems.

TLS works by using public key encryption to establish a secure connection between two parties. When a client wants to communicate with a server using TLS, the client and server exchange a series of messages to establish a secure connection. This process includes the exchange of digital certificates and the negotiation of encryption keys. Once the connection is established, the client and server can communicate securely over the internet.

TLS is the successor to the Secure Sockets Layer (SSL) protocol, which was developed in the 1990s. TLS is based on SSL, but it has been updated to address a number of security vulnerabilities that were discovered in SSL. TLS is now the de facto standard for secure communication on the internet, and it is used by millions of websites and applications to protect sensitive data.

### OpenSSL

OpenSSL is an open-source implementation of the Secure Sockets Layer (SSL) and Transport Layer Security (TLS) protocols. It is a widely used tool for working with SSL and TLS, and it is available for most operating systems.

OpenSSL can be used for a variety of tasks related to SSL and TLS, including:

- Creating and managing SSL/TLS certificates and private keys
- Setting up and configuring SSL/TLS-enabled servers
- Connecting to SSL/TLS-enabled servers as a client
- Debugging SSL/TLS connections
- Generating and signing digital certificates

OpenSSL is often used by system administrators and developers to secure communication between servers and clients, or to create secure tunnels for transmitting data over the internet. It is also used to create secure and encrypted connections for email, file transfer, and other types of internet communication.

