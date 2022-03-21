# TD Minikube
The purpose of this repo is to provide documentation and configuration for deploying the tech demo stack into a local minikube cluster

## Prerequisites
1. Install [Minikube](https://minikube.sigs.k8s.io/docs/start/)
2. Install Skaffold

## Running

`minikube start --memory=8000m --cpus=4`
`minikube addons enable metrics-server`
`minikube addons enable dashboard`
`eval $(minikube docker-env)`

### Namespace

```
{
  "apiVersion": "v1",
  "kind": "Namespace",
  "metadata": {
    "name": "local",
    "labels": {
      "name": "local"
    }
  }
}
```

## Deploying

helm install td-postgres ./helm/td-postgres -f ./helm/td-postgres/values-minikube-local.yaml -n local

helm install td-grid-hub ./helm/td-grid-hub -f ./helm/td-grid-hub/values-minikube-local.yaml -n local

helm install td-grid-chrome ./helm/td-grid-chrome -f ./helm/td-grid-chrome/values-minikube-local.yaml -n local

## Mock Secrets

````
kubectl -n local create secret generic s3-aws-creds \
  --from-literal=key=123 \
  --from-literal=secret=123 \
  --from-literal=region=123 \
  --from-literal=bucket=123
````

