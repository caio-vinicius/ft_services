# ft_services

Consists of the installation and configuration of several containerized services within a kubernetes cluster with access via Loadbalancer. Services include LEMP stack, TI~~CK~~ stack and others services like FTPS and Lighttpd with WordPress.

## Installation 

This project requires [Docker](https://docs.docker.com/engine/install/), [Minikube](https://minikube.sigs.k8s.io/docs/start/) and [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/).

Now, you need clone the repository:

```bash
$ git clone https://github.com/caio-vinicius/ft_services
```

### Ubuntu

If you are using Ubuntu, you can use the installation script that comes with the project to install all the necessary things.

```bash
$ ./setup.sh
```

Depending on your connection, this process may take a while to complete. That's it!

## Usage

After installing, your browser will open up on Kubernetes Dashboard. If didn't, you can try

```bash
$ minikube dashboard
```

![Kubernetes Dashboard](https://github.com/caio-vinicius/ft_services/blob/media/1.png)

In this dashboard, you can view all the Pods (and many other things haha) that are working and providing the services of the cluster. 

To see a service working, you must scroll down until you find the "Services" section. This section shows which IP and port a specific service is published on and you can access a specific IP to be able to view the service.

![Kubernetes Dashboard Services](https://github.com/caio-vinicius/ft_services/blob/media/2.png)

And, for example, you can check out Grafana service:

![Grafana](https://github.com/caio-vinicius/ft_services/blob/media/3.png)

There are several other services that can be accessed, feel free to see them :).

## Diagram

![Diagram](https://github.com/caio-vinicius/ft_services/blob/media/4.jpg)
