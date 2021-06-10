# Portofolio Website using Django and deploy on KUBERNETES

 Created using django, template by dennisivy, created and modify by Laurentius Nathaniel.
 
 ### https://nathann.site

# This is web-nathan container image for testing only!

you can use environment variable that defined on ./env/.env.dev

```bash
vi ./env/.env.dev
```

you can configure the EMAIL variable for smtp on this website

# DOCKER-COMPOSE
you can use docker compose to create django and postgress container

## Clean Up the compose
```bash
docker-compose down -v
```
### Build the image and running with docker-compose
```bash
docker-compose build
docker-compose up -d
```
### and now see the logs of the container
```bash
docker-compose logs
```
## Access the web
```bash
localhost:8000
```

# KUBERNETES
#### Docker Image : launathiel/webnathan-django-public:1.0

## Configuration

create config for django environment and secret for connecting postgres database to django.
```bash
kubectl apply -f kubernetes/configmap.yaml
kubectl apply -f kubernetes/secret.yaml
```

## Deploy Postgresql
### Create PV and PVC for postgres volume
```bash
kubectl apply -f kubernetes/postgres/pv.yaml
kubectl apply -f kubernetes/postgres/pvc.yaml
```
### Create Postgres Deployment
```bash
kubectl apply -f kubernetes/postgres/postgres.yaml
```
and now, expose postgres with clusterip service
```bash
kubectl apply -f kubernetes/postgres/postgres-svc
```
## Deploy Django 
### Create PV and PVC for django volume
```bash
kubectl apply -f kubernetes/django/pv.yaml
kubectl apply -f kubernetes/django/pvc.yaml
```
### Create Django Deployment
```bash 
kubectl apply -f kubernetes/django/django.yaml
```
### Expose Django Deployment using ClusterIP service 
```bash
kubectl apply -f django-svc.yaml
```

And now django with posgresql already deployed on your kubernetes cluster!


